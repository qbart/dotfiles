# Setup

1. Setup repo in way that core module contains operations/logic only, and visualiztion layer is seperate that depends on it.
Becuase future MCP or other client app might need it.
2. Create a theme.[ext] file in repository maintaing color constants and common sizes (consider this as a styles.css equivalent).

## Ask human once

0. What is the application name and how executable will be named?
1. What is the theme Accent Color?
2. What is the theme Dark/Light.
3. Which language software must be written? and which UI library? (prefer Rust)
4. Should Canvas with Axes3D should be set up?

## Preferred libraries

Only for Rust now:
- crate bevy - 3d engine
- crate egui - UI library
- https://github.com/qbart/imgio (image processing library)
- https://github.com/qbart/matma (math library)
- https://github.com/qbart/meshopt-pure (mesh optimizer library)

Other languages -> do esearch.
