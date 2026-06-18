const fs = require('fs');
const path = require('path');
const root = path.resolve(__dirname, '..');
const main = path.join(root, 'sonic_constellation_main.maxpat');
const required = [
  'bp_bridge.maxpat','bp_controller.maxpat','bp_star_bank.maxpat','bp_analysis.maxpat','bp_voice_engine.maxpat','bp_hyerin_mapping.maxpat','bp_eunmin_timbre.maxpat','bp_janice_response.maxpat','bp_taewan_visuals.maxpat','bp_arrangement_mix.maxpat','bp_recorder.maxpat','bp_diagnostics.maxpat'
];
function readJson(file) { return JSON.parse(fs.readFileSync(file, 'utf8')); }
function texts(patch) { return patch.patcher.boxes.map((b) => b.box.text || b.box.name || '').filter(Boolean); }
readJson(main);
for (const file of required) readJson(path.join(root, 'modules', file));
const mainTexts = texts(readJson(main));
for (const file of required) {
  if (!mainTexts.some((t) => String(t).includes(file))) throw new Error('Main patch missing bpatcher reference: ' + file);
}
const star = texts(readJson(path.join(root, 'modules', 'bp_star_bank.maxpat'))).join('\n');
for (let i=0;i<7;i++) {
  if (!star.includes('buffer~ s_' + i)) throw new Error('Missing buffer~ s_' + i);
  if (!star.includes('play~ s_' + i)) throw new Error('Missing play~ s_' + i);
  if (!star.includes('send~ sc_star_' + i)) throw new Error('Missing indexed star send sc_star_' + i);
}
const analysis = texts(readJson(path.join(root, 'modules', 'bp_analysis.maxpat'))).join('\n');
for (let i=0;i<7;i++) {
  if (!analysis.includes('receive~ sc_star_' + i)) throw new Error('Analysis missing indexed receive sc_star_' + i);
}
if (!analysis.includes('s sc_analysis_pitch_by_star') || !analysis.includes('s sc_analysis_amp_by_star')) throw new Error('Analysis missing indexed output buses');
const synth = fs.readFileSync(path.join(root, 'synthEngine.js'), 'utf8');
if (!synth.includes('star_meta')) throw new Error('synthEngine missing star_meta metadata bus');
const hyerin = texts(readJson(path.join(root, 'modules', 'bp_hyerin_mapping.maxpat'))).join('\n');
if (!hyerin.includes('route star_meta') || !hyerin.includes('s sc_star_x') || !hyerin.includes('s sc_star_y')) throw new Error('Hyerin mapping missing star metadata routing');
const taewan = texts(readJson(path.join(root, 'modules', 'bp_taewan_visuals.maxpat'))).join('\n');
if (!taewan.includes('route visual_star_0 visual_star_1 visual_star_2 visual_star_3 visual_star_4 visual_star_5 visual_star_6 visual_reset') || !taewan.includes('jit.world sc_visual')) throw new Error('Taewan visuals missing indexed star-event/Jitter routing');
const recorder = texts(readJson(path.join(root, 'modules', 'bp_recorder.maxpat'))).join('\n');
if (!recorder.includes('sfrecord~ 2')) throw new Error('Recorder missing sfrecord~ 2');
if (!recorder.includes('receive~ sc_final_l') || !recorder.includes('receive~ sc_final_r')) throw new Error('Recorder missing final stereo receives');
const mix = texts(readJson(path.join(root, 'modules', 'bp_arrangement_mix.maxpat'))).join('\n');
for (const bus of ['receive~ sc_star_mix','receive~ sc_voice_mix','receive~ sc_eunmin_mix','receive~ sc_janice_mix','send~ sc_final_l','send~ sc_final_r']) {
  if (!mix.includes(bus)) throw new Error('Mix patch missing ' + bus);
}
if (!mix.includes('receive~ sc_taewan_optional_mix')) throw new Error('Mix patch missing Taewan optional receive');
const taewanOptional = texts(readJson(path.join(root, 'modules', 'bp_taewan_visuals.maxpat'))).join('\n');
if (!taewanOptional.includes('abl.dsp.phaser~') || !taewanOptional.includes('abl.dsp.tides~') || !taewanOptional.includes('send~ sc_taewan_optional_mix')) throw new Error('Taewan optional Ableton branch missing');
// Runtime mirror checks: Max bpatcher lookup is same-folder-first on the demo machine.
const mainPatch = readJson(main);
const bpatcherNames = mainPatch.patcher.boxes.filter((b) => b.box.maxclass === 'bpatcher').map((b) => b.box.name);
for (const name of bpatcherNames) {
  const runtimeFile = path.join(root, name);
  if (!fs.existsSync(runtimeFile)) throw new Error('Missing root runtime mirror for bpatcher: ' + name);
  readJson(runtimeFile);
}
const runtimeBridge = texts(readJson(path.join(root, 'bp_bridge.maxpat'))).join('\n');
if (!runtimeBridge.includes('node.script maxBridge.js')) throw new Error('Root bp_bridge must use same-folder maxBridge.js path');
const runtimeController = texts(readJson(path.join(root, 'bp_controller.maxpat'))).join('\n');
if (!runtimeController.includes('js synthEngine.js')) throw new Error('Root bp_controller must use same-folder synthEngine.js path');

// Runtime safety checks found during Max manual testing.
for (const bridgeFile of [path.join(root, 'bp_bridge.maxpat'), path.join(root, 'modules', 'bp_bridge.maxpat')]) {
  const bridgePatch = readJson(bridgeFile);
  const hasRawPrint = bridgePatch.patcher.lines.some((l) => l.patchline.source[0] === 'node' && l.patchline.destination[0] === 'print');
  if (hasRawPrint) throw new Error('Bridge has raw bridge debug print that can expose signed URLs: ' + bridgeFile);
}
const voiceRoot = texts(readJson(path.join(root, 'bp_voice_engine.maxpat'))).join('\n');
if (!voiceRoot.includes('alloff')) throw new Error('Root voice engine missing alloff diagnostic mute');
const voiceModule = texts(readJson(path.join(root, 'modules', 'bp_voice_engine.maxpat'))).join('\n');
if (!voiceModule.includes('alloff')) throw new Error('Module voice engine missing alloff diagnostic mute');
const controllerModule = texts(readJson(path.join(root, 'modules', 'bp_controller.maxpat'))).join('\n');
if (new RegExp('C:' + '\\\\\\\\Users|' + 'My' + ' Drive').test(controllerModule)) throw new Error('Module controller contains machine-specific path');

for (const eunminFile of [path.join(root, 'bp_eunmin_timbre.maxpat'), path.join(root, 'modules', 'bp_eunmin_timbre.maxpat')]) {
  const eunminText = texts(readJson(eunminFile)).join('\n');
  if (!eunminText.includes('peakamp~ 50') || !eunminText.includes('> 0.01') || !eunminText.includes('*~ 0.')) {
    throw new Error('Eunmin harmonic branch must be amplitude-gated: ' + eunminFile);
  }
}

for (const voiceFile of [path.join(root, 'bp_voice_engine.maxpat'), path.join(root, 'modules', 'bp_voice_engine.maxpat')]) {
  const voiceText = texts(readJson(voiceFile)).join('\n');
  if (!voiceText.includes('setvoicegain')) throw new Error('Voice engine missing diagnostic setvoicegain route: ' + voiceFile);
}
const synthText = fs.readFileSync(path.join(root, 'synthEngine.js'), 'utf8');
if (!synthText.includes('setvoicegain')) throw new Error('synthEngine missing diagnostic setvoicegain control');
if (!synthText.includes('"visual_star_" + i') || !synthText.includes('run_full_flow')) {
  throw new Error('synthEngine missing indexed visual events or one-click run_full_flow');
}

// Portability and expanded integration checks.
const allPatchFiles = [main, ...required.map((f) => path.join(root, f)), ...required.map((f) => path.join(root, 'modules', f))];
for (const file of allPatchFiles) {
  const raw = fs.readFileSync(file, 'utf8');
  if (new RegExp('C:' + '\\\\\\\\Users|' + 'My' + ' Drive').test(raw)) throw new Error('Patch contains machine-specific absolute path: ' + file);
}
const expandedAnalysis = texts(readJson(path.join(root, 'modules', 'bp_analysis.maxpat'))).join('\n');
for (const bus of ['s sc_analysis_pitched_by_star','s sc_analysis_norm_pitch_by_star','s sc_analysis_norm_amp_by_star','s sc_analysis_duration_by_star','s sc_analysis_avg_amp_by_star','s sc_analysis_xy_by_star']) {
  if (!expandedAnalysis.includes(bus)) throw new Error('Analysis missing expanded bus: ' + bus);
}
const mixRoot = texts(readJson(path.join(root, 'bp_arrangement_mix.maxpat'))).join('\n');
for (const bus of ['r sc_star_level','r sc_voice_level','r sc_eunmin_level','r sc_janice_level','r sc_taewan_level']) {
  if (!mixRoot.includes(bus)) throw new Error('Mix missing level/bypass bus: ' + bus);
}
const diagRoot = texts(readJson(path.join(root, 'bp_diagnostics.maxpat'))).join('\n');
for (const bus of ['s sc_star_level','s sc_voice_level','s sc_eunmin_level','s sc_janice_level','s sc_taewan_level']) {
  if (!diagRoot.includes(bus)) throw new Error('Diagnostics missing level control send: ' + bus);
}
for (const bridgeFile of [path.join(root, 'bp_bridge.maxpat'), path.join(root, 'modules', 'bp_bridge.maxpat')]) {
  const bridgeText = texts(readJson(bridgeFile)).join('\n');
  if (bridgeText.includes('print sc_bridge_debug')) throw new Error('Bridge still contains raw debug print object: ' + bridgeFile);
}

const bridgeSource = fs.readFileSync(path.join(root, 'maxBridge.js'), 'utf8');
if (!bridgeSource.includes('MIN_WAV_BYTES') || !bridgeSource.includes('Refusing upload: recording verification failed')) {
  throw new Error('maxBridge uploadSynth must verify WAV size before trusted backend upload');
}
const synthSource = fs.readFileSync(path.join(root, 'synthEngine.js'), 'utf8');
if (!synthSource.includes('if (uploadAfterVerify)') || !synthSource.includes('outlet(1, "uploadSynth", verifiedPath)')) {
  throw new Error('synthEngine must gate uploadSynth behind recording_verified');
}

for (const patchFile of allPatchFiles) {
  const patch = readJson(patchFile);
  const seen = new Set();
  for (const entry of patch.patcher.boxes || []) {
    const id = entry.box && entry.box.id;
    if (!id) continue;
    if (seen.has(id)) throw new Error('Duplicate box id ' + id + ' in ' + patchFile);
    seen.add(id);
  }
}

for (const eunminFile of [path.join(root, 'bp_eunmin_timbre.maxpat'), path.join(root, 'modules', 'bp_eunmin_timbre.maxpat')]) {
  const eunminText = texts(readJson(eunminFile)).join('\n');
  if (!eunminText.includes('clip 80. 1000.') || !eunminText.includes('* 2.')) {
    throw new Error('Eunmin harmonic branch must derive from shared pitch: ' + eunminFile);
  }
}

const fallbackPatch = readJson(path.join(root, 'constellation_synth.maxpat'));
const fallbackText = texts(fallbackPatch).join('\n');
if (fallbackText.includes('print bridge_debug')) throw new Error('Fallback patch must not raw-print bridge_debug signed URLs');
const bridgeSource2 = fs.readFileSync(path.join(root, 'maxBridge.js'), 'utf8');
if (!bridgeSource2.includes('verifyWavFile(localPath)')) throw new Error('uploadSynth must call verifyWavFile(localPath)');
for (const visualFile of [path.join(root, 'bp_taewan_visuals.maxpat'), path.join(root, 'modules', 'bp_taewan_visuals.maxpat')]) {
  const visualText = texts(readJson(visualFile)).join('\n');
  if (!visualText.includes('loadbang') || !visualText.includes('enable 1, floating 1') || !visualText.includes('@shape plane') || !visualText.includes('jit.anim.drive')) {
    throw new Error('Taewan visuals must load a visible Taewan-style plane animation: ' + visualFile);
  }
}

const mainTextFull = texts(readJson(main)).join('\n');
for (const control of ['script start','fetchPending','downloadStars','markSynthesizing','synthesize','recorder_diagnostic','run_full_flow','delay 1800','s sc_bridge_commands','s sc_controller_commands']) {
  if (!mainTextFull.includes(control)) throw new Error('Main patch missing top-level demo control: ' + control);
}
for (const visualFile of [path.join(root, 'bp_taewan_visuals.maxpat'), path.join(root, 'modules', 'bp_taewan_visuals.maxpat')]) {
  const visualText = texts(readJson(visualFile)).join('\n');
  if ((visualText.match(/@shape plane/g) || []).length < 7) throw new Error('Taewan visual needs layered plane gridshapes: ' + visualFile);
  for (const requiredVisual of ['jit.anim.drive','jit.gl.pass sc_visual @fxname motionglitch','jit.gl.pass sc_visual @fxname bloom-hq','@depth_enable 0','translucent plane','route visual_star_0 visual_star_1 visual_star_2 visual_star_3 visual_star_4 visual_star_5 visual_star_6 visual_reset','@shape cube','@shape cone']) {
    if (!visualText.includes(requiredVisual)) throw new Error('Taewan visual missing adapted original feature ' + requiredVisual + ': ' + visualFile);
  }
  if (visualText.includes('noise_amt') || visualText.includes('bloom_amt')) {
    throw new Error('Taewan visual contains guessed jit.gl.pass attrs rejected by Max runtime: ' + visualFile);
  }
  const visualPatch = readJson(visualFile);
  const directAnimToShape = visualPatch.patcher.lines.some((l) => {
    const src = l.patchline.source[0];
    const dst = l.patchline.destination[0];
    return src === 'anim' && /^(plane|accent)\d+$/.test(dst);
  });
  if (directAnimToShape) throw new Error('Taewan visual should not fan jit.anim.drive directly to every gridshape: ' + visualFile);
  for (const l of visualPatch.patcher.lines) {
    const src = l.patchline.source[0];
    const dst = l.patchline.destination[0];
    const inlet = l.patchline.destination[1];
    let m;
    if ((m = src.match(/^sx(\d+)$/)) && dst === `pos${m[1]}` && inlet !== 1) throw new Error('sx must feed pos inlet 1, preserving position symbol: ' + visualFile);
    if ((m = src.match(/^sy(\d+)$/)) && dst === `pos${m[1]}` && inlet !== 2) throw new Error('sy must feed pos inlet 2, preserving position symbol: ' + visualFile);
    if ((m = src.match(/^ampWide(\d+)$/)) && dst === `scale${m[1]}` && inlet !== 1) throw new Error('ampWide must feed scale inlet 1, preserving scale symbol: ' + visualFile);
    if ((m = src.match(/^ampThin(\d+)$/)) && dst === `scale${m[1]}` && inlet !== 2) throw new Error('ampThin must feed scale inlet 2, preserving scale symbol: ' + visualFile);
    if ((m = src.match(/^rot(\d+)$/)) && dst === `rotpak${m[1]}` && inlet !== 3) throw new Error('rot must feed rotatexyz inlet 3, preserving rotatexyz symbol: ' + visualFile);
    if (src.match(/^scale\d+$/) && dst.match(/^accent\d+$/)) throw new Error('Ribbon scale messages should not resize accent shapes: ' + visualFile);
  }
}
console.log('Modular Max static validation passed.');
