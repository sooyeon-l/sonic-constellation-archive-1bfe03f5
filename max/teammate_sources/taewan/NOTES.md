# Taewan — Source Notes

## Original files

Place Taewan's untouched source files in:

```text
max/teammate_sources/taewan/original/
```

Expected files:

- `MainSynth.maxpat`
- `AudioVisual.maxpat`

Keep both files together because the main patch depends on the voice/visual patch.

Do not edit the originals directly. Adapted versions should go in `max/modules/`.

## What the work does

The project is a polyphonic audiovisual Max/Jitter instrument. MIDI-style note input triggers synthesized voices, envelopes, spatial movement, and Jitter visuals. The visual system uses random values for color, position, direction, and movement, with note-on and note-off states controlling when visual elements appear.

The patch also uses audio effects such as phaser and reverb through Ableton-related Max objects.

Conceptual idea:

- make the synthesis process visible in the classroom
- show individual stars becoming active as their sounds are triggered
- create bloom, motion, and spatial movement that feel connected to the sonic process

## Inputs and outputs

Current prototype input:

- `kslider` or MIDI-style note events

Current prototype outputs:

- polyphonic synthesized audio
- Jitter visual output

## Integration role

Recommended reusable parts:

- `poly~` voice organization
- ADSR envelope structure
- note-on and note-off event handling
- phaser/reverb processing
- Jitter star rendering
- bloom and motion-glitch effects
- per-star visual activation

Recommended adaptation:

- replace `kslider` input with star trigger messages from the main controller
- replace random color, position, scale, and rotation with meaningful pitch/amplitude/star-position values where appropriate
- drive visuals from the same timing data used by the audio synthesis
- test Ableton package dependencies on the presentation laptop
- provide a native-Max fallback if Ableton objects fail

## Known limitations

- current patch does not load the submitted WAV recordings
- audio input is MIDI/keyboard-oriented rather than file-oriented
- Ableton-specific objects may require additional packages or Live integration
- random visual mapping should be replaced or constrained if the final piece requires explicit meaning
