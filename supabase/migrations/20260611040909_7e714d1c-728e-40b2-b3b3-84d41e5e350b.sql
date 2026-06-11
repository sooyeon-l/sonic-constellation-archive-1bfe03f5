-- Add synthesis workflow columns to constellations
ALTER TABLE public.constellations
  ADD COLUMN status text NOT NULL DEFAULT 'pending_synthesis',
  ADD COLUMN synthesis_params jsonb,
  ADD COLUMN mood_params jsonb,
  ADD COLUMN synth_audio_url text,
  ADD COLUMN synth_audio_path text,
  ADD COLUMN error_message text,
  ADD COLUMN ready_at timestamptz;

ALTER TABLE public.constellations
  ADD CONSTRAINT constellations_status_check
  CHECK (status IN ('pending_synthesis','synthesizing','ready','failed'));

-- Allow the constellation insert policy to keep working with the new jsonb params
-- (existing policy only checks title/question_text lengths; no change needed)

-- Storage: allow uploads ONLY into the synthesized/ folder of star-audio
-- (browser recordings keep their existing recordings/-scoped insert policy)
CREATE POLICY "public upload star-audio synthesized"
ON storage.objects
FOR INSERT
TO anon, authenticated
WITH CHECK (
  bucket_id = 'star-audio'
  AND (storage.foldername(name))[1] = 'synthesized'
  AND octet_length(name) <= 200
);