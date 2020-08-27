Input data processing
---

### Preprocessing, Augmentation
 
0. The input to our pre-training network is the point cloud of a shape.

1. assign a normal vector for each point via principal component analysis if the accurate normal information is not available.

2. to generate shape and point instances for our unsupervised instance discrimination pretext task:
    2.1 normalize each point cloud into a unit sphere
    2.2 generate shape instances with a transformation
composed by random rotations, random translations within [-0.25, 0.25], and random scaling along each coordinate axis with the ratio within [0.75,1.25].

### Multiresolution instance class creation
1. label the transformed instances of the same shape with its index in the input dataset.
2. label each point on the generated instance by the same index of the corresponding point in the input shape in the dataset

==> N shape-instance classes and Mi point-instance classes for each shape-instance class.

_**Note that these labels serve as self-supervised signals since they are acquired without any human labeling.**_

3. to reduce the huge memory consumption, we over-segment each shape Xi in the dataset into Ki patches (Ki<<Mi), thus for each shape-instance class we can have Ki patch-instance classes.

    3.1 for simplicity, we use K-means to compute over-segmented patches and choose K=100 for all shapes.

**Check fig.3 to understand.**
