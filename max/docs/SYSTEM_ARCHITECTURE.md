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

## Stage 1 fallback contract

`max/constellation_synth.maxpat` remains the recoverable Stage 1 fallback. It keeps final WAV upload on the trusted backend route:

```text
Node-for-Max -> /api/public/constellations/:id/upload-synth
backend -> private Supabase Storage path synthesized/:id.wav
website -> /api/public/constellations/:id/synth-audio -> short signed URL
```

Local Max output should use the ignored repository-relative path `max/output/test_synth.wav`.

## Modular Stage 2 patch

`max/sonic_constellation_main.maxpat` is the modular integration patch. It uses same-folder `bpatcher` runtime mirrors such as `max/bp_bridge.maxpat` because Max resolved those reliably on the demo laptop. The canonical editable module sources also live under `max/modules/`.

```text
bp_bridge             Node-for-Max backend contract
bp_controller         Stage 1 sequencing, recording gate, star metadata bus
bp_star_bank          buffer~ s_0 ... s_6, indexed original playback
bp_analysis           shared pitch/amplitude/metadata analysis
bp_hyerin_mapping     pitch-to-color and amplitude/intensity mappings
bp_voice_engine       quiet native support/diagnostic voice
bp_eunmin_timbre      register, harmonic, and filter treatment
bp_janice_response    onset-triggered response gestures
bp_taewan_visuals     Jitter visuals and optional Ableton branch
bp_arrangement_mix    conservative layer mix and monitoring
bp_recorder           sfrecord~ final WAV recorder
bp_diagnostics        manual test and level/bypass controls
```

The modular patch preserves the verified contract:

```text
downloaded WAV -> absolute path -> buffer slot -> real voice playback
  -> shared analysis and controlled layers -> conservative final mix
  -> sfrecord~ -> verifyRecording -> trusted upload route
```

## Required audio states

### 1. Original star recording
The unchanged recording submitted by the user.

### 2. Transformed star signal
The star after pitch-, amplitude-, timbre-, envelope-, spatial-, or constellation-relative processing inside Max.

This can remain an in-memory signal used only in the final mix. Exporting a separate processed WAV per star is optional and should not be required for the first stable integration.

### 3. Final constellation WAV
One stereo WAV made by combining the five to seven transformed star signals.

## Current Max architecture

The top-level patch is made primarily of `bpatcher` modules.

```text
[Node Bridge]
     |
[Controller]
     |
[Star Buffer Bank: s_0 ... s_6]
     |
[Per-star Analysis]
     |
[Hyerin / Eunmin / Janice / Taewan layers]
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

## Shared analysis buses

The analysis layer emits shared `sc_` buses so teammate modules do not duplicate pitch/amplitude work:

- `sc_analysis_pitch_by_star`
- `sc_analysis_pitched_by_star`
- `sc_analysis_norm_pitch_by_star`
- `sc_analysis_amp_by_star`
- `sc_analysis_norm_amp_by_star`
- `sc_analysis_avg_amp_by_star`
- `sc_analysis_duration_by_star`
- `sc_analysis_xy_by_star`
- collective fallback buses `sc_analysis_pitch` and `sc_analysis_amp`

Unpitched or unstable speech is handled by explicit pitched-state flags and conservative downstream clipping/fallback ranges.
