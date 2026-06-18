# Codex Task Brief — Sonic Constellation Integration

## Mission

Integrate the website, Supabase backend, existing Max worker, and four teammates’ Max contributions into a stable, legible installation. Do not simply concatenate patches. Extract nonredundant logic, preserve attribution, and create reusable modules embedded with `bpatcher` in a clean top-level patch.

## Required first action

Before editing files:

1. inspect the repository;
2. identify the current website/backend/Max data flow;
3. inventory every file under `max/teammate_sources/`;
4. compare current implementation against `max/docs/SYSTEM_ARCHITECTURE.md`;
5. write a proposed implementation plan with risks, migrations, and test steps;
6. wait for approval before performing broad refactors or database migrations.

## Hard constraints

- Never modify files under `max/teammate_sources/`.
- Create adapted files under `max/modules/`.
- Preserve original star recordings.
- Preserve the existing one-final-WAV-per-constellation behavior.
- The top-level Max patch must use `bpatcher` for major modules.
- Do not add large crossing patch-cord networks to the main patch.
- Use a consistent `sc_` prefix for named buses.
- Support five to seven stars.
- Do not expose worker secrets or service-role credentials to the browser.
- Do not claim Max runtime success based only on JSON parsing.
- Do not add a database migration unless the feature actually requires it.
- Keep optional processed-star uploads and website re-rendering separate from the first stable integration.

## Contribution mapping

- Hyerin: pitch/amplitude analysis, mapping concepts, individual shaping.
- Eunmin: additive/subtractive pitch-dependent timbre.
- Janice: amplitude-triggered rhythmic/additive alien-response layer.
- Taewan: Jitter, polyphonic envelopes, movement, and audio effects.

## First stable deliverable

1. A readable top-level `.maxpat` containing labeled `bpatcher` modules.
2. Reusable per-star analysis and voice modules.
3. Five-to-seven-source arrangement and stereo mixing.
4. Final WAV recording connected to the existing upload flow.
5. Jitter visualization connected to real star analysis/trigger values.
6. Native-Max fallback for external Ableton effects.
7. Local test patch using manually selected WAV files.
8. Static validation script for `.maxpat` JSON and referenced abstraction files.
9. Updated documentation and a test checklist.

## Testing expectations

Run all available web tests, type checks, linting, and build steps. For Max files:

- validate JSON syntax;
- verify referenced files exist;
- inspect object names and connections;
- provide exact manual steps for opening and testing in Max 9;
- clearly distinguish static validation from actual Max runtime validation.

## Change-report format

At the end of each task, report:

- files changed;
- purpose of each change;
- teammate contribution preserved;
- tests run and results;
- Max runtime steps still required;
- unresolved risks;
- whether database/API changes were made.
