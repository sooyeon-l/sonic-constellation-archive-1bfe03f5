export const QUESTION_TEXT =
  "What sound do you wish you could hear one more time?";

export const MIN_CONSTELLATION_STARS = 3;
export const MAX_CONSTELLATION_STARS = 7;

interface StarLike {
  id: string;
  audio_url: string;
  audio_path: string;
  mime_type: string | null;
  duration_seconds: number;
  volume_peak: number | null;
  volume_average: number | null;
  x_position: number;
  y_position: number;
  color: string;
}

function clamp(v: number, min: number, max: number) {
  return Math.min(max, Math.max(min, v));
}

export function buildSynthesisParams(stars: StarLike[]) {
  return {
    version: 1,
    voice_count: stars.length,
    voices: stars.map((s, index) => ({
      star_id: s.id,
      index,
      audio_url: s.audio_url,
      audio_path: s.audio_path,
      mime_type: s.mime_type,
      duration_seconds: s.duration_seconds,
      pan: Number((s.x_position * 2 - 1).toFixed(3)),
      pitch: Number((1 - s.y_position).toFixed(3)),
      gain: Number(
        clamp(0.2 + (s.volume_average ?? 0.3) * 2, 0.2, 1).toFixed(3),
      ),
      peak: s.volume_peak,
      color: s.color,
    })),
  };
}

export function buildMoodParams(stars: StarLike[]) {
  const n = Math.max(1, stars.length);
  const totalDuration = stars.reduce((a, s) => a + s.duration_seconds, 0);
  const avgVolume =
    stars.reduce((a, s) => a + (s.volume_average ?? 0), 0) / n;
  const maxPeak = stars.reduce((a, s) => Math.max(a, s.volume_peak ?? 0), 0);
  const avgBrightness = stars.reduce((a, s) => a + (1 - s.y_position), 0) / n;
  return {
    version: 1,
    star_count: stars.length,
    total_duration_seconds: Number(totalDuration.toFixed(2)),
    density: Number((stars.length / Math.max(1, totalDuration)).toFixed(4)),
    energy: Number(clamp(avgVolume * 3, 0, 1).toFixed(3)),
    peak: Number(maxPeak.toFixed(3)),
    brightness: Number(avgBrightness.toFixed(3)),
    palette: stars.map((s) => s.color),
  };
}