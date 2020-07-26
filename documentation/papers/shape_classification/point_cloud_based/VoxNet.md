VoxNet: A 3D Convolutional Neural Network for Real-Time Object Recognition
---
(https://www.ri.cmu.edu/pub_files/2015/9/voxnet_maturana_scherer_iros15.pdf)

##### Goal
new architecture for object recognition

(because volumetric representations can easily become computationally intractable it's not obvius how to extend image classification into object classification)

##### How
integrating a volumetric Occupancy Grid representation with a supervised 3D Convolutional Neural Network 

network input: 3D point cloud (from LiDAR, RGBD or CAD model)

##### Results
evaluate VoxNet on publically available benchmarks using LiDAR, RGBD and CAD data

achieves accracy beyond state of the art

examples of datasets used:
- Sydney Urban Objects (lidar image)
- NYUv2 (rgbdr image)
- ModelNet40 (voxelized 3d shape)

##### Detailed approach

two main components: 
1. a volumetric probabilistic occupancy grid 
    - allows to efficiently estimate free, occupied and unknown space from varius time or  viewpoint measurements
    - note: a point cloud just distinguishes occupied versus free space
    - can be stored with simple and efficient data structures
2. a 3D CNN that predicts a class label directly from the occupancy grid.

Each _**point (x,y,z)**_ is mapped into _**voxel coordinates (i,j,k)**_. This depends on origin, orientation and resolution of the voxel grid in the 3D space. 

##### Architecture: Occupancy models (Input Layer)
basically think of beam sensor that calculates the hits and pass throughs for each voxel in our interest.

1. binary occupancy grid
    - update each voxel tranveresed by the beam as **l_{i,j,k}^t** = l_{i,j,k}^{t-1} + z^t l_{occ} + (1-z^t) l_{free} where l_{occ} and l_{free} are the log odds of the cell being occupied or free given that the measurement hit or missed the cell respectively. We set lfree = -1.38 and locc = 1.38. Initial probability of occupancy is set 0.5 thus odds of occupancy is 1/1 thus lijk^0=log(1)=0

2. density occupancy grid
    - each voxel is assumed to have a continuous density (i.e. probability the voxel blocks the sensor beam). We use a uniform prior α_{ijk}^0 = β_{ijk}^0 = 1. and update:  α_{ijk}^t = α_{ijk}^{t-1} + z^t and β_{ijk}^t= β_{ijk}^{t-1} + (1-z^t) and posterior mean is μ_{ijk}^t =  α_{ijk}^t / (α_{ijk}^t + β_{ijk}^t).  **μ_{ijk}^t is the continuous density that is given as input to the network** 

3. hit occupancy grid
    - only considers hits. Ignores difference between unknown and free space. initial value h_{ijk}^0 = 0. update h_{ijk}^t = min(h_{ijk}^{t-1} + z^t, 1)
    
##### Architecture: 

Input Layer
    - fixed size grid of IxJxK voxels
    - I=J=K=32
    
Convolutional Layers
    - C(f,d,s)
    - the input is 4dim (3 dimensions for the spatial dimensions and one dimension for the features)
    - Relu activation

Pooling layers
    - downsample each mxmxm block of voxels with their maximum
    
Fully Connected Layer
    - Relu activation
    - Softmax at the end

##### Base model: VoxNet:
    - C(32, 5, 2)−C(32, 3, 1)−P(2)−F C(128)−F C(K)
    - 921736 parameters
    
##### Rotation Augmentation and Voting
because our point clouds have no built-in invariance to large rotations:
we augment the dataset by creating n copies of each input instance (a rotation of 360/n degrees around z axis)
we take as final class the majority vote out of n instances

##### Multiresolution Input
multiresolution voxnet:
    - two networks with an identical VoxNet architectures, each receiving occupancy grids at different resolutions: (0.1 m)3 and (0.2 m)3
    - concatenate the outputs of their respective F C(128) layers and connect them to a softmax output layer

### Notes
- in fig.5 we see activations of neurons in a layer for each rotated input ... it shows rotational invariance since activations are the same ;) ! At 90 degrees though the toilet is confused with a chair ... **_so by voting across all orientations we obtain the correct answer ;) !_**

- their volumetric representation (occupancy grid) is richer than point clouds as it distinguishes free space from unknown space

- RGBD data means Red,Green,Blue,Depth

- there are approaches that use depth info as just an extra channel .. but this means that the geometric information is not fully described 

-  Experiments show that a model simpler than the ones used in image deep learning is good enough. Volumetric classification for point clouds is in some sense a simpler task, as many of the factors of variation in image data (perspective, illumination, viewpoint effects) are diminished or not present.

- in fig.3. if you notice the first filter catches edges (lines), the middle filter catches blobs and the bottom filter catches corners!

### My Questions
1. ~~what is 'cross sections' in fig.1 ?~~ This is also infig.3. Basically, in 2D convolution we have filters of shape WxH. In 3D convolution we have filters of shape WxHxD. The cross section is basically visualization of the filter in each dimension..(cut voxel in some dim)

