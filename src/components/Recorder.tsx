import { useEffect, useRef, useState } from "react";
import { useMicLevel } from "@/lib/mic-level-context";
import {
  isRecordingSupported,
  uploadAndInsertStar,
  type RecordingMeta,
  type StarRow,
} from "@/lib/stars";

type Phase = "idle" | "recording" | "preview" | "submitting";

interface Props {
  onSubmitted: (star: StarRow) => void;
  disabled?: boolean;
  disabledMessage?: string;
}

function formatTime(s: number) {
  const m = Math.floor(s / 60);
  const sec = Math.floor(s % 60);
  return `${String(m).padStart(2, "0")}:${String(sec).padStart(2, "0")}`;
}

export function Recorder({ onSubmitted, disabled, disabledMessage }: Props) {
  const mic = useMicLevel();
  const [supported, setSupported] = useState(true);
  const [phase, setPhase] = useState<Phase>("idle");
  const [elapsed, setElapsed] = useState(0);
  const [message, setMessage] = useState<string | null>(null);
  const [previewUrl, setPreviewUrl] = useState<string | null>(null);

  const streamRef = useRef<MediaStream | null>(null);
  const recorderRef = useRef<MediaRecorder | null>(null);
  const chunksRef = useRef<BlobPart[]>([]);
  const audioCtxRef = useRef<AudioContext | null>(null);
  const analyserRef = useRef<AnalyserNode | null>(null);
  const startTsRef = useRef(0);
  const timerRef = useRef<number | null>(null);
  const peakRef = useRef(0);
  const sumRef = useRef(0);
  const samplesRef = useRef(0);
  const meterRafRef = useRef<number | null>(null);
  const blobRef = useRef<Blob | null>(null);
  const metaRef = useRef<RecordingMeta | null>(null);

  const [analyserState, setAnalyserState] = useState<AnalyserNode | null>(null);

  useEffect(() => {
    setSupported(isRecordingSupported());
  }, []);

  const cleanup = () => {
    if (timerRef.current) {
      window.clearInterval(timerRef.current);
      timerRef.current = null;
    }
    if (meterRafRef.current != null) {
      cancelAnimationFrame(meterRafRef.current);
      meterRafRef.current = null;
    }
    if (streamRef.current) {
      streamRef.current.getTracks().forEach((t) => t.stop());
      streamRef.current = null;
    }
    if (audioCtxRef.current) {
      audioCtxRef.current.close().catch(() => undefined);
      audioCtxRef.current = null;
    }
    analyserRef.current = null;
    setAnalyserState(null);
  };

  useEffect(() => () => cleanup(), []);

  const startRecording = async () => {
    if (disabled) return;
    setMessage(null);
    if (previewUrl) URL.revokeObjectURL(previewUrl);
    setPreviewUrl(null);
    chunksRef.current = [];
    peakRef.current = 0;
    sumRef.current = 0;
    samplesRef.current = 0;

    try {
      const stream = await navigator.mediaDevices.getUserMedia({ audio: true });
      streamRef.current = stream;

      const AudioCtx =
        window.AudioContext ||
        (window as unknown as { webkitAudioContext: typeof AudioContext })
          .webkitAudioContext;
      const ctx = new AudioCtx();
      audioCtxRef.current = ctx;
      const src = ctx.createMediaStreamSource(stream);
      const analyser = ctx.createAnalyser();
      analyser.fftSize = 1024;
      src.connect(analyser);
      analyserRef.current = analyser;
      setAnalyserState(analyser);

      const buf = new Uint8Array(analyser.fftSize);
      const tick = () => {
        analyser.getByteTimeDomainData(buf);
        let sum = 0;
        let peak = 0;
        for (let i = 0; i < buf.length; i++) {
          const v = Math.abs((buf[i] - 128) / 128);
          sum += v * v;
          if (v > peak) peak = v;
        }
        const rms = Math.sqrt(sum / buf.length);
        if (peak > peakRef.current) peakRef.current = peak;
        sumRef.current += rms;
        samplesRef.current += 1;
        mic.publish(rms);
        meterRafRef.current = requestAnimationFrame(tick);
      };
      meterRafRef.current = requestAnimationFrame(tick);

      const mimeCandidates = ["audio/webm;codecs=opus", "audio/webm", "audio/mp4"];
      const mimeType =
        mimeCandidates.find((m) => MediaRecorder.isTypeSupported(m)) ?? "";
      const rec = mimeType
        ? new MediaRecorder(stream, { mimeType })
        : new MediaRecorder(stream);
      recorderRef.current = rec;

      rec.ondataavailable = (e) => {
        if (e.data.size > 0) chunksRef.current.push(e.data);
      };
      rec.onstop = () => {
        const type = rec.mimeType || "audio/webm";
        const blob = new Blob(chunksRef.current, { type });
        const duration = (Date.now() - startTsRef.current) / 1000;
        const avg =
          samplesRef.current > 0 ? sumRef.current / samplesRef.current : 0;
        const meta: RecordingMeta = {
          durationSeconds: duration,
          volumePeak: peakRef.current,
          volumeAverage: avg,
          mimeType: type,
        };
        blobRef.current = blob;
        metaRef.current = meta;
        setPreviewUrl(URL.createObjectURL(blob));
        cleanup();
        setPhase("preview");
      };

      startTsRef.current = Date.now();
      setElapsed(0);
      timerRef.current = window.setInterval(() => {
        const e = (Date.now() - startTsRef.current) / 1000;
        setElapsed(e);
        if (e >= 120) stopRecording();
      }, 200);

      rec.start();
      setPhase("recording");
    } catch (err) {
      console.error(err);
      setMessage("Microphone access was denied or unavailable.");
      cleanup();
      setPhase("idle");
    }
  };

  const stopRecording = () => {
    const rec = recorderRef.current;
    if (rec && rec.state !== "inactive") rec.stop();
  };

  const discard = () => {
    if (previewUrl) URL.revokeObjectURL(previewUrl);
    setPreviewUrl(null);
    blobRef.current = null;
    metaRef.current = null;
    setMessage(null);
    setPhase("idle");
  };

  const submit = async () => {
    if (!blobRef.current || !metaRef.current) return;
    setPhase("submitting");
    setMessage(null);
    try {
      const inserted = await uploadAndInsertStar(
        blobRef.current,
        metaRef.current,
      );
      if (previewUrl) URL.revokeObjectURL(previewUrl);
      setPreviewUrl(null);
      blobRef.current = null;
      metaRef.current = null;
      setMessage("A star has been created.");
      setPhase("idle");
      onSubmitted(inserted);
    } catch (err) {
      console.error(err);
      setMessage(err instanceof Error ? err.message : "Upload failed.");
      setPhase("preview");
    }
  };

  if (!supported) {
    return (
      <div className="rounded-lg border border-border/40 bg-card/40 p-6 text-center text-sm text-muted-foreground">
        Voice recording is not supported on this browser. Please try Chrome or
        Safari updated to the latest version.
      </div>
    );
  }

  const recordLocked = Boolean(disabled) && phase === "idle";

  return (
    <div className="flex flex-col items-center gap-6">
      <div className="relative flex h-80 w-80 items-center justify-center">
        <button
          onClick={() => {
            if (phase === "idle") startRecording();
            else if (phase === "recording") stopRecording();
          }}
          disabled={phase === "submitting" || recordLocked}
          className="relative z-10 flex h-32 w-32 items-center justify-center rounded-full border border-amber-200/50 bg-zinc-900/80 text-sm font-medium text-amber-100 backdrop-blur transition hover:bg-zinc-800 disabled:opacity-50"
          aria-label={phase === "recording" ? "Stop recording" : "Start recording"}
        >
          {phase === "recording" ? (
            <span className="flex flex-col items-center gap-1">
              <span className="h-4 w-4 rounded-sm bg-amber-300" />
              <span className="font-mono text-xs">{formatTime(elapsed)}</span>
            </span>
          ) : phase === "submitting" ? (
            "Uploading…"
          ) : recordLocked ? (
            "Session full"
          ) : (
            "Tap to record"
          )}
        </button>
      </div>

      {recordLocked && (
        <p className="max-w-xs text-center text-xs text-amber-200/85" role="status">
          {disabledMessage ??
            "This constellation is full — create it or reset the session to record more."}
        </p>
      )}

      {phase === "preview" && previewUrl && (
        <div className="flex w-full max-w-md flex-col items-center gap-3">
          <audio src={previewUrl} controls className="w-full" />
          <div className="flex gap-2">
            <button
              type="button"
              onClick={submit}
              className="rounded-md bg-amber-200 px-4 py-2 text-sm font-medium text-zinc-900 transition hover:bg-amber-100 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-amber-200 disabled:opacity-60"
            >
              Submit
            </button>
            <button
              type="button"
              onClick={discard}
              className="rounded-md border border-white/35 bg-transparent px-4 py-2 text-sm font-medium text-white/85 transition hover:bg-white/10 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-white/60"
            >
              Discard
            </button>
          </div>
        </div>
      )}

      {phase === "recording" && (
        <button
          type="button"
          onClick={stopRecording}
          className="rounded-md border border-red-400/60 bg-red-500/15 px-4 py-2 text-sm font-medium text-red-100 transition hover:bg-red-500/25 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-red-300"
        >
          Stop
        </button>
      )}

      {message && (
        <p className="text-sm text-amber-200/90" role="status">
          {message}
        </p>
      )}
    </div>
  );
}