Network Design
---

_We adopt HRNet which maintains parallel multiresolution subnetworks and simultaneously outputs multi-resolution features (thus can simultaneously output low-resolution shape-level features and high-resolution point-wise features)._

We can easily apply loss functions for outputs in different resolutions and each loss function will contribute to the training of all subnetworks.

We built HRNet upon an octree-based CNN framework.

A 3D point cloud is first converted to an octree representation, by default, in 64^3 resolution.

#### In the last stage,

1. the network _outputs the low-resolution shape-level feature_ by **concatenating** 
    - the feature of the low-resolution network and 
    - the feature downsampled from the output of the high-resolution networks

2. _for point-wise features_, we **interpolate** 
    - the high-resolution features defined at the second finest-level octants according to the point position via tri-linear interpolation. 
    
    Note that the high-resolution features at each octant are also the concatenation of features obtained from the high-resolution network and the upsampled feature from the low-resolution subnetwork.

#### Note

- The Downsample operation is implemented by max-poolin
- The Upsample operation is simply tri-linear up-sampling


My Questions
---
1. how is shape instance loss implemented?
2. ~~i dont understand the difference of outputs in the last stage .. maybe it's visible in the code ?!~~ actually you can see in fig2 the difference is that we also use the green feature map! and that we keep a high resolution!
3. by interpolation of second-finest-level octants does it mean at depth max_depth-1 and does it mean that it uses a few neighbours (just the children of depth max_depth-1) to use this and afterwards upsample and decide on each point of max_depth ?!
