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
