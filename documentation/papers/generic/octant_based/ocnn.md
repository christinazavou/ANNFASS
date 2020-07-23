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

##### Idea
perform 3D CNN operations only on the sparse octants occupied by the boundaary surfaces of 3D shapes!! 

so do convolution on sample points of leaf octrees (fine representation), pool and return result to higher nodes, do convolution on higher nodes etc... 

##### Technical challenge
parallelization of O-CNN computations defined on the sparse octants..

##### How
they design novel octree structure that stores octant info on GPU 
**_they pack the data of sparse octants at each depth as continuous arrays_**
**_a label buffer is introduced to find the correspondence between the features at different levels ..._** 

##### How - convolution 
to efficiently do 3D convolutions with any kernel size:
    - build _**hash table to quickly get the local neighborhood**_ volume of eight sibling octants
    - compute 3D _**convolutions of these eight octants in parallel**_!

#### Results
- much more efficient+successful than full-voxel approaches
- experiments run on object classification, shape retrieval and shape segmentation

##### Notes:
- they didnt use different levels of octrees...i.e. dense and sparse areas had same octree level

- from fig1: initial convolution (first layer) is applied on the deepest depth of the octree .. while later convolutions are applied to more shallow depths of the octree! (look also at fig2d!)

- basically .. if we add one level of depth in the octree we just add one array and one 3D convolution !

- from fig5 we see that max pooling is just max number of the 8 numbers in an octant i.e. 8 contiguous numbers in the array!

### My Questions

1. so..from fig2..if within a space there are many empty voxels then we have in some deep layers really sparse and big vectors.. correct ? so is using sparse matrices (tensorflow/numpy etc) really useful or is this anyway an issue?

2. as i understand from the "how" section .. _**we have efficient convolution as each level can be convoluted at once and efficient pooling as there is directly pointing to correspondence in other levels!? :)**_

3. in fig4...is it an example for when the 2D convolution kernel is less or equal to 3 !? i.e. if kernel was 5x5 we take more octants but still union them!?

4. assigning T and L in fig5 ..?

5. in table1 where we see 32^3 resolution of voxels, does it mean 2^5=32..so 5 depth octree needed, so 5 O-CNN layers?!

