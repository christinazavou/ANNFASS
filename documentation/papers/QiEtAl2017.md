PointNet: Deep Learning on Point Sets for 3D Classification and Segmentation
---
(https://arxiv.org/pdf/1612.00593.pdf)


### From Abstract, Conclusion and Images

##### Problem addressed
point cloud has irregular format so most researchers transform data to regular format (3d voxel grids or multi view images) but these formats give data that are unecessarily big (like non sparse data)

##### Goal & result
PointNet: a neural network that has as input a point cloud and can handle object classification, part segmentation, scene semantic parsing.
This network beats state of the art and is robust with respect to input perturbation and corruption.


##### How
As far as i understand from figure 2 we have n points in our input and the global feature (equal to the encoding of classification net) will always be of size 1024. 
Then for classification we use this 1024 vector and an MLP to find output scores for the k classification classes.
For segmentation we use this 1024 vector together with a previous embedded representation of nx64 and then MLP to output scores for the m segmentation classes for each of the n points.


##### interesting:
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


##### My questions
1. what does he mean in abstract "which well respects the permutation invariance of points in the input" ?
2. in table 1 what does he mean "#Views" ? what is "modelNet40" ? i guess some dataset for classification..
3. what is "furthest sampling" mentioned in fig.6?
4. how is retrieval done ?
5. how are correspondence pairs found in fig.13?
6. as far as i understand from fig. 21 and 22 the CAD models and the kinect scans can be 'translated' in point clouds!? (and then we give them as inputs and then we get segmentation as output)

