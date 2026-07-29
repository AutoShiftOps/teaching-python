# PCEP Practice Tests — Deployment Guide
## Stack: GitHub repo → Vercel (host) · Supabase (auth + DB) · Google OAuth

---

## REPO STRUCTURE

```
teaching-python/
├── index.html          ← Full app — never hardcode keys here
├── manifest.json       ← Registry of test files
├── vercel.json         ← Vercel routing + JSON headers
├── .env.example        ← Template for local dev (safe to commit)
├── .gitignore          ← Keeps .env.local out of git
├── api/
│   └── config.js       ← Serverless function: serves keys from env vars
└── tests/
    ├── test1.json
    ├── test2.json
    ├── test3.json
    ├── test4.json
    ├── test5.json
    └── test6.json
```

---

## HOW ENV VARS WORK HERE

```
Vercel Dashboard
  → SUPABASE_URL & SUPABASE_ANON_KEY (set once, never in code)
       ↓
  api/config.js (serverless function)
       ↓  GET /api/config
  index.html (browser fetches this on load, initialises Supabase)
```

Your keys are **never in your repo, never in browser source**.
The Supabase anon key is safe to expose to browsers, but this pattern
is best practice and lets you rotate keys without touching code.

---

## STEP 1 — Supabase Project

1. Go to https://supabase.com → New project → name it `pcep-quiz`
2. Wait ~2 min for provisioning
3. SQL Editor → New query → paste and run `sql_migration.sql` (included in the repo).
   This is the single source of truth for all three tables (`test_results`,
   `pcep_progress`, `pcep_quiz_log`) — safe to run on a brand-new project or
   re-run on an existing one, since it guards every statement with
   `CREATE TABLE IF NOT EXISTS` / `ADD COLUMN IF NOT EXISTS` / `DROP POLICY IF EXISTS`.

   Quick version of just the `test_results` portion:

```sql
CREATE TABLE test_results (
  id            UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id       UUID NOT NULL,
  email         TEXT,
  test_id       INTEGER NOT NULL,
  score         INTEGER NOT NULL,
  total         INTEGER NOT NULL,
  percentage    INTEGER NOT NULL,
  passed        BOOLEAN NOT NULL DEFAULT false,
  answers       JSONB,
  completed_at  TIMESTAMPTZ DEFAULT now(),
  UNIQUE(user_id, test_id)
);

ALTER TABLE test_results ENABLE ROW LEVEL SECURITY;

CREATE POLICY "read own"   ON test_results FOR SELECT USING (auth.uid() = user_id);
CREATE POLICY "insert own" ON test_results FOR INSERT WITH CHECK (auth.uid() = user_id);
CREATE POLICY "update own" ON test_results FOR UPDATE USING (auth.uid() = user_id);
CREATE POLICY "delete own" ON test_results FOR DELETE USING (auth.uid() = user_id);
```

4. Settings → API → copy:
   - **Project URL** → `https://xxxxx.supabase.co`
   - **anon public key** → `eyJhbGci...`

---

## STEP 2 — Google OAuth

1. https://console.cloud.google.com → New project
2. APIs & Services → OAuth consent screen → External → fill app name
3. APIs & Services → Credentials → Create → OAuth Client ID → Web application
4. Authorised redirect URIs — add (you'll get the exact ref from Supabase):
   ```
   https://YOUR_PROJECT_REF.supabase.co/auth/v1/callback
   ```
5. Copy **Client ID** and **Client Secret**
6. Supabase → Authentication → Providers → Google → Enable → paste both

---

## STEP 3 — Deploy to Vercel

### Connect repo
1. https://vercel.com → New Project → Import Git Repository
2. Select `AutoShiftOps/teaching-python`
3. Framework preset: **Other**
4. Root directory: `/` (leave as default)
5. Click **Deploy** — it will fail on first deploy because env vars aren't set yet, that's fine

### Add environment variables
Vercel → Project → Settings → Environment Variables → add both:

| Name                | Value                                      | Environments        |
|---------------------|--------------------------------------------|---------------------|
| `SUPABASE_URL`      | `https://xxxxx.supabase.co`               | Production, Preview |
| `SUPABASE_ANON_KEY` | `eyJhbGci...`                             | Production, Preview |
| `APP_URL`           | `https://teaching-python.vercel.app`      | Production, Preview |

> `APP_URL` is used for Google OAuth redirect. Must exactly match the URL you add to Google OAuth origins and Supabase redirect URLs.

> If Google OAuth is already working in production without `APP_URL` set,
> the fallback (`req.headers.origin`) is handling it. `APP_URL` is optional
> but recommended for explicitness.

Then: Deployments → top deployment → Redeploy

### Your live URL
```
https://teaching-python.vercel.app
```
(or a custom domain you configure)

---

## STEP 4 — Update Google OAuth with Vercel URL

Google Cloud Console → Credentials → your OAuth Client → edit:
- Authorised JavaScript origins: `https://teaching-python.vercel.app`
- Authorised redirect URIs: `https://YOUR_PROJECT_REF.supabase.co/auth/v1/callback`

---

## STEP 5 — Update Supabase with Vercel URL

Supabase → Authentication → URL Configuration:
- Site URL: `https://teaching-python.vercel.app`
- Redirect URLs: `https://teaching-python.vercel.app`

---

## STEP 6 — Smoke test

1. Open `https://teaching-python.vercel.app`
2. Open browser DevTools → Network → look for `/api/config` → should return 200 with JSON
3. Click "Continue with Google" → sign in → redirected to dashboard
4. Take a test → finish → check Supabase Table Editor → row should appear in `test_results`
5. Refresh page → results should persist
6. Click "Reset all progress" → row deleted from Supabase

---

## LOCAL DEVELOPMENT

```bash
# Install Vercel CLI
npm i -g vercel

# Clone and enter repo
git clone https://github.com/AutoShiftOps/teaching-python.git
cd teaching-python

# Create local env file (gitignored)
cp .env.example .env.local
# Edit .env.local → paste your actual Supabase URL and anon key

# Run locally (serves index.html + api/config.js with env vars)
vercel dev
# Opens at http://localhost:3000
```

---

## ADDING / EDITING QUESTIONS (no Vercel changes needed)

| Task | What to do |
|------|-----------|
| Edit a question | Open `tests/testN.json`, change the text/options/answer, commit + push |
| Add a question | Add object to `questions[]` array in the right JSON file, commit + push |
| Add a new test | Create `tests/test7.json`, add path to `manifest.json`, commit + push |
| Remove a question | Delete the object from the array, commit + push |

Vercel auto-deploys on every push to `main`. Changes are live in ~30 seconds.

---

## TROUBLESHOOTING

| Symptom | Fix |
|---------|-----|
| `/api/config` returns 500 | Check env vars are set in Vercel dashboard and redeployed |
| Google sign-in redirect error | Confirm Vercel URL is in Google OAuth origins AND Supabase redirect URLs |
| Tests show "could not load" | Check `manifest.json` paths match actual filenames in `tests/` |
| Results don't save | Check Supabase RLS policies were created (Step 1 SQL) |
| Works locally but not on Vercel | Env vars not set — check Vercel → Settings → Environment Variables |

---

## WHAT ABOUT GitHub Pages?

GitHub Pages **cannot** run serverless functions (`api/config.js` won't work there).
It also runs Jekyll which interferes with JSON file serving.
Vercel is the right host for this app.

If you still want the repo listed under autoshiftops.com projects, that still works —
autoshiftops.com just links to it. The actual app runs on Vercel.

---

## PART C — Practice Mode Tables

`sql_migration.sql` (run once in Step 1) already creates both practice tables
alongside `test_results`:

- `pcep_progress` — one row per user (keyed by `user_id`), tracks streak / best scores / weak areas
- `pcep_quiz_log` — one row per attempt (exam and practice), with RLS policies

No separate file or second run is needed — Step 1's migration covers all three
tables in one pass. Verify in Table Editor — you should see all three tables:
`test_results`, `pcep_progress`, `pcep_quiz_log`.

### Tier 2 verification checklist (needs live credentials)
- [x] Sign in with Google OAuth
- [ ] Complete a practice drill → check `pcep_quiz_log` for a new row with `mode = 'practice'`
- [ ] Complete an exam → check `test_results` and `pcep_quiz_log` for rows
- [ ] Check `pcep_progress` for streak and weak_areas updates
- [ ] Click "Reset all progress" → confirm all three tables cleared for that user

---

## COSMETIC FIX — Practice results subtitle

In `index.html`, find `buildPracticeTest` and change:

```js
// Before
name: sourceTest.name   // shows "Test 1 — Python Fundamentals"

// After
name: pt.label          // shows "Fundamentals"
```

One line. Commit message: `fix: practice results subtitle uses topic label not exam name`

---

## DEPLOYMENT STATUS

| Item                        | Status         | Notes                              |
|-----------------------------|----------------|-------------------------------------|
| Vercel deployment           | ✅ Live        | teaching-python.vercel.app         |
| Google OAuth                | ✅ Working     | Verified in browser                |
| Supabase tables + RLS       | ✅ Done        | All 3 tables with user_id + RLS    |
| Practice mode (UI)          | ✅ Live        | 5 topic drills + 6 fixed exams     |
| Tier 2 (real user data)     | ⏳ Pending     | Run after first real login         |
| sql_migration.sql           | ✅ In repo     | Use for recreation                 |
