create table public.stars (
  id uuid primary key default gen_random_uuid(),
  question_text text not null,
  audio_url text not null,
  audio_path text not null,
  max_audio_url text,
  mime_type text,
  duration_seconds numeric not null,
  volume_peak numeric,
  volume_average numeric,
  x_position numeric not null,
  y_position numeric not null,
  color text not null,
  created_at timestamptz not null default now()
);

grant select, insert on public.stars to anon, authenticated;
grant all on public.stars to service_role;

alter table public.stars enable row level security;

create policy "anyone can read stars"
  on public.stars for select to anon, authenticated using (true);

create policy "anyone can insert stars"
  on public.stars for insert to anon, authenticated with check (true);

create index stars_created_at_idx on public.stars (created_at);

create policy "public read star-audio"
  on storage.objects for select
  to anon, authenticated
  using (bucket_id = 'star-audio');

create policy "public upload star-audio"
  on storage.objects for insert
  to anon, authenticated
  with check (bucket_id = 'star-audio');