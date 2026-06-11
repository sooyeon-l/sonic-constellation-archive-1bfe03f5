# Fix recording upload flow

## Root cause

The "Fix all security issues" migration dropped the `public read star-audio` policy on `storage.objects`. After that:

1. `uploadAndInsertStar` in `src/lib/stars.ts` still calls `supabase.storage.getPublicUrl(...)` then does a `HEAD` on it. The bucket is private → HEAD returns 400 ("Object not found"), which is logged as a console error even though the code catches it.
2. The fallback `createSignedUrl` requires a `SELECT` policy on `storage.objects` for `anon`/`authenticated`. None exists anymore → `StorageApiError: Object not found` is thrown and surfaced to the user as the "Object not found" message.

The HEAD also runs whether or not the upload succeeded for that path on a previous attempt, which matches the user's description of pre-upload existence checks failing.

## Changes

### 1. `src/lib/stars.ts` — `uploadAndInsertStar`

- Keep the existing path: `recordings/<star_id>.webm` in bucket `star-audio` (no bucket name inside the object path — already correct).
- Upload first. If upload fails, throw `new Error("Upload failed, please retry.")` (don't surface raw `StorageApiError`).
- Remove the `getPublicUrl` + `HEAD` probe entirely.
- Only after a successful upload, call `supabase.storage.from("star-audio").createSignedUrl(path, 60 * 60 * 24 * 365)` once and store that as `audio_url`. If signing fails, also throw the friendly retry error (and best-effort delete the just-uploaded object so the next attempt is clean).
- No other behavior changes (placement, color, DB insert stay the same).

### 2. `src/components/Recorder.tsx`

- Preview already uses the local Blob URL via `URL.createObjectURL(blob)` — keep as-is.
- `submit()` already catches and shows `err.message`; with the friendly error from step 1 the user now sees "Upload failed, please retry." instead of `Object not found`.
- No structural change needed.

### 3. New migration: re-enable `SELECT` on `storage.objects` for `star-audio/recordings/` only

`createSignedUrl` (client, anon/authenticated key) needs a `SELECT` policy on the object. Scope it tightly so it doesn't reopen the original finding:

```sql
CREATE POLICY "sign read star-audio recordings"
ON storage.objects
FOR SELECT
TO anon, authenticated
USING (
  bucket_id = 'star-audio'
  AND (storage.foldername(name))[1] = 'recordings'
);
```

`synthesized/` stays unreadable by anon/authenticated, so synth WAVs continue to be served only through the existing server endpoint with short-lived signed URLs. The bucket remains private.

## Out of scope

- No changes to `synth-audio` endpoint, Max worker, upload-synth route, p5 sketch, recorder UI structure, constellation creation, or any of the constellation column grants.
- No changes to the `synthesized/` folder policies.

## Risk

- Long-lived (1y) signed URLs for star recordings persist in the `stars.audio_url` column; same lifetime as before the security migration. If we later want stricter rotation, switch to on-demand signing via a server endpoint — flagged but not done here to keep scope minimal.
