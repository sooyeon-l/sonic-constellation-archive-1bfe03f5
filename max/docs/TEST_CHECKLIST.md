# Max 9 Test Checklist

Use `max/sonic_constellation_main.maxpat` for the modular system. Keep `max/constellation_synth.maxpat` as the verified Stage 1 rollback patch.

## Fast Smoke Test

1. Quit and reopen Max 9.
2. Open `max/sonic_constellation_main.maxpat`.
3. Click the top-level one-click demo button only when you have a pending constellation ready.
4. For recorder-only testing, click `script start`, then `recorder_diagnostic`.
5. Confirm one audible tone plays for about 3 seconds, then silence.
6. Confirm `max/output/test_synth.wav` verifies and is playable.

## Local Star Test

1. In `bp_diagnostics`, click `load_local_star N downloads/star_N.wav`.
2. In `bp_star_bank`, inspect `buffer~ s_N` for nonzero waveform/duration.
3. Click `playstar N`.
4. Repeat for indices `0` through `6` when files are present.
5. Use the layer-level mute controls to compare original-only playback against transformed playback.

## Real Backend Flow

1. Create or use one pending 5-7 star constellation on the website.
2. In the top-level patch, click the one-click demo button. It sends `script start`, waits briefly, then runs `fetchPending -> downloadStars -> markSynthesizing -> synthesize`.
3. Confirm star count, title, and status are logged without signed URL dumping.
4. Confirm WebM/WAV files appear in `max/downloads/`.
5. Use the individual `fetchPending`, `downloadStars`, `markSynthesizing`, and `synthesize` buttons only for debugging.
7. Confirm the output includes recognizable original voices and controlled transformation layers.
8. Confirm `max/output/test_synth.wav` verifies before upload.
9. Confirm the website can play the completed constellation through the backend synth-audio route.

## Visual And Optional Package Test

1. Open `bp_taewan_visuals`.
2. Confirm the Jitter window opens with Taewan-style translucent plane/ribbon visuals and accent shapes, not circles or a single static object.
3. During synthesis, confirm stars 0-6 trigger distinct position, scale, color-opacity, rotation, bloom, and motion-glitch changes.
4. Confirm closing the Jitter window does not stop audio synthesis or recording.
5. If Ableton objects are installed, confirm `abl.dsp.phaser~` and `abl.dsp.tides~` instantiate.
6. If Ableton objects are missing, confirm the native mix path still records and verifies.

## Rollback

If the modular patch blocks the demo, reopen `max/constellation_synth.maxpat` and use the verified Stage 1 workflow.
