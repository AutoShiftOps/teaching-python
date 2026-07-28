// api/config.js — Vercel serverless function
// Reads env vars from Vercel dashboard. Keys never appear in client code or repo.

export default function handler(req, res) {
  const supabaseUrl  = process.env.SUPABASE_URL;
  const supabaseAnon = process.env.SUPABASE_ANON_KEY;
  const appUrl       = process.env.APP_URL || req.headers.origin || 'http://localhost:3000';

  if (!supabaseUrl || !supabaseAnon) {
    return res.status(500).json({
      error: 'Supabase environment variables not configured.',
      hint:  'Add SUPABASE_URL and SUPABASE_ANON_KEY in Vercel → Settings → Environment Variables'
    });
  }

  res.setHeader('Cache-Control', 's-maxage=300, stale-while-revalidate');
  res.setHeader('Content-Type', 'application/json');

  return res.status(200).json({ supabaseUrl, supabaseAnon, appUrl });
}
