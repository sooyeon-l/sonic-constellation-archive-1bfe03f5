// maxBridge.js — Sonic Constellation Max worker
// Backend-upload version:
// Max no longer uploads directly to Supabase Storage.
// Instead:
// Max -> /api/public/constellations/:id/upload-synth
// Backend uploads with service role and marks constellation ready.

const maxApi = require("max-api");
maxApi.post("maxBridge.js should start soon...");

const fs = require("fs");
const path = require("path");
const { execFile } = require("child_process");

maxApi.post("maxBridge.js starting...");

const PROJECT_DIR = __dirname;
const OUTPUT_DIR = path.join(PROJECT_DIR, "output");
const DOWNLOAD_DIR = path.join(PROJECT_DIR, "downloads");
const DEFAULT_SYNTH_WAV = path.join("output", "test_synth.wav");
const MIN_WAV_BYTES = 4096;

let config;
let SITE_URL;
let SUPABASE_URL;
let SUPABASE_PUBLISHABLE_KEY;
let SUPABASE_BUCKET;
let currentConstellation = null;

let autoTimer = null;
let isProcessing = false;

let _ffmpegBin = null;

try {
  const configPath = path.join(__dirname, "config.json");
  maxApi.post("Reading config from: " + configPath);

  config = JSON.parse(fs.readFileSync(configPath, "utf8"));

  SITE_URL = (config.SITE_URL || config.BASE_URL || "").replace(/\/$/, "");
  SUPABASE_URL = config.SUPABASE_URL;
  SUPABASE_PUBLISHABLE_KEY =
    config.SUPABASE_PUBLISHABLE_KEY || config.SUPABASE_ANON_KEY;
  SUPABASE_BUCKET = config.SUPABASE_BUCKET || "star-audio";

  if (!SITE_URL) {
    throw new Error("Missing SITE_URL or BASE_URL in config.json");
  }

  if (!config.MAX_WORKER_SECRET && !config.max_worker_secret) {
    throw new Error("Missing MAX_WORKER_SECRET in config.json");
  }

  ensureDirectory(OUTPUT_DIR);
  ensureDirectory(DOWNLOAD_DIR);

  maxApi.post("maxBridge.js loaded");
  maxApi.post("SITE_URL = " + SITE_URL);
  maxApi.post("SUPABASE_BUCKET = " + SUPABASE_BUCKET);
  maxApi.outlet("record_path", defaultSynthPath());
} catch (err) {
  maxApi.post("Startup error: " + err.message);
}

try {
  _ffmpegBin = require("ffmpeg-static");
  maxApi.post("[ffmpeg-static] binary found: " + _ffmpegBin);
} catch (e) {
  maxApi.post("[ffmpeg-static] NOT FOUND — run: npm install ffmpeg-static");
  maxApi.post(
    "[ffmpeg-static] Without it, .webm files cannot be converted to .wav."
  );
}

function requireStartup() {
  if (!SITE_URL || !config) {
    throw new Error(
      "maxBridge.js did not start correctly. Check config.json and startup logs."
    );
  }
}

async function getJson(url, options = {}) {
  const res = await fetch(url, options);
  const text = await res.text();

  if (!res.ok) {
    throw new Error(`HTTP ${res.status}: ${text.slice(0, 1000)}`);
  }

  if (text.trim().startsWith("<")) {
    throw new Error(
      "Endpoint returned HTML, not JSON. Check the API route: " + url
    );
  }

  return JSON.parse(text);
}

function workerHeaders() {
  return {
    "Content-Type": "application/json",
    "X-Max-Worker-Secret": config.MAX_WORKER_SECRET || config.max_worker_secret
  };
}

function ensureDirectory(dirPath) {
  fs.mkdirSync(dirPath, { recursive: true });
}

function resolveLocalPath(localFilename = DEFAULT_SYNTH_WAV) {
  const s = String(localFilename || DEFAULT_SYNTH_WAV);

  if (path.isAbsolute(s)) {
    return s;
  }

  return path.resolve(PROJECT_DIR, s);
}

function downloadPath(filename) {
  ensureDirectory(DOWNLOAD_DIR);
  return path.join(DOWNLOAD_DIR, filename);
}

function defaultSynthPath() {
  ensureDirectory(OUTPUT_DIR);
  return resolveLocalPath(DEFAULT_SYNTH_WAV);
}

function verifyWavFile(wavPath) {
  const localPath = resolveLocalPath(wavPath);
  if (!fs.existsSync(localPath)) {
    return { ok: false, path: localPath, size: 0, error: "missing" };
  }
  const size = fs.statSync(localPath).size;
  if (size < MIN_WAV_BYTES) {
    return { ok: false, path: localPath, size, error: "too_small" };
  }
  return { ok: true, path: localPath, size, error: null };
}

function convertWebmToWav(webmPath, wavPath) {
  return new Promise((resolve, reject) => {
    if (!_ffmpegBin) {
      reject(
        new Error(
          "ffmpeg-static not installed — run: npm install ffmpeg-static"
        )
      );
      return;
    }

    const args = [
      "-y",
      "-i",
      webmPath,
      "-ar",
      "44100",
      "-ac",
      "1",
      "-f",
      "wav",
      wavPath
    ];

    execFile(_ffmpegBin, args, { timeout: 30000 }, (err, _stdout, stderr) => {
      if (err) {
        reject(
          new Error(
            "ffmpeg: " +
              (stderr ? stderr.trim().split("\n").pop() : err.message)
          )
        );
      } else {
        resolve(wavPath);
      }
    });
  });
}

async function uploadSynthesizedWavThroughBackend(constellationId, wavPath) {
  requireStartup();

  const secret = config.MAX_WORKER_SECRET || config.max_worker_secret;

  if (!secret) {
    throw new Error("Missing MAX_WORKER_SECRET in config.json");
  }

  const verified = verifyWavFile(wavPath);
  const localPath = verified.path;

  if (!verified.ok) {
    throw new Error(
      "WAV file is not ready for upload (" + verified.error + "): " + localPath
    );
  }

  const audio_base64 = fs.readFileSync(localPath).toString("base64");
  const url = `${SITE_URL}/api/public/constellations/${constellationId}/upload-synth`;

  maxApi.post("Uploading synthesized WAV through backend:");
  maxApi.post(url);
  maxApi.post("Local WAV:");
  maxApi.post(localPath);

  const res = await fetch(url, {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
      "X-Max-Worker-Secret": secret
    },
    body: JSON.stringify({ audio_base64 })
  });

  if (!res.ok) {
    const text = await res.text();
    throw new Error(
      `Backend upload failed ${res.status}: ${text.slice(0, 1000)}`
    );
  }

  const json = await res.json();

  maxApi.post("WAV uploaded through backend successfully");

  const readyConstellation = json.constellation || json;
  const readyId =
    readyConstellation.id ||
    readyConstellation.constellation_id ||
    constellationId;
  const synthAudioPath =
    readyConstellation.synth_audio_path || `synthesized/${constellationId}.wav`;
  const synthAudioUrl = readyConstellation.synth_audio_url || "null";

  currentConstellation = {
    ...(currentConstellation || {}),
    ...readyConstellation,
    id: readyId,
    status: "ready",
    synth_audio_path: synthAudioPath,
    synth_audio_url: synthAudioUrl
  };

  maxApi.outlet("status", "ready");
  maxApi.outlet("synth_audio_path", synthAudioPath);
  maxApi.outlet("synth_audio_url", synthAudioUrl);
  maxApi.outlet("ready", readyId);

  return json;
}

maxApi.addHandler("fetchPending", async () => {
  try {
    requireStartup();

    const url = `${SITE_URL}/api/public/constellations/pending`;
    maxApi.post("Fetching pending constellations: " + url);

    const pending = await getJson(url);

    maxApi.post("Pending count: " + pending.length);

    if (!Array.isArray(pending) || pending.length === 0) {
      currentConstellation = null;
      maxApi.outlet("no_pending");
      return;
    }

    currentConstellation = pending[0];

    maxApi.post(
      "Selected constellation " +
        currentConstellation.id +
        " (" +
        (currentConstellation.stars?.length || 0) +
        " star(s), status " +
        currentConstellation.status +
        ")"
    );

    maxApi.outlet("constellation_id", currentConstellation.id);
    maxApi.outlet("title", currentConstellation.title || "untitled");
    maxApi.outlet("status", currentConstellation.status);
    maxApi.outlet("star_count", currentConstellation.stars?.length || 0);

    if (currentConstellation.synthesis_params) {
      maxApi.outlet(
        "synthesis_params",
        JSON.stringify(currentConstellation.synthesis_params)
      );
    }

    if (currentConstellation.mood_params) {
      maxApi.outlet(
        "mood_params",
        JSON.stringify(currentConstellation.mood_params)
      );
    }

    if (Array.isArray(currentConstellation.stars)) {
      for (const star of currentConstellation.stars) {
        maxApi.outlet(
          "star",
          star.id,
          star.audio_url || "null",
          star.max_audio_url || "null",
          Number(star.x_position || 0),
          Number(star.y_position || 0),
          Number(star.duration_seconds || 0),
          Number(star.volume_peak || 0),
          Number(star.volume_average || 0)
        );
      }
    }
  } catch (err) {
    maxApi.post("fetchPending error: " + err.message);
    maxApi.outlet("error", err.message);
  }
});

maxApi.addHandler("getDefaultSynthPath", async () => {
  try {
    requireStartup();
    const wavPath = defaultSynthPath();
    maxApi.outlet("record_path", wavPath);
    maxApi.post("Default synthesis output path is ready.");
  } catch (err) {
    maxApi.post("getDefaultSynthPath error: " + err.message);
    maxApi.outlet("error", err.message);
  }
});

maxApi.addHandler("verifyRecording", async (localWavFilename = DEFAULT_SYNTH_WAV) => {
  try {
    requireStartup();
    const verified = verifyWavFile(localWavFilename);
    if (!verified.ok) {
      maxApi.post(
        "Recording verification failed (" +
          verified.error +
          "): " +
          verified.path
      );
      maxApi.outlet("recording_failed", verified.error, verified.path, verified.size);
      return;
    }
    maxApi.post(
      "Recording verified: " +
        verified.path +
        " (" +
        Math.round(verified.size / 1024) +
        " KB)"
    );
    maxApi.outlet("recording_verified", verified.path, verified.size);
  } catch (err) {
    maxApi.post("verifyRecording error: " + err.message);
    maxApi.outlet("recording_failed", err.message, "null", 0);
  }
});

maxApi.addHandler("resolveLocalStar", async (index, localWavFilename) => {
  try {
    requireStartup();
    const i = Number(index);
    if (!Number.isInteger(i) || i < 0 || i > 6) {
      throw new Error("resolveLocalStar index must be 0-6");
    }
    const localPath = resolveLocalPath(localWavFilename);
    if (!fs.existsSync(localPath)) {
      throw new Error("Local star WAV does not exist: " + localPath);
    }
    const size = fs.statSync(localPath).size;
    if (size <= 0) {
      throw new Error("Local star WAV is empty: " + localPath);
    }
    maxApi.post(
      "Resolved local star " +
        i +
        ": " +
        localPath +
        " (" +
        Math.round(size / 1024) +
        " KB)"
    );
    maxApi.outlet("star_file", i, localPath);
  } catch (err) {
    maxApi.post("resolveLocalStar error: " + err.message);
    maxApi.outlet("star_file", Number(index) || 0, "null");
    maxApi.outlet("error", err.message);
  }
});

maxApi.addHandler("markSynthesizing", async (constellationId = null) => {
  try {
    requireStartup();

    const id = constellationId || currentConstellation?.id;

    if (!id) {
      throw new Error("No constellation id. Run fetchPending first.");
    }

    const url = `${SITE_URL}/api/public/constellations/${id}/mark-synthesizing`;

    maxApi.post("Marking synthesizing: " + id);

    const updated = await getJson(url, {
      method: "POST",
      headers: workerHeaders()
    });

    currentConstellation = updated;

    maxApi.outlet("status", updated.status);
    maxApi.outlet("constellation_id", updated.id);
  } catch (err) {
    maxApi.post("markSynthesizing error: " + err.message);
    maxApi.outlet("error", err.message);
  }
});

maxApi.addHandler(
  "uploadSynth",
  async (localWavFilename = DEFAULT_SYNTH_WAV) => {
    try {
      requireStartup();

      const id = currentConstellation?.id;

      if (!id) {
        throw new Error("No current constellation. Run fetchPending first.");
      }

      if (currentConstellation?.status === "pending_synthesis") {
        maxApi.post(
          "uploadSynth: current status is pending_synthesis; marking synthesizing first..."
        );

        const markSynthUrl = `${SITE_URL}/api/public/constellations/${id}/mark-synthesizing`;

        const updated = await getJson(markSynthUrl, {
          method: "POST",
          headers: workerHeaders()
        });

        currentConstellation = updated;
        maxApi.outlet("status", updated.status);
      }

      const localPath = resolveLocalPath(localWavFilename);

      maxApi.post("Uploading local WAV through backend:");
      maxApi.post(localPath);

      await uploadSynthesizedWavThroughBackend(id, localPath);
    } catch (err) {
      maxApi.post("uploadSynth error: " + err.message);
      maxApi.outlet("error", err.message);

      try {
        if (currentConstellation?.id) {
          const failUrl = `${SITE_URL}/api/public/constellations/${currentConstellation.id}/mark-failed`;

          await getJson(failUrl, {
            method: "POST",
            headers: workerHeaders(),
            body: JSON.stringify({
              error_message: err.message
            })
          });

          maxApi.post("uploadSynth: marked constellation failed.");
        }
      } catch (failErr) {
        maxApi.post("uploadSynth could not mark failed: " + failErr.message);
      }
    }
  }
);

maxApi.addHandler("markFailed", async (message = "Max synthesis failed") => {
  try {
    requireStartup();

    const id = currentConstellation?.id;

    if (!id) {
      throw new Error("No current constellation. Run fetchPending first.");
    }

    const url = `${SITE_URL}/api/public/constellations/${id}/mark-failed`;

    const updated = await getJson(url, {
      method: "POST",
      headers: workerHeaders(),
      body: JSON.stringify({
        error_message: message
      })
    });

    currentConstellation = updated;

    maxApi.outlet("status", updated.status);
    maxApi.outlet("failed", updated.id);
  } catch (err) {
    maxApi.post("markFailed error: " + err.message);
    maxApi.outlet("error", err.message);
  }
});

maxApi.addHandler("downloadStars", async () => {
  try {
    requireStartup();

    if (!currentConstellation?.stars?.length) {
      maxApi.post(
        "downloadStars: no constellation loaded. Run fetchPending first."
      );
      maxApi.outlet("error", "no_stars_to_download");
      return;
    }

    const stars = currentConstellation.stars;
    maxApi.post(`downloadStars: processing ${stars.length} star(s)...`);

    for (let i = 0; i < stars.length; i++) {
      const star = stars[i];

      if (!star.audio_url || star.audio_url === "null") {
        maxApi.post(`  [star ${i}] no audio_url — skipping`);
        maxApi.outlet("star_file", i, "null");
        continue;
      }

      const webmPath = downloadPath(`star_${i}.webm`);
      const wavPath = downloadPath(`star_${i}.wav`);

      try {
        maxApi.post(`  [star ${i}] downloading .webm...`);

        const res = await fetch(star.audio_url);
        if (!res.ok) {
          throw new Error(`HTTP ${res.status}`);
        }

        const rawBuf = Buffer.from(await res.arrayBuffer());
        fs.writeFileSync(webmPath, rawBuf);

        maxApi.post(
          `  [star ${i}] downloaded ${Math.round(rawBuf.length / 1024)} KB` +
            `  →  star_${i}.webm`
        );

        maxApi.post(`  [star ${i}] converting to .wav  (44100 Hz, mono)...`);

        await convertWebmToWav(webmPath, wavPath);

        const wavBytes = fs.statSync(wavPath).size;

        maxApi.post(
          `  [star ${i}] converted  ${Math.round(wavBytes / 1024)} KB` +
            `  →  star_${i}.wav`
        );

        maxApi.outlet("star_file", i, wavPath);
        maxApi.post(`  [star ${i}] wav path sent to Max ✓`);
      } catch (err) {
        maxApi.post(`  [star ${i}] ERROR: ${err.message}`);
        maxApi.post(
          `  [star ${i}] → sending null; star will use metadata oscillators only`
        );
        maxApi.outlet("star_file", i, "null");
      }
    }

    maxApi.post("downloadStars: all done. Click 'synthesize'.");
    maxApi.outlet("stars_downloaded");
  } catch (err) {
    maxApi.post("downloadStars error: " + err.message);
    maxApi.outlet("error", err.message);
  }
});

// Optional old node-side auto worker.
// Your current Max patch auto-worker probably does NOT use this.
// It is kept for compatibility, but the patch-based chain is still preferred.
async function processOnePending(
  localWavFilename = DEFAULT_SYNTH_WAV
) {
  requireStartup();

  if (isProcessing) {
    maxApi.post("Already processing. Skipping this cycle.");
    return;
  }

  isProcessing = true;

  try {
    const pendingUrl = `${SITE_URL}/api/public/constellations/pending`;
    maxApi.post("Auto worker: fetching pending constellations...");
    const pending = await getJson(pendingUrl);

    if (!Array.isArray(pending) || pending.length === 0) {
      maxApi.post("Auto worker: no pending constellations.");
      maxApi.outlet("auto", "no_pending");
      return;
    }

    currentConstellation = pending[0];
    const id = currentConstellation.id;

    maxApi.post("Auto worker: selected constellation " + id);
    maxApi.outlet("constellation_id", id);
    maxApi.outlet("title", currentConstellation.title || "untitled");
    maxApi.outlet("status", currentConstellation.status);
    maxApi.outlet("star_count", currentConstellation.stars?.length || 0);

    maxApi.post(
      "Auto worker note: processNext/startAuto only uploads an existing WAV. Use the Max patch auto chain for full download + synth."
    );

    const markSynthUrl = `${SITE_URL}/api/public/constellations/${id}/mark-synthesizing`;

    maxApi.post("Auto worker: marking synthesizing...");
    const synthesizing = await getJson(markSynthUrl, {
      method: "POST",
      headers: workerHeaders()
    });

    currentConstellation = synthesizing;
    maxApi.outlet("status", synthesizing.status);

    const localPath = resolveLocalPath(localWavFilename);

    if (!fs.existsSync(localPath)) {
      throw new Error("Local WAV file not found: " + localPath);
    }

    maxApi.post("Auto worker: uploading local WAV through backend:");
    maxApi.post(localPath);

    await uploadSynthesizedWavThroughBackend(id, localPath);
  } catch (err) {
    maxApi.post("Auto worker error: " + err.message);
    maxApi.outlet("error", err.message);

    try {
      if (currentConstellation?.id) {
        const failUrl = `${SITE_URL}/api/public/constellations/${currentConstellation.id}/mark-failed`;

        await getJson(failUrl, {
          method: "POST",
          headers: workerHeaders(),
          body: JSON.stringify({
            error_message: err.message
          })
        });

        maxApi.post("Auto worker: marked constellation failed.");
      }
    } catch (failErr) {
      maxApi.post("Auto worker could not mark failed: " + failErr.message);
    }
  } finally {
    isProcessing = false;
  }
}

maxApi.addHandler(
  "processNext",
  async (localWavFilename = DEFAULT_SYNTH_WAV) => {
    try {
      await processOnePending(localWavFilename);
    } catch (err) {
      maxApi.post("processNext error: " + err.message);
      maxApi.outlet("error", err.message);
    }
  }
);

maxApi.addHandler(
  "startAuto",
  (intervalMs = 5000, localWavFilename = DEFAULT_SYNTH_WAV) => {
    try {
      requireStartup();

      const ms = Number(intervalMs) || 5000;

      if (autoTimer) {
        clearInterval(autoTimer);
        autoTimer = null;
      }

      maxApi.post(
        `Auto worker started. Interval = ${ms} ms, WAV = ${localWavFilename}`
      );

      processOnePending(localWavFilename);

      autoTimer = setInterval(() => {
        processOnePending(localWavFilename);
      }, ms);

      maxApi.outlet("auto", "started", ms, localWavFilename);
    } catch (err) {
      maxApi.post("startAuto error: " + err.message);
      maxApi.outlet("error", err.message);
    }
  }
);

maxApi.addHandler("stopAuto", () => {
  if (autoTimer) {
    clearInterval(autoTimer);
    autoTimer = null;
    maxApi.post("Auto worker stopped.");
    maxApi.outlet("auto", "stopped");
  } else {
    maxApi.post("Auto worker was not running.");
    maxApi.outlet("auto", "not_running");
  }
});
