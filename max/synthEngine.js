// synthEngine.js — Max 9 js object for Sonic Constellation
// Inlets:  0  messages from patch
// Outlets: 0  synth commands -> route objects -> audio objects
//          1  bridge commands -> node.script maxBridge.js
//
// sfrecord~ control: "open <path>" opens, int 1 starts, int 0 stops.

outlets = 2;
inlets = 1;

var stars = [];
var starCount = 0;
var constellationId = null;
var isSynthesizing = false;
var starAudioLoaded = {};
var SYNTH_MS = 10000;
var MAX_STARS = 7;
var DEFAULT_SYNTH_WAV = "output/test_synth.wav";
var currentRecordingPath = DEFAULT_SYNTH_WAV;
var uploadAfterVerify = false;
var RECORD_OPEN_DELAY_MS = 250;
var RECORD_START_DELAY_MS = 700;
var DIAGNOSTIC_MS = 3000;

// Bridge message handlers

function constellation_id() {
  var newId = arrayfromargs(arguments).join(" ");

  if (constellationId !== newId) {
    constellationId = newId;
    stars = [];
    starCount = 0;
    isSynthesizing = false;
    starAudioLoaded = {};
    post(
      "New constellation_id: " +
        constellationId +
        " - cleared previous star data\n"
    );
  } else {
    post(
      "Same constellation_id received again: " +
        constellationId +
        " - keeping loaded stars\n"
    );
  }
}

function title() {
  post("title: " + arrayfromargs(arguments).join(" ") + "\n");
}

function star_count(n) {
  starCount = parseInt(n, 10) || 0;

  // A new fetchPending call is about to send a fresh star list.
  // Clear the old list so repeated polling does not append duplicates.
  stars = [];
  starAudioLoaded = {};

  post(
    "Expecting " + starCount + " stars - cleared previous fetched star list\n"
  );
}

function star() {
  var a = arrayfromargs(arguments);

  stars.push({
    id: String(a[0]),
    x: parseFloat(a[3]) || 0.5,
    y: parseFloat(a[4]) || 0.5,
    duration: parseFloat(a[5]) || 3.0,
    volume_peak: parseFloat(a[6]) || 0.5,
    volume_avg: parseFloat(a[7]) || 0.3
  });

  post("Star " + stars.length + "/" + starCount + "\n");
}

function star_file() {
  var args = arrayfromargs(arguments);
  var index = parseInt(args[0], 10);
  var filePath = String(args[1]);

  if (filePath === "null" || filePath === "") {
    post("Star " + index + ": no audio file - will use metadata synthesis\n");
    starAudioLoaded[index] = false;
    return;
  }

  if (index < 0 || index >= MAX_STARS) {
    return;
  }

  // Send the file path out to the Max patch.
  // The patch should route: loadstar index filepath -> buffer~ s_index
  outlet(0, "loadstar", index, filePath);

  // Mark as loaded after sending the load command.
  starAudioLoaded[index] = true;

  post(
    "Star " +
      index +
      " WAV path sent to Max patch for buffer loading: " +
      filePath +
      "\n"
  );
}

function stars_downloaded() {
  post("All star audio files downloaded. Click synthesize to run.\n");
}

function synthesis_params(j) {
  post("synthesis_params: " + j + "\n");
}

function mood_params(j) {
  post("mood_params: " + j + "\n");
}

function no_pending() {
  post("no_pending\n");
}

function status() {
  post("status: " + arrayfromargs(arguments).join(" ") + "\n");
}

function record_path() {
  currentRecordingPath = arrayfromargs(arguments).join(" ");
  post("record_path: " + currentRecordingPath + "\n");
}

function recording_verified() {
  var args = arrayfromargs(arguments);
  var verifiedPath = String(args[0] || currentRecordingPath);
  var size = parseInt(args[1], 10) || 0;
  silenceAudio();
  post(
    "Recording verified (" +
      size +
      " bytes): " +
      verifiedPath +
      "\n"
  );

  if (uploadAfterVerify) {
    uploadAfterVerify = false;
    outlet(1, "uploadSynth", verifiedPath);
    post("Upload triggered after recording verification.\n");
  }
}

function recording_failed() {
  var args = arrayfromargs(arguments);
  var reason = String(args[0] || "unknown");
  var failedPath = String(args[1] || currentRecordingPath);
  var shouldMarkFailed = uploadAfterVerify;
  silenceAudio();
  uploadAfterVerify = false;
  isSynthesizing = false;
  post("Recording failed verification (" + reason + "): " + failedPath + "\n");

  if (shouldMarkFailed) {
    outlet(1, "markFailed", "Recording failed verification: " + reason);
  }
}

function ready() {
  post("ready: " + arrayfromargs(arguments).join(" ") + "\n");
}

function synth_audio_path() {
  post("synth_audio_path: " + arrayfromargs(arguments).join(" ") + "\n");
}

function synth_audio_url() {
  post("synth_audio_url: " + arrayfromargs(arguments).join(" ") + "\n");
}

function error() {
  post("BRIDGE ERROR: " + arrayfromargs(arguments).join(" ") + "\n");
}

// Manual controls

function test_metadata() {
  stars = [
    {
      id: "t0",
      x: 0.14,
      y: 0.76,
      duration: 3.5,
      volume_peak: 0.79,
      volume_avg: 0.41
    },
    {
      id: "t1",
      x: 0.84,
      y: 0.27,
      duration: 2.8,
      volume_peak: 0.63,
      volume_avg: 0.3
    },
    {
      id: "t2",
      x: 0.51,
      y: 0.92,
      duration: 4.0,
      volume_peak: 0.87,
      volume_avg: 0.52
    },
    {
      id: "t3",
      x: 0.09,
      y: 0.43,
      duration: 3.2,
      volume_peak: 0.55,
      volume_avg: 0.21
    },
    {
      id: "t4",
      x: 0.72,
      y: 0.61,
      duration: 3.0,
      volume_peak: 0.74,
      volume_avg: 0.47
    }
  ];

  starCount = stars.length;

  post(
    "Test metadata loaded (" + stars.length + " fake stars, no audio files).\n"
  );
  post("Send synthesize to run oscillator-only synthesis.\n");
  post(
    "For real star audio: fetchPending -> downloadStars -> markSynthesizing -> synthesize.\n"
  );
}

function clear() {
  stars = [];
  starCount = 0;
  constellationId = null;
  isSynthesizing = false;
  starAudioLoaded = {};
  uploadAfterVerify = false;
  post("Cleared.\n");
}

function start_record() {
  uploadAfterVerify = false;
  outlet(1, "getDefaultSynthPath");
  outlet(0, "dsp_start");

  var tOpen = new Task(function () {
    outlet(0, "record_open", currentRecordingPath);
    post("Manual record open command sent: " + currentRecordingPath + "\n");
  }, this);
  tOpen.schedule(RECORD_OPEN_DELAY_MS);

  var tStart = new Task(function () {
    outlet(0, "record_start");
  }, this);

  tStart.schedule(RECORD_START_DELAY_MS);
  post("Manual record open + start scheduled.\n");
}

function stop_record() {
  outlet(0, "record_stop");
  silenceAudio();
  var t = new Task(function () {
    outlet(1, "verifyRecording", currentRecordingPath);
  }, this);
  t.schedule(700);
  post("Manual record stop; verification scheduled.\n");
}

function recorder_diagnostic() {
  if (isSynthesizing) {
    post("Cannot run recorder_diagnostic while synthesizing.\n");
    return;
  }

  uploadAfterVerify = false;
  outlet(1, "getDefaultSynthPath");
  outlet(0, "dsp_start");

  var tOpen = new Task(function () {
    outlet(0, "record_open", currentRecordingPath);
    post("Recorder diagnostic open command sent: " + currentRecordingPath + "\n");
  }, this);
  tOpen.schedule(RECORD_OPEN_DELAY_MS);

  var tStart = new Task(function () {
    outlet(0, "setfreq", 440);
    outlet(0, "setsubfreq", 440);
    outlet(0, "setpan", 0.5);
    outlet(0, "setfilter", 5000);
    outlet(0, "setnoise", 0);
    outlet(0, "record_start");
    outlet(0, "setenv", 0.0, 1.0, 0.2, 50.0, 0.0, DIAGNOSTIC_MS - 100.0);
    post("Recorder diagnostic started: 440 Hz tone for 3 seconds.\n");
  }, this);
  tStart.schedule(RECORD_START_DELAY_MS);

  var tStop = new Task(function () {
    outlet(0, "record_stop");
    silenceAudio();
    post("Recorder diagnostic stop command sent.\n");
  }, this);
  tStop.schedule(RECORD_START_DELAY_MS + DIAGNOSTIC_MS + 200);

  var tVerify = new Task(function () {
    outlet(1, "verifyRecording", currentRecordingPath);
    post("Recorder diagnostic verification requested.\n");
  }, this);
  tVerify.schedule(RECORD_START_DELAY_MS + DIAGNOSTIC_MS + 1200);
}

function silenceAudio() {
  outlet(0, "setenv", 0.0, 50.0);
  outlet(0, "setnoise", 0.0);
}

// Main synthesis

function synthesize() {
  if (isSynthesizing) {
    post("Already synthesizing. Send stop_record to reset.\n");
    return;
  }

  if (stars.length === 0) {
    post("No stars loaded. Send test_metadata or fetchPending first.\n");
    return;
  }

  isSynthesizing = true;
  uploadAfterVerify = true;
  outlet(0, "dsp_start");

  var n = stars.length;
  var audioCount = 0;

  for (var k = 0; k < n; k++) {
    if (starAudioLoaded[k]) {
      audioCount++;
    }
  }

  post(
    "Synthesizing " +
      n +
      " stars (" +
      audioCount +
      " with audio, " +
      (n - audioCount) +
      " metadata-only).\n"
  );

  outlet(1, "getDefaultSynthPath");

  var tOpen = new Task(function () {
    outlet(0, "record_open", currentRecordingPath);
    post("Recording open command sent: " + currentRecordingPath + "\n");
  }, this);
  tOpen.schedule(RECORD_OPEN_DELAY_MS);

  var tStart = new Task(function () {
    outlet(0, "record_start");
    post("Recording start command sent.\n");
  }, this);

  tStart.schedule(RECORD_START_DELAY_MS);

  var span = SYNTH_MS * 0.6;
  var step = n > 1 ? span / (n - 1) : 0;

  for (var i = 0; i < n; i++) {
    var s = stars[i];
    scheduleVoice(
      RECORD_START_DELAY_MS + 200 + i * step,
      s.x,
      s.y,
      s.volume_peak,
      s.volume_avg,
      i
    );
  }

  var tStop = new Task(function () {
    outlet(0, "record_stop");
    post("Recording stop command sent.\n");
  }, this);

  tStop.schedule(SYNTH_MS + RECORD_START_DELAY_MS + 300);

  var tVerify = new Task(function () {
    outlet(1, "verifyRecording", currentRecordingPath);
    isSynthesizing = false;
    post("Recording verification requested.\n");
  }, this);

  tVerify.schedule(SYNTH_MS + RECORD_START_DELAY_MS + 1400);
}

// Voice scheduler

function scheduleVoice(delayMs, x, y, vp, va, idx) {
  var freq = Math.round(130.0 + y * 390.0);
  var subfreq = Math.round(freq * 0.497);
  var amp = clamp(0.28 + va * 0.52, 0.2, 0.82);
  var pan = clamp(x, 0.02, 0.98);
  var filt = Math.round(210.0 + y * 2200.0);
  var noise = clamp(vp * 0.28, 0.04, 0.36);
  var hasAudio = starAudioLoaded[idx] === true && idx >= 0 && idx < MAX_STARS;

  function voiceFn(f, sf, a, p, fc, n, i, ha) {
    outlet(0, "setfreq", f);
    outlet(0, "setsubfreq", sf);
    outlet(0, "setpan", p);
    outlet(0, "setfilter", fc);
    outlet(0, "setnoise", n);
    outlet(0, "setenv", 0.0, 1.0, a, 200.0, 0.0, 900.0);

    if (ha) {
      outlet(0, "star" + i + "_amp", a * 0.85);
      outlet(0, "star" + i + "_play");
    }
  }

  var t = new Task(
    voiceFn,
    this,
    freq,
    subfreq,
    amp,
    pan,
    filt,
    noise,
    idx,
    hasAudio
  );
  t.schedule(delayMs);
}

function clamp(v, lo, hi) {
  return Math.max(lo, Math.min(hi, v));
}
