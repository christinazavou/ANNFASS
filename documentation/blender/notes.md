
Blender dependency graph:
---
The main goal of dependency graph is to make sure scene data is properly updated after any change in the most efficient way. Dependency graph is doing that by preprocessing scene - creating graph where nodes are entities of the scene (for example, objects) and edges are relations between these objects (for example, when Object A has a parent Object B, the graph will have an edge between nodes which corresponds to these two objects). For example, the dependency graph is responsible for f-curves evaluation, but not for edge subdivide operation in mesh edit mode.


Notes
---
- One Blender window has only one active workspace.
- The workspace itself defines render engine.
- The workspace itself defines active scene layer (layer which is visible in all editors of this workspace).


Render camera clip
---
With the Sidebar open, to adjust the views camera settings click the View tab, and in the View subsection, adjust Clip Start (default 0.1m) to change how close objects can be to the camera before rendering is clipped, and End (default 1000m) to modify how distant the far plain is before clipping the scene and object within.

Clipping Start/End: For very large, dense scenes, render times can get huge. If the camera were
allowed to see out to infinity, it might spend infinity trying to calculate the color of something
way off in the distance that really does not matter much. For this reason, Blender offers clipping
values. Set the End clip value to the maximum distance from the camera, called the Z distance,
that you want the camera to see. 


Rotation
---
Quaternions can be used to represent rotation, so they're useful for graphics:

Unit quaternions provide a convenient mathematical notation for representing orientations and rotations of objects in three dimensions. Compared to Euler angles they are simpler to compose and avoid the problem of gimbal lock. Compared to rotation matrices they are more numerically stable and may be more efficient.


Tutorials:
- [render with light and blender window setup](https://www.youtube.com/watch?v=lr3-M1P6JYo&ab_channel=CGBoost)

