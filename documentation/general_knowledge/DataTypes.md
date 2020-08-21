---
##### 1. Point Cloud file (.pts)

The file contains X,Y,Z,Scalar(intesity),R(red),G(green),B(blue)

If you open such file in [CloudCompare](ComputerVisionTools.md/#1.CloudCompare), you can remove Scalar Field from Properties and see the real colours of the model. Also, on "register entities" we can select how many random sample points we want.

##### 2. Collada file (.dae)

 - should open it in a text editor and make sure the paths are correct (better use relative paths)

##### 3. Object file (.obj)

 - uses .mtl files
 
 - open in Blender (with mentions of tga files in .mtl or convert them to jpg or png)
 
 - format:
    - v: vertices (nodes) coordinates
    - vt: texture coordinates
    - vn: vertices normals
    - f: faces: 
        list of vertex line/normal line/texture line
        order matters (e.g. one direction of face has the normal towards up and opposite order has the normal towards down i.e. in one way the face is visible from camera and in the other way the face is not visible by the camera)
    - o or g: group the following
    - usemtl <name>: search for that name in mtl files (specified by mllib) and apply the rules of that name in the following faces
    

###### .mtl file

- kd: diffuse
- ka: ambient
- Tf or Tr: transparency
 

##### 4. .fbx

 - can open with Maya or Blender
 - should open it in a text editor and make sure the paths are correct (better use relative paths)