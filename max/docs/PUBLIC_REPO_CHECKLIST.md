# Public Repository Checklist

Before committing teammate materials or running an agent over the repository:

## Do not commit

- `max/config.json`
- worker secrets
- Supabase service-role keys
- `.env` files
- downloaded user recordings
- generated constellation WAVs
- temporary converted WAVs
- local absolute paths
- unreviewed screenshots containing private information
- private Notion links
- large demo videos unless Git LFS is intentionally used

## PDFs from Notion

Do not commit Notion PDFs by default.

Reasons:

- they are harder for coding tools to search and edit than Markdown;
- they may contain names, comments, private links, screenshots, or metadata;
- they add binary history to a public repository;
- the same content can be preserved more cleanly in sanitized `NOTES.md` files.

Keep original PDFs outside the repository or in a local ignored folder. Commit them only after reviewing every page and deciding that public distribution is acceptable.

## Recommended ignore entries

```gitignore
# Local Max configuration and secrets
max/config.json
max/**/config.local.json
.env
.env.*
!.env.example

# Generated and downloaded audio
max/**/*.wav
max/**/*.webm
max/**/*.aif
max/**/*.aiff
max/downloads/
max/output/
max/tmp/

# Private/reference exports
max/teammate_sources/**/private/
max/teammate_sources/**/*.pdf
max/teammate_sources/**/*.mp4
max/teammate_sources/**/*.mov

# OS files
Thumbs.db
desktop.ini
.DS_Store
```

If a tiny, licensed test WAV is essential, place it in a clearly documented fixture folder and explicitly unignore that exact file.

## Stage 0 Max output and package policy

- The ignored repository-relative output directory is `max/output/`.
- The future default final synthesis file is `max/output/test_synth.wav`.
- The required synthesis and recording path must work with native Max objects.
- Package-dependent teammate effects, including Ableton objects when available, should be preserved as supported optional layers with a native-Max fallback.
- If an optional package is unavailable, the patch must still load and complete synthesis using the native-Max path.
- Jitter is part of the intended Max installation and should not be removed merely to avoid package setup.
- Every required and optional Max package must eventually be documented with its installation source and a procedure for verifying that Max recognizes its objects.
