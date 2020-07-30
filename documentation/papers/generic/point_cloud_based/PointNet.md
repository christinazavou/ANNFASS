PointNet: Deep Learning on Point Sets for 3D Classification and Segmentation
---
(https://arxiv.org/pdf/1612.00593.pdf)


#### Problem addressed
point cloud has irregular format so most researchers transform data to regular format (3d voxel grids or multi view images) but these formats give data that are unecessarily big (like non sparse data)

#### Goal & result
PointNet: a neural network that has as input a point cloud and can handle object classification, part segmentation, scene semantic parsing.
This network beats state of the art and is robust with respect to input perturbation and corruption.


#### How
As far as i understand from figure 2 we have n points in our input and the global feature (equal to the encoding of classification net) will always be of size 1024. 
Then for classification we use this 1024 vector and an MLP to find output scores for the k classification classes.
For segmentation we use this 1024 vector together with a previous embedded representation of nx64 and then MLP to output scores for the m segmentation classes for each of the n points.


#### interesting:
- fig.6
- fig.23: 
    most common failure cases: 
        1. the points on the boundary are wrongly labeled (most segmentation algorithms suffer from this error)
        2. errors on exotic shapes (rare shapes in the dataset)
        3. small parts can be overwritten by nearby large parts
        4. error caused by the inherent ambiguity of shape parts
        5. error introduced by the incompleteness of the partial scans
        6. failure cases when some object categories have too less training data to cover
enough variety


#### Result
PointNet is much faster in speed than its alternatives & it exceeds their performance

#### Related Work
Point Cloud Features: 
    - hand crafted towards specific task 
    - usually they are statistical properties of points (invariant to certain transformations)
    - e.g. point density, D2, shape contour

Deep Learning on 3D Data:
    - Volumetric CNNs (3D CNN on voxelized shapes)
        - -: volumetric==> constrainted by its resolution due to data sparsity
        - -: 3D convolution==>computationally costly
    - FPNN
    - Vote3D
    - Multiview CNNs
        - render point cloud or shape into 2D images & then apply 2D convolution
        - +: they achieve the best performance on shape classification and retrieval tasks
        - -: nontrivial to apply them on scene understanding or shape completion
     - Spectral CNNs
     - Feature-based DNNs
        - convert 3D data into vector using traditional shape features & then use MLP
        
Deep Learning on Unordered Sets:
    - **_a point cloud is an unordered set of vectors_** 


#### Problem Statement

###### input:

point cloud = set of points, P, where each point, Pi, is a vector of its (x,y,z) coordinate plus extra feature channels such as color, normal etc.

(for simplicity we use only (x,y,z))

To obtain our point cloud we might need to sample from a point cloud shape or segment it from a scene point cloud

###### output:

for classification:
    k scores (for each k candidate class)
for semantic segmentation:
    n x m scores (for each of the n points and each of the m semantic subcategories)


#### Deep Learning on Point Sets:

###### properties of point sets in R^n
    - unordered (so NN needs to be invariant to N!)
    - interaction among points - neighboring points form a meaningful subset. (NN needs to capture locality)
    - invariance under certain transformations (like rotation and translation) 
    
###### PointNet architecture

In order to be invariant to input permutation either:
    - sort input (not so easy in high dimensional space)
    - or treat the input as a sequence, augment training data to all possible permutations, and train a RNN (RNN performance is not so good when sequence size is of the order of thousands)
    - or use a simple symmetric function to aggregate the information from each point (e.g. if input are two vectors, + and * are symmetric functions)
They used a symmetric function. Precisely, **_max pooling_**. 

From max pooling layer we get a global representation of the input (shape global features).

**_Point segmentation requires both local and global knowledge._** So we concatenate global features with each point features. From this we can (use MLP and) find new point features. (e.g. they prove that from these new point features they can predict per point normals so information about a point's local neighbourhood is summarized in those features)

The NN needs to be invariant of certain geometric transformations. Therefore they predict an affine transformation by a mini network (**_T-net_**) and apply it to the coordinates of the input points. 

(to keep the layers after feature space also invariant of transformation they apply again T-net)


#### Experiments

- PointNets can be applied to multiple 3D recognition tasks
    - shape classification:
        - (train and) evaluation on ModelNet40 shape classification benchmark
        - split into 9,843 for training and 2,468 for testing
        - uniformly sample 1024 points on mesh faces according to mesh face area and normalize them into a unit sphere
        - _**during training we augment the point cloud on-the-fly by randomly roatating the object along the up-axis and jitter the position of each points by a Gaussian noise with zero mean and std 0.02**_
    - object part segmentation
        - we need to assign label to each point on the point cloud or to each face on the mesh
        - (train and) evaluation on ShapeNet part data set
        - formulate as per-point classification problem
        - use mIoU on points as evaluation metric
        - to also test (only inference) the method on incomplete data they generate incomplete point clouds from 6 viewpoints for each shape..
    - semantic segmentation in scenes:
        - (train and) evaluation on Stanford 3D semantic parsing data
        - for training data: split points per room & sample rooms into blocks 1m x 1m
        - each point is represented by: X,Y,Z,R,G,B and normalized location as to the room (from 0 to 1) i.e. N_x,N_y,N_z
        - at training time we randomly sample 4096 points in each block on the fly
        - at test time we test on all the points
    
- Architecture experiments: for the order-invariance:
    - as a symmetry operation they tried:
        - max pooling
        - average pooling
        - attention based weighted sum: a score is predicted frm each point feature and then it's normalized across points by computing a softmax

- Architecture experiments: using T-net
    - using input transformation gives performance boost
    - using input and feature transformation + regularization term in loss gives the best performance

- Architecture experiments: robustness
    - when 50% points are missing accuracy only drops by 2.4%

- Visualization of what the network learns
    - visualization of **_critical point sets C_s_**: THOSE CONTRIBUTED TO THE MAX POOLED FEATURE
        - shows that they summarize the skeleton of the shape
    - and **_upper bound shapes N_s_**: the largest possible point cloud that give the same global shape feature f(S) as the input point cloud S. (i.e. includes all points on the surface..but not inside points .. this is useful to compare if an object belongs to same shape..)

- Analysis of time (floating-point operations/sample) and space (number of parameters in the network) complexity


#### My questions
1. ~~what does he mean in abstract "which well respects the permutation invariance of points in the input" ?~~that PointNet is robust to small perturbation of input points as well as to corruption through point insertion (outliers) or deletion (missing data).
2. in table 1 what does he mean "#Views" ? what is "modelNet40" ? i guess some dataset for classification..
3. what is "furthest sampling" mentioned in fig.6?
4. ~~how is retrieval done (e.g. fig.12)?~~ usually they compare upper bound shapes...plus other information can be used..i don't know what they did here..
5. how are correspondence pairs found in fig.13?
6. as far as i understand from fig. 21 and 22 the CAD models and the kinect scans can be 'translated' in point clouds!? (and then we give them as inputs and then we get segmentation as output)
7. how are the 3 approaches for input invariance shown in fig.5? basically either by stacking mlp as rnn cells and starting from a random point traverse all or by sorting all points and applying one mlp (ALWAYS SAME INPUT POINT CLOUD SIZE?) or by applying an mlp on each point and then MLP on top we can successfully tackle the task and keep invariance on input ?!
8. in table 5 what is the transform? input (3x3) means a convolution of filter size 3x3 on the input ? what is feature (64x64) and what is both?
9. in fig.7 what is upper bound? is because output is not a probability with max 1? and critical point is lowest value we can use as 'output probability' for a class? then...what does he mean "any point cloud between critical points set and the upper bound shape gives exactly the same feature"? means you can't use it to distinguish a class ? then it shouldnt lie between..
10. how is shape correspondence done in fig.13?
11. how is normal reconstruction in fig.16?
12. what are DNNs mentioned in Related Work? is graph networks dynamic networks?
13. ~~for the object part segmentation...the ShapeNet has ground truth annotations on sampled points on the shapes...so..how is evaluation done? using distance from labeled points?~~ using mIoU on points. ~~however when does a groundtruth point and a prediction belong in intersection? do we use some distance?~~ no distance needed...each point considered has a label and a prediction


from: https://medium.com/@luis_gonzales/an-in-depth-look-at-pointnet-111d7efdaa1a
---

### Transformation Invariance:
motivated by Spatial Transformer Networks (STNs), T-net applied on input and later on features seek to provide pose normalization for a given input.

pose normalization reduces the need of data augmentation (and the network afterwards doesnt have to learn to identify the object in any e.g. size, rotation etc)

*The global feature vector is unchanged for points between the critical point set and the upper-bound shape, resulting in considerable robustness.

