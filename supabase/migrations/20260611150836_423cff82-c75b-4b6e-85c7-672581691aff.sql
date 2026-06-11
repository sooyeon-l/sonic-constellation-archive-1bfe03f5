CREATE POLICY "sign read star-audio recordings"
ON storage.objects
FOR SELECT
TO anon, authenticated
USING (
  bucket_id = 'star-audio'
  AND (storage.foldername(name))[1] = 'recordings'
);