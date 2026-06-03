# Ulundi Fiber Network — Production Map

Live web map for the Ulundi ISP fiber network.
Stack: Supabase PostGIS → MapLibre GL JS → Render.com (free)

---

## Files
- `index.html`         — The web map (single file, no build needed)
- `supabase_setup.sql` — Run once in Supabase SQL Editor
- `render.yaml`        — Render.com auto-deploy config
- `README.md`          — This file

---

## Deployment Steps

### Step 1 — Supabase SQL Setup
1. supabase.com → your project → SQL Editor
2. Paste supabase_setup.sql → Run

### Step 2 — Update index.html
Replace lines 2-3 in the <script> block:
  SUPABASE_URL  = 'https://YOUR_PROJECT_REF.supabase.co'
  SUPABASE_ANON = 'YOUR_ANON_KEY_HERE'

Find your anon key: Supabase → Settings → API → anon/public

### Step 3 — GitHub
1. github.com → New repository → "ulundi-fiber-map" (public)
2. Upload all 4 files

### Step 4 — Render
1. render.com → New → Static Site
2. Connect GitHub → select ulundi-fiber-map repo
3. Publish directory: .  (just a dot)
4. Click Deploy

Live URL: https://ulundi-fiber-map.onrender.com

---

## QGIS Sync
Any edits made in QGIS (while connected to Supabase) are
instantly live on the web map — no redeployment needed.
