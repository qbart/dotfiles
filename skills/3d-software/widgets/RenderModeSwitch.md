# RenderModeSwitch

RenderModeSwitch is a row of four icon buttons in the top-right corner of the 3D viewport.
The first button stands on its own and toggles X-ray: objects are drawn semi-transparent.
The next three are joined into one group and choose the rendering mode. Exactly one is on:
Wireframe - only the edges of the triangles, the surface is hidden
Solid - every object in one plain grey, to judge the form
Material - every object in its own materials
X-ray is independent of the mode: it stays on or off when the mode changes.
X-ray changes nothing in Wireframe, because there is no surface to see through.
The mode and X-ray are view state: not saved with the file, not on the undo stack.

## Input

Mouse - click the X-ray button to toggle it; click a mode button to choose that mode.
Clicking the mode that is already on does nothing.
Hovering a button shows a hint with its name, what it does and its key.
The buttons never take keyboard focus.

Keyboard -
Z - next mode: Wireframe -> Solid -> Material -> Wireframe
Alt + Z - toggle X-ray
Both are ignored while a text field has focus.
Z with Ctrl / Cmd or Shift is left alone, so undo and redo keep working.

Touch - same as mouse

## Theme

Button - 28 pt square, icon centred, corner radius 4 pt
Button on - accent fill, icon in the on-accent colour
Button hovered - hover fill, icon in the text colour
Button off - panel fill, icon in the muted text colour
Mode group - the three buttons touch; only the group's outer corners are rounded
Gap between the X-ray button and the group - one small space (same as the gap to the next tool)
Solid colour - grey (#b4b4b4)
Wireframe edges - near black (#121416), unlit, no fog, no shadows
X-ray opacity - 50 %

## Ask human once

1. Which mode does the viewport start in? (preferred in Material)
2. In Wireframe, should X-ray do nothing, or hide the edges at the back as Blender does?
