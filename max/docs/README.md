# Max Integration Documentation

This folder documents the Max side of **Sonic Constellation** and how it connects to the website, Supabase, and the Node-for-Max worker.

## Source-of-truth rules

1. The existing website and backend behavior are the current source of truth.
2. Files under `max/teammate_sources/` are **original reference submissions**. Do not edit them in place.
3. Reusable or modified Max modules belong in `max/modules/`.
4. The clean top-level integrated patch belongs in `max/` or a future `max/main/` folder.
5. Tests and manual test patches belong in `max/tests/`.
6. Any database migration or API-route change must be documented before it is implemented.

## Target interaction model

- Each submitted star retains its original recording.
- Five to seven star recordings are loaded into Max for one constellation.
- Each star may be analyzed and transformed independently.
- The transformed signals are arranged and mixed into one final constellation WAV.
- The final constellation WAV is uploaded and played through `Play Synthesized Constellation`.
- Individual star playback may continue to use the original recording, or may later expose an optional transformed version without deleting the original.
- Jitter may be used as the projected classroom visualization during synthesis.

## Read next

- `SYSTEM_ARCHITECTURE.md`
- `TEAMMATE_CONTRIBUTIONS.md`
- `INTEGRATION_PLAN.md`
- `CODEX_TASK_BRIEF.md`

## Public-repository warning

Do not commit secrets, private URLs, exported user recordings, generated WAV files, or unreviewed Notion exports. See `PUBLIC_REPO_CHECKLIST.md`.
