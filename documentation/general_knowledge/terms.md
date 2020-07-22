### Volumetric
Basically it's the representation of objects in 3D.
in oppose to 
### Multi View images 
which are multiple 2D representations
and 
### Depth map
which is an image or image channel that contains information relating to the distance of the surfaces of scene objects from a viewpoint.

### Affine transformation
a geometric transformation that preserves lines and parallelism (but not necessarily distances and angles)


### Saliency map
an image that shows each pixel's unique quality
Saliency can be seen as a segmentation problem...i.e. categorizing pixels...


### Octant (in solid geometry i.e. in geometry of 3-d euclidean space)
similar to quadrant for 2-dim and ray for 1-dim
where quadrant splits each of the two axes in half..so creates four boxes..
and ray splits a line into two..

### Octree
is a tree data structure in which each internal node has exactly eight children
![](../figures/octree.png)
so ... in places where our 3D object has boundaries and we want to show more details .. a node in one level of the octree is split and adds a new level in the octree :D
Each node in an octree subdivides the space it represents into eight octants.
A node stores an explicit three-dimensional point, which is the "center" of the subdivision for that node;
We use depth-first search and only required surfaces are viewed..