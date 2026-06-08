import { supabase } from "@/integrations/supabase/client";

export const QUESTION_TEXT =
  "What sound do you wish you could hear one more time?";

export const STAR_COLORS = [
  "#fef3c7",
  "#fde68a",
  "#fca5a5",
  "#f9a8d4",
  "#c4b5fd",
  "#93c5fd",
  "#67e8f9",
  "#86efac",
];

export interface StarRow {
  id: string;
  question_text: string;
  audio_url: string;
  audio_path: string;
  max_audio_url: string | null;
  mime_type: string | null;
  duration_seconds: number;
  volume_peak: number | null;
  volume_average: number | null;
  x_position: number;
  y_position: number;
  color: string;
  created_at: string;
  constellation_id: string | null;
}

export interface ConstellationRow {
  id: string;
  title: string;
  question_text: string;
  created_at: string;
}

export interface ConstellationWithStars extends ConstellationRow {
  stars: StarRow[];
}

export interface RecordingMeta {
  durationSeconds: number;
  volumePeak: number;
  volumeAverage: number;
  mimeType: string;
}

export function randomColor() {
  return STAR_COLORS[Math.floor(Math.random() * STAR_COLORS.length)];
}

export function randomPosition() {
  const pad = 0.08;
  return {
    x: pad + Math.random() * (1 - pad * 2),
    y: pad + Math.random() * (1 - pad * 2),
  };
}

export async function fetchStars(): Promise<StarRow[]> {
  const { data, error } = await supabase
    .from("stars")
    .select(
      "id, question_text, audio_url, audio_path, max_audio_url, mime_type, duration_seconds, volume_peak, volume_average, x_position, y_position, color, created_at, constellation_id",
    )
    .order("created_at", { ascending: true });
  if (error) throw error;
  return (data ?? []) as StarRow[];
}

export async function fetchConstellations(): Promise<ConstellationWithStars[]> {
  const [{ data: cons, error: cErr }, { data: stars, error: sErr }] =
    await Promise.all([
      supabase
        .from("constellations")
        .select("id, title, question_text, created_at")
        .order("created_at", { ascending: true }),
      supabase
        .from("stars")
        .select(
          "id, question_text, audio_url, audio_path, max_audio_url, mime_type, duration_seconds, volume_peak, volume_average, x_position, y_position, color, created_at, constellation_id",
        )
        .not("constellation_id", "is", null)
        .order("created_at", { ascending: true }),
    ]);
  if (cErr) throw cErr;
  if (sErr) throw sErr;
  const byCon = new Map<string, StarRow[]>();
  for (const s of (stars ?? []) as StarRow[]) {
    if (!s.constellation_id) continue;
    const arr = byCon.get(s.constellation_id) ?? [];
    arr.push(s);
    byCon.set(s.constellation_id, arr);
  }
  return ((cons ?? []) as ConstellationRow[]).map((c) => ({
    ...c,
    stars: byCon.get(c.id) ?? [],
  }));
}

export async function createConstellationFromStars(
  starIds: string[],
  title?: string,
): Promise<ConstellationRow> {
  if (starIds.length === 0) throw new Error("No stars to constellate.");
  const finalTitle =
    title?.trim() ||
    `Constellation ${new Date().toLocaleString(undefined, { dateStyle: "short", timeStyle: "short" })}`;
  const { data: con, error: cErr } = await supabase
    .from("constellations")
    .insert({ title: finalTitle, question_text: QUESTION_TEXT })
    .select()
    .single();
  if (cErr || !con) throw cErr ?? new Error("Failed to create constellation.");
  const { error: uErr } = await supabase
    .from("stars")
    .update({ constellation_id: con.id })
    .in("id", starIds)
    .is("constellation_id", null);
  if (uErr) throw uErr;
  return con as ConstellationRow;
}

export async function uploadAndInsertStar(
  blob: Blob,
  meta: RecordingMeta,
): Promise<StarRow> {
  if (!blob.type.startsWith("audio/")) {
    throw new Error("Recording is not an audio file.");
  }
  if (blob.size > 10 * 1024 * 1024) {
    throw new Error("Recording is larger than 10MB.");
  }
  if (meta.durationSeconds < 0.5 || meta.durationSeconds > 120) {
    throw new Error("Recording must be between 0.5 and 120 seconds.");
  }

  const id = crypto.randomUUID();
  const path = `recordings/${id}.webm`;

  const { error: upErr } = await supabase.storage
    .from("star-audio")
    .upload(path, blob, { contentType: meta.mimeType, upsert: false });
  if (upErr) throw upErr;

  // Private bucket: produce a long-lived signed URL for playback + Max consumption.
  const { data: signed, error: signErr } = await supabase.storage
    .from("star-audio")
    .createSignedUrl(path, 60 * 60 * 24 * 365);
  if (signErr || !signed) throw signErr ?? new Error("Failed to sign URL");

  const pos = randomPosition();
  const row = {
    id,
    question_text: QUESTION_TEXT,
    audio_url: signed.signedUrl,
    audio_path: path,
    mime_type: meta.mimeType,
    duration_seconds: Number(meta.durationSeconds.toFixed(2)),
    volume_peak: Number(meta.volumePeak.toFixed(4)),
    volume_average: Number(meta.volumeAverage.toFixed(4)),
    x_position: Number(pos.x.toFixed(4)),
    y_position: Number(pos.y.toFixed(4)),
    color: randomColor(),
  };

  const { data, error } = await supabase
    .from("stars")
    .insert(row)
    .select()
    .single();
  if (error) throw error;
  return data as StarRow;
}

export function isRecordingSupported(): boolean {
  if (typeof window === "undefined") return true;
  return Boolean(
    navigator.mediaDevices &&
      typeof navigator.mediaDevices.getUserMedia === "function" &&
      typeof window.MediaRecorder !== "undefined",
  );
}