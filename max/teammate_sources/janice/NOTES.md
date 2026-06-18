# Janice — Source Notes

## Original files

Place Janice's untouched source files in:

```text
max/teammate_sources/janice/original/
```

Expected file:

- `the thing i am about to share.maxpat`

Do not edit the original directly. Adapted versions should go in `max/modules/`.

## What the work does

The patch analyzes the amplitude behavior of an audio source and uses changes in amplitude to trigger synthesized tones. The generated gestures are intended to evoke alien communication or a call-and-response relationship with the human recordings.

The patch uses additive oscillator voices and amplitude-controlled envelopes. In its current form, it primarily demonstrates the idea with one sound and uses some random pitch generation.

Conceptual idea:

- the constellation does not only replay human voices
- it also produces a synthetic response, as if the constellation were answering
- rhythmic or amplitude changes in the recording can trigger these response gestures

## Inputs and outputs

Current prototype input:

- one manually loaded or playlist-based audio source

Current prototype output:

- synthesized additive tones triggered by source amplitude behavior

## Integration role

Recommended reusable parts:

- amplitude or onset detection
- event-trigger logic
- additive oscillator bank
- envelope shapes
- rhythmic call-and-response behavior

Recommended adaptation:

- replace random note generation with values derived from source pitch, star index, or constellation statistics
- accept trigger and analysis data from each star
- use the generated tones as a secondary layer rather than replacing the original recordings
- route the output into the shared stereo mixer

## Known limitations

- current prototype does not handle 5–7 files at once
- generated pitches are not yet meaningfully tied to source characteristics
- no final WAV export
- requires integration with the main buffer and timing system
