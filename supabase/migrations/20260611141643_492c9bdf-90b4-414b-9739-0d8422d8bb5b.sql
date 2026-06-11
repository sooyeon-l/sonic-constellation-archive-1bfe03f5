
-- Remove broad public read on star-audio bucket; rely on signed URLs only
DROP POLICY IF EXISTS "public read star-audio" ON storage.objects;

-- Restrict anon/authenticated SELECT on constellations to non-sensitive columns
REVOKE SELECT ON public.constellations FROM anon, authenticated;
GRANT SELECT (id, title, question_text, status, synth_audio_url, error_message, created_at, ready_at)
  ON public.constellations TO anon, authenticated;
GRANT INSERT ON public.constellations TO anon, authenticated;
