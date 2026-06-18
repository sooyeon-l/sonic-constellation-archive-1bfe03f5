# Sonic Constellation System Architecture

## Existing end-to-end flow

```text
Website recording
  -> original WEBM uploaded to Supabase Storage
  -> star metadata saved in the database
  -> 5–7 star IDs grouped into one constellation
  -> constellation status = pending_synthesis
  -> Max worker fetches pending constellation
  -> recordings downloaded and converted to WAV
  -> WAVs loaded into Max buffers
  -> Max analyzes, transforms, arranges, and mixes the signals
  -> Max records one final stereo constellation WAV
  -> backend uploads final WAV
  -> constellation status = ready
  -> website plays final WAV through Play Synthesized Constellation
```

## Stage 1 contract status

The current Stage 1 contract keeps final WAV upload on the trusted backend route:

```text
Node-for-Max -> /api/public/constellations/:id/upload-synth
backend -> private Supabase Storage path synthesized/:id.wav
website -> /api/public/constellations/:id/synth-audio -> short signed URL
```

Local Max output should use the ignored repository-relative path `max/output/test_synth.wav`.
The existing top-level patch is not yet the future modular `bpatcher` architecture, and it should not be treated as fully verified until downloaded WAV paths are confirmed in Max 9 to load into `buffer~ s_0` through `buffer~ s_6`.

## Required audio states

### 1. Original star recording
The unchanged recording submitted by the user.

### 2. Transformed star signal
The star after pitch-, amplitude-, timbre-, envelope-, spatial-, or constellation-relative processing inside Max.

This can remain an in-memory signal used only in the final mix. Exporting a separate processed WAV per star is optional and should not be required for the first stable integration.

### 3. Final constellation WAV
One stereo WAV made by combining the five to seven transformed star signals.

## Recommended Max architecture

Use a clean top-level patch made primarily of `bpatcher` modules.

```text
[Controller]
     |
[Node Bridge]
     |
[Star Buffer Bank: s_0 ... s_6]
     |
[Per-star Analysis]
     |
[Per-star Processing / Synthesis]
     |
[Arrangement + Shared Effects + Mix]
     |
[Recorder / Upload Trigger]

Analysis and trigger data also feed:

[Jitter Visualizer]
```

## Top-level legibility requirements

The professor previously found the patch difficult to read. The integrated patch must therefore:

- use large labeled sections;
- place one `bpatcher` per major responsibility;
- avoid long crossing patch cords;
- use named `send`/`receive` buses with a consistent `sc_` prefix;
- keep manual test controls inside modules, not scattered across the top level;
- include comments stating input, output, and owner/contribution source;
- keep the signal path visually left-to-right or top-to-bottom;
- include one visible status area for pending, downloading, analyzing, synthesizing, recording, uploading, ready, and error states.

## Proposed module boundaries

- `bp_controller.maxpat`
- `bp_bridge.maxpat`
- `bp_star_bank.maxpat`
- `bp_analysis.maxpat`
- `bp_voice_engine.maxpat`
- `bp_arrangement_mix.maxpat`
- `bp_recorder.maxpat`
- `bp_jitter_visualizer.maxpat`

Repeated per-star logic should be implemented with reusable abstractions or repeated `bpatcher` instances rather than copied loose objects.
