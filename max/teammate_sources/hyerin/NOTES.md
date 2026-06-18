# Hyerin — Source Notes

## Original files

Place Hyerin's untouched source files in:

```text
max/teammate_sources/hyerin/original/
```

Expected files:

- `WavtoPitch.maxpat`
- `WavtoVolume.maxpat`
- `final for share ver6.maxpat`

Do not edit the originals directly. Adapted versions should go in `max/modules/`.

## What the work does

### Pitch analysis

The pitch patch manually loads one WAV file, plays it from a Max buffer, estimates pitch over time with `fzero~`, filters out implausible values, and calculates an approximate average pitch.

Intended mapping:

- lower pitch → warmer colors
- higher pitch → cooler colors

Suggested conceptual range from the teammate documentation:

- approximately 80–150 Hz: lower voice range
- approximately 160–250 Hz: middle voice range
- approximately 250–400 Hz: higher voice range

These ranges are heuristic and should not be treated as universal, especially for non-vocal or unpitched recordings.

### Volume analysis

The volume patch manually loads one WAV file and calculates a basic average-amplitude value over time.

Intended mapping:

- louder recording → closer to the constellation center
- quieter recording → farther from the center

This overlaps with browser-side values already available in the website, such as `volume_average` and `volume_peak`.

### Manual processing and mix prototype

The larger patch processes recordings one at a time, applies pitch- and amplitude-dependent transformations, writes intermediate processed WAV files, loads the processed files into separate buffers, combines them, and records one final mix WAV.

Conceptual idea:

- preserve each voice's individual characteristics
- exaggerate or clarify those characteristics through transformation
- combine the transformed voices into one collective constellation sound

## Inputs and outputs

Current prototype inputs:

- manually selected WAV files
- manual start/reset controls

Current prototype outputs:

- approximate average pitch value
- approximate average amplitude value
- optional individually processed WAV files
- one combined mix WAV

## Integration role

Recommended reusable parts:

- pitch-analysis logic
- amplitude-analysis logic, if Max-side validation is still wanted
- pitch-relative filtering or timbral transformation
- inverse gain normalization so quiet voices remain audible
- pitch-to-color and amplitude-to-radius mapping concepts

Recommended adaptation:

- replace manual `dropfile` input with paths or buffers supplied by the main system
- avoid duplicating volume analysis if website metadata is sufficient
- preserve the original star recording
- optionally create a processed-star version
- route processed audio signals directly into the final mixer

## Known limitations

- `fzero~` may be unreliable for whispers, silence, noise, environmental sounds, or polyphonic audio
- pitch averaging needs a defined fallback when no stable pitch is found
- amplitude output is not perceptual loudness
- current workflow is manual and must be automated during integration
