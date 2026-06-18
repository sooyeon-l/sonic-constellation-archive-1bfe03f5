# Modular Max Manual Test Checklist

Canonical checklist: `max/docs/TEST_CHECKLIST.md`.

Use `max/sonic_constellation_main.maxpat` for the modular system. Keep `max/constellation_synth.maxpat` as the Stage 1 rollback baseline.

## Recorder Diagnostic

1. Open `max/sonic_constellation_main.maxpat` in Max 9.
2. Start `node.script` in `bp_bridge` if it is not already running.
3. In `bp_diagnostics`, click `recorder_diagnostic`.
4. Confirm one audible tone fades/stops after about 3 seconds.
5. Confirm `max/output/test_synth.wav` verifies and is playable.

## Local Star Buffer Playback

For each downloaded file currently present under `max/downloads/`:

1. Click `load_local_star N downloads/star_N.wav`.
2. Open the matching `buffer~ s_N` in `bp_star_bank` and confirm nonzero waveform/duration.
3. Click `playstar N` and listen for that original recording.
4. Repeat for N = 0 through 5 now, and N = 6 after a seven-star constellation is downloaded.
5. Use the layer-level mute/default controls in `bp_diagnostics` to compare original-only and transformed playback.

## Real Constellation Flow

1. Create or use a pending 5-7 star constellation on the website.
2. In `max/sonic_constellation_main.maxpat`, click the top-level one-click demo button. It starts Node-for-Max, waits briefly, then runs `fetchPending -> downloadStars -> markSynthesizing -> synthesize`.
3. Confirm bridge logs constellation id/status and star count without dumping signed URLs.
4. Confirm WebM/WAV files appear under `max/downloads/`.
5. Use the individual `fetchPending`, `downloadStars`, `markSynthesizing`, and `synthesize` buttons only when debugging a specific step.
7. Confirm playback includes recognizable original voices plus quiet transformation/response layers.
8. Confirm `max/output/test_synth.wav` verifies before upload.
9. Confirm backend status becomes ready and website playback uses `/synth-audio`.

## Visual Test

1. Confirm `sc_visual` opens with Taewan-style translucent ribbons/planes and accent shapes, not simple circles.
2. During synthesis, confirm each star index changes its own visual voice using source-derived x/y, amplitude, and pitch.
3. Confirm bloom and motion-glitch respond during active stars.
4. Confirm closing the Jitter window does not interrupt audio recording or upload gating.

## Rollback

If the modular patch fails, reopen `max/constellation_synth.maxpat`, which is the verified Stage 1 baseline.
