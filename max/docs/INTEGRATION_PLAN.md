# Max Integration Plan

## Phase 0 — Repository hygiene

1. Place each teammate’s original files under their own folder in `max/teammate_sources/`.
2. Do not rename or edit the originals after committing them.
3. Add one sanitized `NOTES.md` per teammate rather than relying on PDF exports.
4. Keep heavy demo videos, WAV files, and private Notion PDFs out of normal Git history unless Git LFS is deliberately configured.
5. Confirm that secrets and local generated audio are ignored.

## Phase 1 — Inventory before modification

The coding agent should inspect:

- current website recording and star-creation code;
- current constellation grouping logic;
- Supabase schema and migrations;
- current API routes;
- current Max bridge and synthesis engine;
- all existing Max patches in `max/`;
- teammate source patches and notes.

It must produce a written inventory before changing architecture.

## Phase 2 — Define stable interfaces

### Stage 1 stabilization baseline

- keep the existing trusted backend final-WAV upload route;
- use `max/output/test_synth.wav` as the ignored local synthesis output;
- support star indices `0` through `6` consistently;
- preserve the backend star order and explicit star IDs;
- do not add processed-star uploads, database migrations, or Max-to-website analysis round trips in this stage;
- do not claim the current top-level patch is fully integrated until Max 9 confirms downloaded WAVs load into `s_0` through `s_6`.

### Star buffer interface

- maximum seven sources;
- stable buffer names `s_0` through `s_6` in the integrated system;
- actual teammate source patches do not need to use those names internally;
- file paths and star IDs must remain paired.

### Per-star analysis message

```text
star_analysis <index> <star_id> <pitch_hz> <avg_amp> <peak_amp> <duration_s>
```

Unavailable pitch must be represented explicitly, not as a fabricated number.

### Per-star trigger message

```text
star_trigger <index> <velocity_or_amp>
```

### Per-star processing output

Each processing voice must provide stereo audio output and must not directly own final upload logic.

### Final mix output

One stereo signal is routed to the recorder and monitoring output.

## Phase 3 — Build clean modules

### Analysis module

- adapt Hyerin’s pitch logic;
- reuse website amplitude metadata when possible;
- handle unpitched input;
- emit tagged results by star index and ID.

### Voice-processing module

Combine the nonredundant contribution of:

- Hyerin: pitch/volume-informed shaping and normalization;
- Eunmin: additive/subtractive timbral branches;
- Janice: amplitude-triggered response gestures;
- Taewan: envelope/polyphonic/effects organization.

### Arrangement/mix module

- stagger or arrange five to seven transformed stars;
- preserve individual audibility;
- pan intentionally;
- control headroom;
- prevent clipping;
- feed one stereo final mix.

### Jitter module

- use pitch for color;
- use volume or constellation-relative amplitude for radius/scale;
- use peak for glow or pulse strength;
- use star index/order for identity and connection order;
- respond to synthesis triggers;
- show processing stages on the classroom screen.

## Phase 4 — First stable target

The first stable version should require only:

- original star recordings;
- final constellation WAV;
- projected Jitter visualization;
- no processed-star WAV uploads;
- no Max-to-website re-render round trip yet.

This prevents the initial integration from depending on new database fields and API routes.

## Phase 5 — Optional enhanced target

After the first stable version works:

- export transformed WAV per star;
- upload transformed audio without overwriting originals;
- store Max-derived pitch/visual values;
- re-render the website constellation after synthesis;
- offer original/transformed star playback.

Treat this as a separate feature branch or milestone, not as a prerequisite for basic synthesis.

## Definition of done

- the top-level patch is legible and modular;
- five and seven-star constellations both work;
- original files remain unchanged;
- the final mix includes recognizably distinct star contributions;
- Jitter runs on the presentation laptop;
- external effects have a fallback;
- one final WAV uploads and changes the constellation to ready;
- failure states do not corrupt the next queued constellation;
- the complete flow is tested repeatedly, not only once.

## Stage 2 implementation status

`max/sonic_constellation_main.maxpat` is the current modular integration patch. It loads same-folder runtime bpatchers under `max/` because Max resolved those reliably on the demo laptop. Canonical editable module sources are also kept under `max/modules/`.

Implemented modules:

- `bp_bridge.maxpat`: Node-for-Max backend bridge, without raw signed-URL debug printing.
- `bp_controller.maxpat`: verified Stage 1 sequencing, `star_meta` metadata bus, recording verification gate.
- `bp_star_bank.maxpat`: `buffer~ s_0` through `buffer~ s_6`, original recording playback, indexed `sc_star_N` buses.
- `bp_analysis.maxpat`: shared pitch, pitched-state, peak/normalized amplitude, duration, average amplitude, and x/y metadata buses.
- `bp_hyerin_mapping.maxpat`: pitch-to-color and amplitude/intensity/metadata mappings.
- `bp_eunmin_timbre.maxpat`: register/filter/harmonic treatment using shared analysis; harmonic oscillator is activity-gated by real star audio.
- `bp_janice_response.maxpat`: amplitude/onset-triggered additive response with source-derived pitch relationships.
- `bp_taewan_visuals.maxpat`: Jitter visuals and optional Ableton branch; failure of this side layer must not block recording.
- `bp_arrangement_mix.maxpat`: conservative layer mix, level/bypass buses, monitoring, clipping protection.
- `bp_recorder.maxpat`: `sfrecord~ 2` controlled by the verified open/start/stop/verify sequence.
- `bp_diagnostics.maxpat`: recorder diagnostic, local star loading/playback, real-flow buttons, layer-level presets.

Current scope remains the first stable target: original star recordings plus one final constellation WAV. No processed-star uploads, database migrations, website re-rendering, or Max-to-website analysis round trips have been added.
