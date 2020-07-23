OctNet: Learning Deep 3D Representations at High Resolutions
---
(http://www.cvlibs.net/publications/Riegler2017CVPR.pdf)

### From Abstract, Conclusion and Images

### Goal
a deep learning model that deals with sparse 3D data

### How
hierarchically partition the space using a set of unbalanced octrees where each leaf node stores a pooled feature representation
--> memory allocation more on dense regions!
==> we can use deep networks without compromising the input resolution because of memory

### interesting
- in fig.2 a grid of 4by4 voxels (16 voxels) can represent a 3D space...if a voxel can be represented by an octree of depth 3 --> 16^3 voxels resolution

- fig.3 octree is the representation of all those voxels...the bit representation has the root that represents that amount of volume (8by8 small voxels) and the childs are 6 empties (voxels of size 4by4 small voxels) and 2 with more splits, each with 6 empties (voxels of size 2by2 small voxels) and 2 with more splits. note that each split is dividing a big voxel into 4 smaller

- As all 8^3 voxels inside the grid-octree cell are the same value, the convolution kernel inside the cell needs to be evaluated only once.

- note: a pooling of 2x2 in convolution, is now 2^3 pooling thus (fig.5) it **_considers 8 shallow (top level) octrees_**. **_Voxels on the finest resolution are pooled._**

- unpooling: from one octree into 8 octrees...voxels double in size..

- orientation estimation performance is measured by mean angular error (fig.10)

- they did many experiments...with different tasks (e.g. orientation estimation, semantic segmentation) and different resolutions..

### My Questions

1. fig.4?