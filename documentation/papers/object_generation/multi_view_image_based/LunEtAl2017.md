3D Shape Reconstruction from Sketches via Multi-view Convolutional Networks
---

### Goal
reconstruct 3D shape from 2D sketches (line drawings)
input: 1 or more sketches
output: point cloud 
--> then convert into mesh

### Method
Encoder-Decoder neural network.
The decoder converts the latent representation into **depth and normal maps** capturing the underlying surface from several output viewpoints.
The multi-view maps are then consolidated into a 3D point cloud by solving an optimization problem that fuses depth and normals across all viewpoints.

### Results
Preserves well the topology and shape structure.

#### Notes

- evaluation done with:
    - hausdorff distance
    - chamfer distance
    - normal distance
    - depth map error
    - volumetric distance

My Questions
---
1. ~~is the decoder outputting one output for each view or one output for all ?~~ from fig.1 we see that the encoder has 12 outputs, one for each output view.