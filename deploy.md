# PCEP Practice Tests — Deployment Guide
## Stack: Supabase (Auth + DB) · Google OAuth · Vercel

---

## STEP 1 — Create Supabase Project

1. Go to https://supabase.com → New project
2. Name it: `pcep-quiz`
3. Set a strong DB password, choose a region close to you
4. Wait ~2 minutes for provisioning

---

## STEP 2 — Create the Database Table

In Supabase → SQL Editor → New query, paste and run:

```sql
-- Results table
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

-- Row-Level Security: users can only see/edit their own rows
ALTER TABLE test_results ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Users can read own results"
  ON test_results FOR SELECT
  USING (auth.uid() = user_id);

CREATE POLICY "Users can insert own results"
  ON test_results FOR INSERT
  WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can update own results"
  ON test_results FOR UPDATE
  USING (auth.uid() = user_id);

CREATE POLICY "Users can delete own results"
  ON test_results FOR DELETE
  USING (auth.uid() = user_id);
```

---

## STEP 3 — Enable Google OAuth in Supabase

1. Supabase Dashboard → Authentication → Providers → Google → Enable
2. You need a Google OAuth Client ID and Secret (step below)

### Get Google OAuth Credentials
1. Go to https://console.cloud.google.com
2. Create a new project (or use existing)
3. APIs & Services → OAuth consent screen → External → Fill in app name
4. APIs & Services → Credentials → Create Credentials → OAuth Client ID
5. Application type: **Web application**
6. Authorised redirect URIs — add:
   ```
   https://YOUR_PROJECT_REF.supabase.co/auth/v1/callback
   ```
   (Find YOUR_PROJECT_REF in Supabase → Settings → API → Project URL)
7. Copy the Client ID and Client Secret
8. Paste both back into Supabase → Authentication → Providers → Google

---

## STEP 4 — Get Your Supabase Keys

Supabase Dashboard → Settings → API:
- **Project URL** → `https://xxxxx.supabase.co`
- **anon public** key → `eyJhbGci...`

---

## STEP 5 — Update index.html

Open `index.html`, find these two lines (around line 120):

```javascript
const SUPABASE_URL = window.ENV_SUPABASE_URL || 'YOUR_SUPABASE_URL';
const SUPABASE_ANON = window.ENV_SUPABASE_ANON || 'YOUR_SUPABASE_ANON_KEY';
```

Replace with your actual values:
```javascript
const SUPABASE_URL = 'https://xxxxx.supabase.co';
const SUPABASE_ANON = 'eyJhbGci...your-anon-key...';
```

> The anon key is safe to expose in frontend code — it's meant to be public.
> Row-Level Security policies protect the data.

---

## STEP 6 — Deploy to Vercel

### Option A — Vercel CLI (fastest)
```bash
npm i -g vercel
cd pcep-quiz
vercel
# Follow prompts: link to your account, deploy
# Your URL: https://pcep-quiz-xxxxx.vercel.app
```

### Option B — Vercel Dashboard (no CLI)
1. Push your folder to a GitHub repo
2. Go to https://vercel.com → New Project → Import repo
3. Framework: **Other** (static HTML)
4. Root directory: leave as `/`
5. Deploy

---

## STEP 7 — Add Your Vercel URL to Google OAuth

1. Go back to Google Cloud Console → Credentials → Your OAuth Client
2. Add to **Authorised JavaScript origins**:
   ```
   https://your-app.vercel.app
   ```
3. Add to **Authorised redirect URIs**:
   ```
   https://YOUR_PROJECT_REF.supabase.co/auth/v1/callback
   ```
   (Already added in Step 3 — just confirm it's there)

---

## STEP 8 — Add Your Vercel URL to Supabase

Supabase → Authentication → URL Configuration:
- **Site URL**: `https://your-app.vercel.app`
- **Redirect URLs**: `https://your-app.vercel.app`

---

## STEP 9 — Test It

1. Open your Vercel URL
2. Click "Continue with Google"
3. Sign in → You should be redirected back to the dashboard
4. Take a test → Check Supabase Table Editor → test_results should have a row
5. Refresh the page → Your results should persist

---

## File Structure

```
pcep-quiz/
├── index.html      ← entire app (single file)
└── DEPLOY.md       ← this guide
```

---

## Troubleshooting

| Issue | Fix |
|-------|-----|
| Google login doesn't redirect back | Add Vercel URL to Google OAuth origins |
| "Invalid API key" error | Check SUPABASE_URL and SUPABASE_ANON in index.html |
| Results don't save | Check RLS policies in Supabase SQL Editor |
| Blank page after sign-in | Check Site URL in Supabase Auth settings |
| Guest mode works but Google doesn't | Confirm redirect URI matches exactly in Google Console |

---

## Optional — Environment Variables (production best practice)

Instead of hardcoding keys in HTML, you can use a Vercel `_config.js` approach or
host a tiny `config.js` file and load it. For this single-file app, direct
inclusion of the anon key is safe since Supabase RLS protects the data.

---

## Reset Progress (from UI)

The "Reset all progress" button on the dashboard deletes all `test_results` rows
for the logged-in user. It uses `supabase.from('test_results').delete().eq('user_id', userId)`.
RLS ensures a user can only delete their own rows.