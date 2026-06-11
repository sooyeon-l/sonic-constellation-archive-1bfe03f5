# Max 9 Synthesis Worker Architecture (revised)

Polling-based round trip: website creates a pending constellation → Max fetches it → marks it synthesizing → uploads a WAV and marks it ready → website plays the synthesized audio.

## 1. Storage: stable public URLs + scoped policies

- Flip the `star-audio` bucket to **public read** so audio gets permanent, non-expiring URLs.
- Switch `uploadAndInsertStar` from `createSignedUrl` to `getPublicUrl` — stable URL, no token.
- Keep browser recordings as webm/opus; `max_audio_url` stays nullable for future WAV/AIFF star files.
- Synthesized audio lives at `star-audio/synthesized/{constellationId}.wav`.

**Storage policies (documented exactly):**
- Existing upload policy for browser recordings stays as-is (insert into `recordings/` continues to work unchanged).
- Add one narrow insert policy for Max: `anon`/`authenticated` may upload **only** to the `synthesized/` folder of `star-audio`, restricted to that path prefix — nothing wider. Node-for-Max uploads with the Supabase JS client + anon key.
- No public update/delete policies — uploads only.
- I'll list the final policy SQL in the implementation notes so you can see precisely what's allowed.

⚠️ Your workspace previously blocked public buckets. I'll attempt the flip; if rejected, you'll need to enable public buckets in workspace Settings → Privacy & Security, and I'll flag it clearly.

## 2. Database migration — `constellations` table

Add:
- `status` text not null default `pending_synthesis`, constrained to `pending_synthesis | synthesizing | ready | failed`
- `synthesis_params` jsonb, `mood_params` jsonb
- `synth_audio_url`, `synth_audio_path`, `error_message` (nullable text)
- `ready_at` timestamptz nullable

`stars` already has every required column (verified). Status changes happen only through server endpoints (admin client) — no new client update policies.

## 3. API endpoints (raw JSON, never the HTML shell)

All return `Content-Type: application/json` + CORS headers (`Access-Control-Allow-Origin: *`, allow `Content-Type, X-Max-Worker-Secret`), with OPTIONS preflight handlers on the POST routes.

**Public GET endpoints (no auth):**
| Endpoint | Behavior |
|---|---|
| `GET /api/public/constellations` | All constellations + nested stars |
| `GET /api/public/constellations/pending` | Only `pending_synthesis`, + nested stars |
| `GET /api/public/constellations/:id` | One constellation + nested stars |
| `GET /api/public/stars/latest` | (already exists) |

**Protected POST endpoints — require `X-Max-Worker-Secret` header:**
| Endpoint | Behavior |
|---|---|
| `POST .../:id/mark-synthesizing` | `pending_synthesis → synthesizing` |
| `POST .../:id/mark-ready` | `synthesizing → ready`; Zod-validated body `{ synth_audio_url, synth_audio_path }`; sets `ready_at = now()` |
| `POST .../:id/mark-failed` | `synthesizing → failed`; Zod-validated body `{ error_message }` |

**Auth:** header compared (timing-safe) against `MAX_WORKER_SECRET` env var. Missing/wrong → `401 {"error":"Unauthorized Max worker request"}`. I'll prompt you to set the secret value via the secure secrets form — it's never shown in the UI or code.

**State guards (strict):** invalid transition → `409` JSON with current status. Prevents two Max workers double-claiming the same constellation.

**Route ordering:** static `pending` file resolves before dynamic `$id` (TanStack static-over-dynamic precedence) — I'll verify this with a live request after implementation.

## 4. Create Constellation flow

- Min 3 / max 7 stars; recorder disabled at 7 with "constellation full — create or reset" message.
- On create: insert constellation row (status defaults `pending_synthesis`), fallback timestamp title, generate `synthesis_params` (per-star duration/peak/average/x/y/color → pitch/pan/gain mapping) and `mood_params` (aggregates: mean volume, density, total duration, palette), assign `constellation_id` to stars, clear active stars, switch to Contemplation Mode.

## 5. Contemplation Mode UI

- Status badges: "Waiting for Max synthesis" / "Max is synthesizing" / "Synthesized sound ready" / "Synthesis failed" (+ error message).
- "Play Synthesized Constellation" only when `status = ready` **and** `synth_audio_url` exists.
- Individual stars always remain playable.
- ~10s polling while any constellation is pending/synthesizing so badges update live.

## 6. Max Integration panel

- Endpoint list + copy buttons: `/api/public/constellations/pending`, `/api/public/constellations`, `/api/public/stars/latest`.
- Latest pending constellation JSON preview.
- Health checks: fetch each GET endpoint, ✓/✗ for "returns JSON" (catches the HTML-shell failure).
- Warnings: `?token=` in audio_url → "signed/temporary URL"; ready constellation missing `synth_audio_url`.
- Clear note: **"POST status endpoints require the `X-Max-Worker-Secret` header"** — secret value never displayed.
- Max workflow note: poll pending → mark-synthesizing → render WAV → upload to `synthesized/{id}.wav` → POST mark-ready.

## 7. Post-implementation test cycle

1. Verify all four GET endpoints return raw JSON (not `<!DOCTYPE html>`), including `/pending` resolving before `:id`.
2. Insert 3 test stars, create a constellation, confirm it appears at `/pending`.
3. Call mark-synthesizing with the secret header → website shows "Max is synthesizing".
4. Call mark-synthesizing again → confirm 409.
5. Call mark-ready with a test WAV URL → website shows "Play Synthesized Constellation".
6. Confirm the synthesized audio URL plays; confirm wrong/missing secret returns the 401 JSON.
7. Clean up test data.

## Out of scope

No WebSocket, OSC, realtime push, or Jitter — polling only.
