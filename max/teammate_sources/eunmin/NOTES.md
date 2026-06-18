# Eunmin — Source Notes

## Original files

Place Eunmin's untouched source files in:

```text
max/teammate_sources/eunmin/original/
```

Expected file:

- `eunmin_max.maxpat`

Do not edit the original directly. Adapted versions should go in `max/modules/`.

## What the work does

The patch loads several audio files into buffers, estimates the average pitch of each file, classifies the sounds into pitch ranges, and applies different additive or subtractive synthesis treatments before playing the results together.

Conceptual idea:

- lower-pitched sources can be made darker, heavier, or more filtered
- higher-pitched sources can be made brighter or more harmonically extended
- the differences between voices remain audible inside the collective result

## Inputs and outputs

Current prototype inputs:

- hardcoded or manually loaded audio files
- five source buffers in the current version

Current prototype output:

- combined audio signal sent to playback

The patch does not yet reliably export the result as a WAV file.

## Integration role

Recommended reusable parts:

- pitch-range classification
- subtractive filter path
- additive harmonic oscillator path
- timbral contrast between low-, middle-, and high-pitched inputs

Recommended adaptation:

- reuse the shared pitch analysis instead of duplicating it
- replace hardcoded files with the main system's `s_0`–`s_6` buffers
- extend support from five to seven stars
- output stereo audio signals to the shared mixer
- let the top-level recorder handle final WAV export

## Known limitations

- current patch supports five rather than seven sources
- some source files or parameters may be hardcoded
- pitch analysis overlaps with Hyerin's work
- no final recording/export stage
- gain staging and clipping prevention need testing
