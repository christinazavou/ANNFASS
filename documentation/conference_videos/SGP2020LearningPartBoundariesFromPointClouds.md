
### Goal
DL approach for detecting boundaries in point clouds

### Proposed method
a method called Probabilistic Boundary Dynamic Graph CNN (PB-DGCNN) outputs a label for each point, indicating whether it lies on a boundary that separates two object's parts.

### Motivation
improve semantic segmentation (which usually doesnt have any prior knowledge on the boundaries and it suffers on such points)

### Previous work
1. Yu et al. EC-Net 2018 : learns edge detection in point clouds
2. DGCNN: Wang et al.

### Challenges
1. Boundaries are highly localized (sparse) and structured
2. A part boundary detector on point cloud must be robust to noise and to the sampling artifacts (e.g. non uniform sample)

### Approach
- graph neural network for graph edge convolutions within the point cloud
- loss function robust to class imbalance (boundary vs non boundary points)

##### EdgeConv Layer (main layer in DGCNN)
we have a point neighborhood -with (x,y,z) points- and we represent it with a k-nn graph (using euclidean distances).

in each local neighborhood we generate edge features capturing info for starting point and for ending point relative to .. (start point or global point!?)
e.g. e_{i,j} = [p_i, p_j-p_i]

the edge features are transformed through MLP and aggregated throught max pooling

the resulting transformation can learn some rotational invariance if training samples enough global shape rotations and local part rotations .. this is wasteful .. since the variance of all such rotations is huge .. so we decrease the variance by:
    
    edge features are normalized according to central point...

##### Architecture

1. Local EdgeConv Layer 
2. EdgeConv Layer
3. EdgeConv Layer
4. FC Layer

### My questions
- how is the graph network realised? 
- how is the graph cuts formulated?
- is edge feature relative to start point or global point?
- "if training samples enough global shape rotations and local part rotations" means if we take multiple point clouds for the same 3D shape and multiple point neighborhoods?
