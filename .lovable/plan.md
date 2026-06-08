
## Goal

A single-page app where visitors record a voice answer to one shared question. While recording, a central circle wobbles to mic volume. Submissions upload audio to Supabase Storage, save metadata to `stars`, and appear as glowing dots connected by a chronological polyline. Stars are clickable for playback. The same data is exposed as JSON for Max 9.

## Architecture decisions

- **Recording**: `MediaRecorder` (audio/webm; opus). This is the file uploaded to Supabase.
- **Feature detection**: On mount, check `navigator.mediaDevices?.getUserMedia` and `window.MediaRecorder`. If either is missing, replace the record UI with: "Voice recording is not supported on this browser. Please try Chrome or Safari updated to the latest version."
- **No early mic access**: `getUserMedia` is only invoked when the user taps the record button. No mic prompt on page load.
- **Visualization**: Web Audio `AnalyserNode` fed by the same `MediaStream` as `MediaRecorder`. Rendered on a plain `<canvas>` with `requestAnimationFrame`. Lighter than pulling in p5.js; the wobble math from the reference sketch translates directly.
- **Smoothing**: `smoothed = smoothed * 0.92 + level * 0.08` (per the reference). Wave power scales ring radius and per-vertex jitter.
- **Constellation view**: an SVG sized to fill the viewport area in Contemplation Mode, containing a `<polyline>` through every star in chronological order plus a `<circle>` per star.
- **Client-side UUID**: `crypto.randomUUID()` generates the id used both as the storage filename and as the `stars.id` insert.
- **Single shared `<audio>` element**: mounted once on the page. Clicking a star → `audio.pause()`, `audio.src = star.audio_url`, `audio.play()`. Previous playback is always stopped first.
- **Storage**: Supabase Storage bucket `star-audio` (public). Upload path `recordings/${uuid}.webm`.
- **Backend**: Lovable Cloud (Supabase). No auth. Browser client does upload + insert + ordered select. Public JSON endpoints use `supabaseAdmin` in TanStack server routes.

## UI / flow

One route `/` with a dark full-bleed layout:

1. **Header**: app title + the shared question (hardcoded constant).
2. **Mode tabs**: `Input Mode` (default) / `Contemplation Mode`.
3. **Input Mode**:
   - Central circular record button on top of a `<canvas>` waveform.
   - Idle: solid ring, label "Tap to record".
   - Recording: animated wobbling ring driven by smoothed mic level; timer `MM:SS`; click again (or Stop button) to finish.
   - After stop: preview `<audio>`, "Submit" + "Discard" buttons.
   - Submitting: disabled state.
   - After upload: inline "A star has been created." then return to idle and refetch stars.
   - If unsupported: clear message instead of the record button.
4. **Contemplation Mode**:
   - SVG sized to the viewport area; renders a chronological `<polyline>` plus one glowing `<circle>` per star.
   - Each star: click → shared `<audio>` stops previous, swaps `src`, plays new.
5. **Max Data panel** (collapsible, bottom):
   - Shows endpoint URLs and a compact example JSON payload.
   - Copy buttons for URLs.

Fetch order: `select(...).order('created_at', { ascending: true })` so the polyline is stable.

Validation before submit:
- `blob.type` starts with `audio/`.
- `duration_seconds` between 0.5 and 120.
- `blob.size` ≤ 10 MB.

Random per-star fields generated on submit:
- `x_position`, `y_position`: random in `[0.05, 0.95]`.
- `color`: pick from a small preset palette (warm/cool stars).
- `id`: `crypto.randomUUID()` — used for both the storage filename and the row id.

## Supabase SQL (migration)

```sql
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
```

## Storage bucket + policies

Bucket `star-audio` is created via the storage tool with `public = true`. Policies on `storage.objects`:

```sql
create policy "public read star-audio"
  on storage.objects for select
  to anon, authenticated
  using (bucket_id = 'star-audio');

create policy "public upload star-audio"
  on storage.objects for insert
  to anon, authenticated
  with check (bucket_id = 'star-audio');
```

(No update/delete policies — demo is append-only.)

## Files to create / modify

- `src/routes/index.tsx` — page shell, tabs, question header, Max panel, shared `<audio>` element.
- `src/components/Recorder.tsx` — record button, timer, preview, submit (MediaRecorder + Web Audio + feature detection).
- `src/components/WaveformCanvas.tsx` — canvas wobble visualization driven by an `AnalyserNode`.
- `src/components/Constellation.tsx` — SVG covering the viewport area: chronological polyline + clickable stars.
- `src/components/MaxDataPanel.tsx` — endpoint URLs + example JSON.
- `src/lib/stars.ts` — palette, random position, blob → metadata, `crypto.randomUUID()`-based upload + insert.
- `src/routes/api/public/stars.ts` — `GET` all stars (selected columns), ordered by `created_at` asc, as JSON.
- `src/routes/api/public/stars.latest.ts` — `GET` newest star as JSON.

## How Max 9 uses this

Max polls `https://<project>.lovable.app/api/public/stars` using a Max HTTP/network object (e.g. `[maxurl]`, `[jweb]`) or a small Node-for-Max bridge. For the prototype, the website only guarantees a clean JSON endpoint and stable audio URLs — anything beyond that lives in the Max patch.

For each star Max can:

- Download/cache audio locally first, then load into Max playback objects such as `sfplay~` or `buffer~`/`groove~`. Prefer `max_audio_url` (WAV/AIFF) when present, otherwise `audio_url` (webm/opus).
- Use `x_position` / `y_position` to spatialize (panning, ambisonics).
- Use `duration_seconds` for sequencing or buffer length.
- Use `volume_peak` / `volume_average` for normalization or filter modulation.
- Poll `/api/public/stars/latest` and compare `id` to detect new arrivals.

Max doesn't depend on the UI — only the JSON endpoints. `max_audio_url` stays nullable so a future job can populate WAV/AIFF without schema changes.

## Out of scope

Auth, deletion, moderation, realtime push, server-side audio conversion, OSC bridge, transcription.
