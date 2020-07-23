A Point Set Generation Network for
3D Object Reconstruction from a Single Image
---
https://arxiv.org/pdf/1612.00603.pdf


### From Abstract, Discussion and Images

##### General task addressed:
generation of 3D data by NNs

##### Problem of the general task:
current approaches can output volumetric grids or multi-view images.
such representations are not as good as 3D shapes which are invariant under geometric transformations

##### Specific task addressed:
create a NN that given an image as input, outputs a point cloud

##### Problem of the specific task:
groundtruth shape for an input image may be ambiguous!!!!

##### Their overall solution: 
a conditional shape sampler, capable of predicting multiple plausible 3D point clouds from an input image!!

it outperforms state-of-the-art methods on 3d reconstruction methods

it performs well on 3d shape completion

##### My questions:
1. in fig.2 and fig.4 what is r.v.?
2. what is the input (green,blue) in fig.3 ?
3. ~~what is Mo2?~~


##### terminology:
MoN = min of N distances ==> Mo2 is min of 2 


