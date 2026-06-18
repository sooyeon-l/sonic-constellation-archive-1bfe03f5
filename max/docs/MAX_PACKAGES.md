# Max Package Requirements

This document separates required runtime dependencies from optional teammate-effect dependencies. Installation sources should be manually confirmed on the demo laptop before presentation; no secret values are stored here.

| Package/Object | Required? | Used by | Install source | Verification in Max | Fallback |
|---|---:|---|---|---|---|
| Node for Max / `node.script` | Required | `bp_bridge.maxpat`, backend contract, downloads, verification, upload | Bundled with Max 9; confirm in installed Max documentation | Open `max/sonic_constellation_main.maxpat`, click `script start` in `bp_bridge`, and confirm `maxBridge.js loaded` | None for backend contract |
| Node package `ffmpeg-static` | Required for WebM conversion | `max/maxBridge.js` | npm package already declared in `max/package.json`; install from npm when dependency install is approved | Node-for-Max console reports ffmpeg binary found; `downloadStars` creates WAV files | If absent, star audio cannot be converted; metadata/diagnostic paths only |
| `fzero~` | Required for Max-derived pitch analysis | `bp_analysis.maxpat`; Hyerin/Eunmin shared pitch source | Requires manual confirmation from the Max installation/package manager on this laptop | Create object `fzero~` without a `no such object` error | Use metadata/y-position fallback and treat pitch as unpitched |
| Jitter GL / `jit.world`, `jit.gl.gridshape`, `jit.gl.pass` | Intended/required for final visuals, not required for audio upload | `bp_taewan_visuals.maxpat` | Bundled with Max/Jitter; confirm in Max package/license setup | Open `bp_taewan_visuals.maxpat`; objects instantiate and window can open | Audio synthesis/recording continues through native MSP buses if visual window is closed |
| Ableton objects `abl.dsp.phaser~`, `abl.dsp.tides~` | Optional | Taewan-inspired optional effects branch in `bp_taewan_visuals.maxpat` | Requires manual confirmation; repository evidence does not prove install source | Object boxes instantiate without missing-object errors | Native `bp_arrangement_mix.maxpat` star/mix path remains the required fallback audio path |

## Policy

- The required audio path must work with native Max/MSP objects plus Node-for-Max and ffmpeg conversion.
- Optional package-dependent effects may be enabled on the demo machine after installation, but missing optional objects must not prevent synthesis, recording, verification, or backend upload.
- Jitter is part of the intended installation and should be tested, but closing the Jitter window must not block audio.
- Same-folder runtime bpatchers under `max/` exist because Max resolved them more reliably on the demo laptop. Canonical adapted module sources also remain under `max/modules/`.
