# Teammate Source Inventory and Intended Use

Files in `max/teammate_sources/` are reference submissions. Preserve them unchanged. Create adapted versions in `max/modules/`.

## Hyerin

### Original files

- `WavtoPitch.maxpat`
- `WavtoVolume.maxpat`
- `final for share ver6.maxpat`

### Contribution

- approximate average-pitch analysis using `fzero~` and averaging;
- amplitude/volume analysis prototype;
- pitch-based visual color concept;
- volume-based radial-distance concept;
- individual pitch- and volume-informed processing;
- manual prototype that creates processed star files and then mixes them into one WAV.

### Preserve in the integrated system

- pitch analysis logic where reliable;
- pitch-relative bright/dark or high/low timbral transformation;
- quiet/loud normalization concept;
- pitch-to-color and volume-to-distance mapping;
- idea that a star is transformed by joining a constellation.

### Stage 2 adapted modules

- `bp_analysis.maxpat` provides the shared pitch and amplitude analysis so Hyerin's analysis ideas are preserved without duplicating website metadata.
- `bp_hyerin_mapping.maxpat` maps pitch to hue and amplitude/metadata to intensity and placement-oriented buses.
- `bp_taewan_visuals.maxpat` consumes those buses for color and visual scale/position.

### Avoid duplicating

- browser-derived average volume and peak values already available in the website;
- unnecessary intermediate WAV export if the processed star only needs to feed the final mix.

## Eunmin

### Original file

- `eunmin_max.maxpat`

### Contribution

- analysis of several sources by pitch range;
- pitch-classified additive and subtractive synthesis treatment;
- harmonic oscillator layers;
- filter-based darkening or shaping;
- multi-source combined output concept.

### Preserve in the integrated system

- pitch-dependent additive/subtractive branch;
- harmonic layering derived from source pitch;
- timbral differentiation between low-, middle-, and high-pitched stars.

### Stage 2 adapted modules

- `bp_eunmin_timbre.maxpat` uses shared analysis rather than its own duplicate `fzero~`.
- It supports the seven shared star slots through `sc_star_mix` and the indexed analysis buses.
- Its harmonic oscillator branch is gated by real star activity so it cannot free-run during recorder diagnostics or silence.

### Adapt

- replace hardcoded demo files with the shared star buffers;
- support up to seven stars;
- route output into the shared stereo mix;
- reuse the shared pitch-analysis result instead of calculating the same feature twice.

## Janice

### Original file

- `the thing i am about to share.maxpat`

### Contribution

- amplitude-envelope and onset/threshold analysis;
- source-amplitude-derived rhythmic triggering;
- additive synthesized response tones;
- envelope-shaped gestures intended to evoke alien communication.

### Preserve in the integrated system

- amplitude-triggered generative response layer;
- additive voice gestures;
- rhythmic conversational behavior between submitted recordings and generated tones.

### Stage 2 adapted modules

- `bp_janice_response.maxpat` listens to the real star mix, uses amplitude/onset thresholds, and shapes additive response tones with `line~`.
- Response pitch is derived from shared analysis ranges rather than arbitrary random pitch selection.
- The response level is conservative and can be muted through `bp_diagnostics.maxpat`.

### Adapt

- replace random pitches with values derived from star pitch, order, or constellation statistics;
- allow trigger data from all active stars;
- treat this as a secondary response layer, not a replacement for the original recordings.

## Taewan

### Original files

- `MainSynth.maxpat`
- `AudioVisual.maxpat`

### Contribution

- polyphonic `poly~` voice organization;
- ADSR and note-state behavior;
- Jitter visual objects and effects;
- position, color, scale, motion, bloom, and glitch behavior;
- phaser and reverb/tide-style audio effects using Ableton-related objects.

### Preserve in the integrated system

- Jitter projection during synthesis;
- per-star visual activation and motion;
- polyphonic envelope organization;
- shared spatial/effects layer;
- bloom and motion effects where stable.

### Stage 2 adapted modules

- `bp_taewan_visuals.maxpat` maps star x/y metadata, shared pitch, and amplitude/intensity to Jitter position, color, scale, bloom, and motion/glitch behavior.
- Optional `abl.dsp.phaser~` and `abl.dsp.tides~` processing is represented as an optional branch.
- `bp_arrangement_mix.maxpat` provides native Max fallback mixing, so missing optional objects must not block required synthesis or recording.

### Adapt

- replace `kslider` with star trigger and analysis messages;
- replace purely random visual values with pitch, amplitude, peak, star index, and timing data;
- confirm Ableton package dependencies on the presentation laptop;
- provide a native-Max fallback effects path so synthesis still works if external objects fail.

## Integration ownership

The integration layer must:

- preserve attribution in comments and documentation;
- adapt, not overwrite, original teammate files;
- avoid counting duplicated pitch analysis or duplicated mixers as separate final features;
- keep each teammate’s concept visible in the final patch and presentation;
- document any source feature that is excluded and the technical or conceptual reason.
