O-CNN: Octree-based Convolutional Neural Networks for 3D Shape
Analysis
---
(https://wang-ps.github.io/O-CNN_files/CNN3D.pdf)

### From Abstract, Conclusion and Images

##### Method

input:
the average normal vectors of a 3D model sampled in the finest leaf octants
performs:
3D CNN operations on the octants

A novel octree data structure to efficiently store the octant information and CNN features into the graphics memory and execute the entire O-CNN training and evaluation on the GPU.

Supports various CNN structures
Works for 3D shapes in different representations
By restraining the computations on the octants occupied by 3D surfaces, the memory and computational costs of the O-CNN grow quadratically (^2) as the depth of the octree increases ==> 3D CNN feasible for high resolution 3D models

they experiment it on: object classification, shape retrieval, shape segmentation


#### Results
much more efficient+successful than full-voxel approaches

##### Notes:
- to do 2D convolution...we access only the union of the neighbours ..since convolved grids (octrees) have many commons

- they didnt use different levels of octrees...i.e. dense and sparse areas had same octree level

### My Questions

1. i dont understand fig2c.
