
CREATE TABLE public.constellations (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  title text NOT NULL,
  question_text text NOT NULL,
  created_at timestamptz NOT NULL DEFAULT now()
);

GRANT SELECT, INSERT ON public.constellations TO anon, authenticated;
GRANT ALL ON public.constellations TO service_role;

ALTER TABLE public.constellations ENABLE ROW LEVEL SECURITY;

CREATE POLICY "anyone can read constellations"
  ON public.constellations FOR SELECT
  TO anon, authenticated
  USING (true);

CREATE POLICY "anyone can insert constellations"
  ON public.constellations FOR INSERT
  TO anon, authenticated
  WITH CHECK (
    length(title) BETWEEN 1 AND 200
    AND length(question_text) BETWEEN 1 AND 500
  );

ALTER TABLE public.stars
  ADD COLUMN constellation_id uuid REFERENCES public.constellations(id) ON DELETE SET NULL;

CREATE INDEX stars_constellation_id_idx ON public.stars(constellation_id);

-- allow assigning an unassigned star to a constellation (one-way)
GRANT UPDATE (constellation_id) ON public.stars TO anon, authenticated;

CREATE POLICY "anyone can attach star to constellation"
  ON public.stars FOR UPDATE
  TO anon, authenticated
  USING (constellation_id IS NULL)
  WITH CHECK (constellation_id IS NOT NULL);
