-- ============================================================
-- Run this ONCE in Supabase → SQL Editor
-- ============================================================

-- 1. Confirm PostGIS is active
CREATE EXTENSION IF NOT EXISTS postgis;

-- 2. Enable Row Level Security on all tables
ALTER TABLE public.erven      ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.d_s        ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.d_poles    ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.d_manwhole ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.d_houses   ENABLE ROW LEVEL SECURITY;

-- 3. Allow public (anon) read-only access
CREATE POLICY "public read erven"      ON public.erven      FOR SELECT USING (true);
CREATE POLICY "public read d_s"        ON public.d_s        FOR SELECT USING (true);
CREATE POLICY "public read d_poles"    ON public.d_poles    FOR SELECT USING (true);
CREATE POLICY "public read d_manwhole" ON public.d_manwhole FOR SELECT USING (true);
CREATE POLICY "public read d_houses"   ON public.d_houses   FOR SELECT USING (true);

-- 4. Spatial indexes for fast map rendering
CREATE INDEX IF NOT EXISTS idx_erven_geom     ON public.erven      USING GIST (geom);
CREATE INDEX IF NOT EXISTS idx_ds_geom        ON public.d_s        USING GIST (geom);
CREATE INDEX IF NOT EXISTS idx_poles_geom     ON public.d_poles    USING GIST (geom);
CREATE INDEX IF NOT EXISTS idx_manwhole_geom  ON public.d_manwhole USING GIST (geom);
CREATE INDEX IF NOT EXISTS idx_houses_geom    ON public.d_houses   USING GIST (geom);

-- ============================================================
-- NOTE: If your geometry column is named differently (e.g.
-- 'wkb_geometry' instead of 'geom'), update the GIST index
-- lines above to match. Check in Table Editor if unsure.
-- ============================================================
