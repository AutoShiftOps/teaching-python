-- ============================================================
-- PCEP Quiz — Full Schema (Source of Truth)
-- ============================================================
-- Safe to run on:
--   • A brand new Supabase project (creates everything)
--   • An existing project (skips what exists, adds what's missing)
--
-- Tables:
--   1. test_results   — exam scores (one row per user per test)
--   2. pcep_progress  — practice progress (one row per user)
--   3. pcep_quiz_log  — every attempt log (exam + practice)
-- ============================================================


-- ── 1. test_results ──────────────────────────────────────────
-- Stores exam results. One row per user per test (upsert on conflict).

CREATE TABLE IF NOT EXISTS test_results (
  id            UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id       UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  email         TEXT,
  test_id       INTEGER NOT NULL,
  score         INTEGER NOT NULL,
  total         INTEGER NOT NULL,
  percentage    INTEGER NOT NULL,
  passed        BOOLEAN NOT NULL DEFAULT false,
  answers       JSONB,
  completed_at  TIMESTAMPTZ DEFAULT now(),
  UNIQUE (user_id, test_id)
);

ALTER TABLE test_results ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "read own results"   ON test_results;
DROP POLICY IF EXISTS "insert own results" ON test_results;
DROP POLICY IF EXISTS "update own results" ON test_results;
DROP POLICY IF EXISTS "delete own results" ON test_results;

CREATE POLICY "read own results"
  ON test_results FOR SELECT
  USING (auth.uid() = user_id);

CREATE POLICY "insert own results"
  ON test_results FOR INSERT
  WITH CHECK (auth.uid() = user_id);

CREATE POLICY "update own results"
  ON test_results FOR UPDATE
  USING (auth.uid() = user_id);

CREATE POLICY "delete own results"
  ON test_results FOR DELETE
  USING (auth.uid() = user_id);

CREATE INDEX IF NOT EXISTS idx_test_results_user
  ON test_results (user_id);


-- ── 2. pcep_progress ─────────────────────────────────────────
-- One row per user. Tracks streak, best scores, weak areas.
-- Upsert on user_id to keep a single running record.

CREATE TABLE IF NOT EXISTS pcep_progress (
  id              UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id         UUID NOT NULL UNIQUE REFERENCES auth.users(id) ON DELETE CASCADE,
  email           TEXT,
  streak          INTEGER NOT NULL DEFAULT 0,
  last_session    TIMESTAMPTZ,
  topics_done     JSONB NOT NULL DEFAULT '{}',
  quiz_scores     JSONB NOT NULL DEFAULT '{}',
  weak_areas      JSONB NOT NULL DEFAULT '[]',
  total_questions INTEGER NOT NULL DEFAULT 0,
  total_correct   INTEGER NOT NULL DEFAULT 0,
  updated_at      TIMESTAMPTZ DEFAULT now()
);

-- Add user_id if table existed before this column was introduced
ALTER TABLE pcep_progress
  ADD COLUMN IF NOT EXISTS user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE;

ALTER TABLE pcep_progress ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "read own progress"   ON pcep_progress;
DROP POLICY IF EXISTS "insert own progress" ON pcep_progress;
DROP POLICY IF EXISTS "update own progress" ON pcep_progress;
DROP POLICY IF EXISTS "delete own progress" ON pcep_progress;

CREATE POLICY "read own progress"
  ON pcep_progress FOR SELECT
  USING (auth.uid() = user_id);

CREATE POLICY "insert own progress"
  ON pcep_progress FOR INSERT
  WITH CHECK (auth.uid() = user_id);

CREATE POLICY "update own progress"
  ON pcep_progress FOR UPDATE
  USING (auth.uid() = user_id);

CREATE POLICY "delete own progress"
  ON pcep_progress FOR DELETE
  USING (auth.uid() = user_id);

CREATE INDEX IF NOT EXISTS idx_pcep_progress_user
  ON pcep_progress (user_id);


-- ── 3. pcep_quiz_log ─────────────────────────────────────────
-- Append-only log. One row per attempt (exam or practice).
-- Never upserted — every attempt is a new row.

CREATE TABLE IF NOT EXISTS pcep_quiz_log (
  id            UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id       UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  email         TEXT,
  mode          TEXT NOT NULL DEFAULT 'practice',
  topic         TEXT,
  score         INTEGER NOT NULL,
  total         INTEGER NOT NULL,
  percentage    INTEGER GENERATED ALWAYS AS
                  (ROUND((score::NUMERIC / NULLIF(total,0)) * 100)::INTEGER) STORED,
  passed        BOOLEAN GENERATED ALWAYS AS
                  (ROUND((score::NUMERIC / NULLIF(total,0)) * 100) >= 70) STORED,
  answers       JSONB,
  time_taken_s  INTEGER,
  taken_at      TIMESTAMPTZ DEFAULT now()
);

-- Add user_id if table existed before this column was introduced
ALTER TABLE pcep_quiz_log
  ADD COLUMN IF NOT EXISTS user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE;

ALTER TABLE pcep_quiz_log ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "read own log"   ON pcep_quiz_log;
DROP POLICY IF EXISTS "insert own log" ON pcep_quiz_log;
DROP POLICY IF EXISTS "delete own log" ON pcep_quiz_log;

CREATE POLICY "read own log"
  ON pcep_quiz_log FOR SELECT
  USING (auth.uid() = user_id);

CREATE POLICY "insert own log"
  ON pcep_quiz_log FOR INSERT
  WITH CHECK (auth.uid() = user_id);

CREATE POLICY "delete own log"
  ON pcep_quiz_log FOR DELETE
  USING (auth.uid() = user_id);

CREATE INDEX IF NOT EXISTS idx_pcep_quiz_log_user
  ON pcep_quiz_log (user_id, taken_at DESC);

CREATE INDEX IF NOT EXISTS idx_pcep_quiz_log_mode
  ON pcep_quiz_log (user_id, mode);


-- ── 4. Verify ────────────────────────────────────────────────
-- Run this after the migration. Should return 3 rows.

SELECT
  t.table_name,
  COUNT(c.column_name)            AS total_columns,
  BOOL_OR(c.column_name = 'user_id') AS has_user_id,
  obj_description(pc.oid, 'pg_class') IS NOT NULL AS rls_enabled
FROM information_schema.tables t
JOIN information_schema.columns c
  ON c.table_name = t.table_name AND c.table_schema = 'public'
JOIN pg_class pc
  ON pc.relname = t.table_name
WHERE t.table_schema = 'public'
  AND t.table_name IN ('test_results', 'pcep_progress', 'pcep_quiz_log')
GROUP BY t.table_name, pc.oid
ORDER BY t.table_name;

-- Expected:
-- pcep_progress  | 10 | true | true
-- pcep_quiz_log  | 10 | true | true
-- test_results   | 10 | true | true