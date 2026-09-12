export type Rect = { x: number; y: number; width: number; height: number };
export type Point = { x: number; y: number };

const NUMBER = String.raw`\d+(?:\.\d+)?`;
const RATIO_PATTERN = new RegExp(`^${NUMBER}(?:\\s*:\\s*${NUMBER})*$`);

/**
 * Parses "1:2:1" into [1, 2, 1]. Also accepts the fallback-command form ":resize 1:2:1" or "resize 1:2:1".
 * Returns undefined when the input is not a valid list of positive numbers.
 */
export function parseRatios(input: string): number[] | undefined {
  const text = input
    .trim()
    .replace(/^:?resize\b/i, "")
    .trim();
  if (!RATIO_PATTERN.test(text)) return undefined;

  const ratios = text.split(":").map(Number);
  return ratios.every((r) => r > 0) ? ratios : undefined;
}

/**
 * Splits `area` into side-by-side columns whose widths follow `ratios`, separated (and surrounded) by `gap` pixels.
 * Edges are rounded cumulatively so the columns always fill the area exactly, with no off-by-one drift.
 */
export function columns(area: Rect, ratios: number[], gap = 0): Rect[] {
  const total = ratios.reduce((sum, r) => sum + r, 0);
  const free = area.width - gap * (ratios.length + 1);

  let cumulative = 0;
  const edges = [0, ...ratios.map((r) => Math.round((free * (cumulative += r)) / total))];

  return ratios.map((_, i) => ({
    x: area.x + gap * (i + 1) + edges[i],
    y: area.y + gap,
    width: edges[i + 1] - edges[i],
    height: area.height - gap * 2,
  }));
}

export function contains(rect: Rect, point: Point): boolean {
  return point.x >= rect.x && point.x < rect.x + rect.width && point.y >= rect.y && point.y < rect.y + rect.height;
}
