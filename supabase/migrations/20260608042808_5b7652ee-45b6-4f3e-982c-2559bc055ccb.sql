drop policy if exists "anyone can insert stars" on public.stars;

create policy "anyone can insert stars"
  on public.stars for insert to anon, authenticated
  with check (
    length(question_text) between 1 and 500
    and length(audio_url) between 1 and 2000
    and length(audio_path) between 1 and 500
    and length(color) between 1 and 32
    and duration_seconds >= 0
    and duration_seconds <= 600
    and x_position between 0 and 1
    and y_position between 0 and 1
  );

drop policy if exists "public upload star-audio" on storage.objects;
create policy "public upload star-audio"
  on storage.objects for insert
  to anon, authenticated
  with check (
    bucket_id = 'star-audio'
    and (storage.foldername(name))[1] = 'recordings'
    and octet_length(name) <= 200
  );