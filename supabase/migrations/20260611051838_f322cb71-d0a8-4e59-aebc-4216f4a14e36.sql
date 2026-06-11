DROP POLICY IF EXISTS "anyone can insert constellations" ON public.constellations;

CREATE POLICY "anyone can insert constellations"
ON public.constellations
FOR INSERT
TO anon, authenticated
WITH CHECK (
  length(title) >= 1 AND length(title) <= 200
  AND length(question_text) >= 1 AND length(question_text) <= 500
  AND status = 'pending_synthesis'
  AND synthesis_params IS NULL
  AND mood_params IS NULL
  AND synth_audio_url IS NULL
  AND synth_audio_path IS NULL
  AND error_message IS NULL
  AND ready_at IS NULL
);