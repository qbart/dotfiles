import { test } from "node:test";
import assert from "node:assert/strict";
import { columns, contains, parseRatios } from "../src/layout.ts";

test("parseRatios accepts plain and fallback forms", () => {
  assert.deepEqual(parseRatios("1:2:1"), [1, 2, 1]);
  assert.deepEqual(parseRatios(" 1 : 2 : 1 "), [1, 2, 1]);
  assert.deepEqual(parseRatios(":resize 1:2:1"), [1, 2, 1]);
  assert.deepEqual(parseRatios("resize 1.5:1"), [1.5, 1]);
  assert.deepEqual(parseRatios("3"), [3]);
});

test("parseRatios rejects garbage", () => {
  for (const bad of ["", ":resize", "1:0:1", "1::2", "a:b", "1:2:", "-1:2", ":resizer 1:2"]) {
    assert.equal(parseRatios(bad), undefined, bad);
  }
});

test("columns fill the area exactly without gaps", () => {
  const area = { x: 0, y: 25, width: 1440, height: 875 };
  assert.deepEqual(columns(area, [1, 2, 1]), [
    { x: 0, y: 25, width: 360, height: 875 },
    { x: 360, y: 25, width: 720, height: 875 },
    { x: 1080, y: 25, width: 360, height: 875 },
  ]);
});

test("columns with gaps and uneven rounding still end at the right edge", () => {
  const area = { x: 1920, y: 0, width: 1001, height: 600 };
  const rects = columns(area, [1, 1, 1], 10);
  assert.equal(rects[0].x, 1930);
  const last = rects[rects.length - 1];
  assert.equal(last.x + last.width, area.x + area.width - 10);
  assert.equal(
    rects.reduce((sum, r) => sum + r.width, 0),
    1001 - 40,
  );
  assert.ok(rects.every((r) => r.y === 10 && r.height === 580));
});

test("contains uses half-open bounds", () => {
  const rect = { x: 0, y: 0, width: 100, height: 100 };
  assert.ok(contains(rect, { x: 0, y: 99 }));
  assert.ok(!contains(rect, { x: 100, y: 50 }));
});
