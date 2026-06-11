
ALTER TABLE public.stars
  ADD COLUMN IF NOT EXISTS radial_distance numeric,
  ADD COLUMN IF NOT EXISTS angle numeric;

DROP POLICY IF EXISTS "anyone can insert stars" ON public.stars;

CREATE POLICY "anyone can insert stars"
ON public.stars
FOR INSERT
TO anon, authenticated
WITH CHECK (
  length(question_text) >= 1 AND length(question_text) <= 500
  AND length(audio_url) >= 1 AND length(audio_url) <= 2000
  AND length(audio_path) >= 1 AND length(audio_path) <= 500
  AND length(color) >= 1 AND length(color) <= 32
  AND duration_seconds >= 0 AND duration_seconds <= 600
  AND x_position >= 0 AND x_position <= 1
  AND y_position >= 0 AND y_position <= 1
  AND (radial_distance IS NULL OR (radial_distance >= 0 AND radial_distance <= 2))
  AND (angle IS NULL OR (angle >= -10 AND angle <= 10))
);
