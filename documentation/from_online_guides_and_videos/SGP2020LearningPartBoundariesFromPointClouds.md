
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

##### Training with ABC dataset (boundary labels provided)
1. from 3D mesh --> extract point cloud using poisson disc sampling
2. then extract more samples specifically on boundary location (to make sure we have boundaries in our input)
3. then remove any initial samples on the boundary location (with distance equal to same poisson)
4. we add gaussian noise to the final point cloud

##### Training with PartNet dataset (boundary labels not provided; semantic parts provided)
1. sample the surface
2. approximate as boundary points the ones that have in their neighborhood points with different part label

##### Loss
weighted cross entropy
    
    setting the weight to the ratio of boundary points over non boundary points!! 9so each input has different weight)

##### Evaluation (Cole et al. 2008)
Precision & Recall & F1score : 
    
    TP for precision: predicted boundary points that are near real boundary points up to a distance ε
    TP for recall: annotated(real) boundary points that are near predicted boundary points
    FP for precision: predicted boundary points that are far from real boundary points more than a distance ε
    FN for recall: real boundary points that are far from predicted boundary points
    
Boundary Intersection over Union (bIoU) (Liu et al. 2020):
    
    measures overlap between annotated boundaries and predicted ones
    (TP_precision + TP_recall) / (|boundaries_gt| + |boundaries_pred|)

(note: similarly in semantic shape segmentation we use shape IoU metric)

Chamfer Distance

    euclidean distance from annotated boundary samples to nearest boundary predicted points and vice versa
    CD = CD(pred=>gt) + CD(gt=>pred)

### My questions
- how is the graph network realised? 
- how is the graph cuts formulated?
- is edge feature relative to start point or global point?
- "if training samples enough global shape rotations and local part rotations" means if we take multiple point clouds for the same 3D shape and multiple point neighborhoods?
- what is poisson disc sampling?
