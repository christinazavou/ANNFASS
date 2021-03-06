[Adaptive O-CNN: A Patch-based Deep Representation of 3D Shapes](https://wang-ps.github.io/AO-CNN_files/AOCNN.pdf)
---

#### input
planar patch normal and displacement

#### process
encoder: ```3D convolutions only at the octants at each level```

decoder: 
```
1. infers the shape occupancy and subdivision status of octants at each level 
2. estimates the best plane normal and displacement for each leaf octant
```

#### result
- gains extra efficiency in memory and computation compared to OCNN
- examined on 3D classification, 3D autoencoding, shape prediction, shape completion

#### Introduction: Approaches to shape analysis/generation:
1. (dense) full voxel representation:

    ```pros: it is a natural extension of 2D representation and can use existing frameworks i.e. Convolutional Neural Networks.```
    
    ```cons: high memory and costly computation thus not easy to use with high-resolution input/output```

2. multi-view images:

    ```the generated multi-view images can be fused to construct a complete shape```
    
    ```challenges: 1. proper view selection, enforcing consistency of different views and 2. shape occlusion```
    
3. point representation and use of PointNet or variants

    ```challenges: 1. the output quality is limited by the number of points, 2. extracting high quality surfaces from the point cloud requires additional processing```

4. polygonal mesh representation: surface patches or meshes can be predicted directly by a neural network

5. octree representation (sparse-voxel representation): integrated with convolutional neural networks (OCNN)

    ```pros: memory and computationally efficient to generate high-resolution shapes```
    
    method:
    
    an OCNN usually predicts the occupancy probability of an octant: _occupied, free and boundary_ and splits the octant with label _boundary_. 
    
    The prediction and splitting procedures are recursively performed until the predefined max depth of the octree is reached.
    
    At the finest level the non-empty leaf octants represent the predicted surface.
    
    **"In existing work, the non-empty leaf octants at the finest level can be regarded as uniform samples of the shape in the x, y, and z directions. We observe that it is actually not necessary to store the shape information in this uniform way since the local shape inside some octants can be represented by simple patches, like planar patches. Therefore, by storing the patch information and terminating the octant split early if the patch associated with the octant well approximates the local shape, the generated octree can have a more compact and adaptive representation. Furthermore, the stored patch has a higher order approximation accuracy than using the center or one of the corners of the octant as the sample of the surface."**

#### Introduction: how is AOCNN:

"is based on a novel patch-guided adaptive octree shape representation which adaptively splits the octant according to the approximation error of the estimated simple patch to the local shape contained by the octant."

The decoder 
- predicts the occupancy probability of octants: _empty,surface-well-approximated, and surfacepoorly-approximated_; 
- infers the local patch at each non-empty octant at each level, 
- and split octants whose label is surface-poorlyapproximated. 

#### Idea of adapted octrees:
Frisken et al. [2000] proposed the octree-based adaptive distance field (ADF) to maintain high sampling rates in regions where the distance field contains fine detail and low sampling rates where the field varies smoothly.

#### PATCH-GUIDED ADAPTIVE OCTREE
1. For a given surface S, we start with its bounding box and perform 1-to-8 subdivision. (For octant O, denote S_o as the local surface of S restricted by the cubical region of O.)
2.  If S_o != ∅, we approximate a simple surface patch (we use a planar patch) to S_o. (We denote the best plane P with the least approximation error to S_o as P_o)
3. The shape approximation quality of the local patch, δ-o, is defined by the Hausdorff distance between P_o and S_o.
4. The revised partitioning rule of the octree is: For any octant O which is not at the max depth level, subdivide it if S_o != ∅ and δ_o is larger than the predefined threshold ˆδ.

 _The patches at all the non-empty leaf octants provide a good approximation to the input 3D shape — the Hausdorff distance between them and the input is bounded by ˆδ._

#### A-O-CNN: architecture

##### A-O-CNN: encoder

There are two major differences between Adaptive O-CNN
and O-CNN: 
1. the input signal appears at all the octants, not only at the finest octants;
2. the computation starts from leaf octants at different levels simultaneously and the computed features are assembled across different levels.

note: input signal is 4 dimensional.

##### A-O-CNN: decoder

At each octree level, we train a neural network to predict the patch approximation status for each octant — empty, surface-well-approximated, and surface-poorly-approximated — and regress the local patch parameters.

 Octants with label surface-poorly-approximated will be subdivided and their features in them are passed to their children via a deconvolution operation.

###### prediction module: 
```
“FC + BN + ReLU + FC”
The output of the prediction module includes the patch approximation status and the plane patch parameters (n,d⋆).
```

###### loss function:
```
includes the structure loss and the patch loss
```
  - The structure loss L_struct: 

    measures the difference between the predicted octree structure and its ground-truth. 
    
    Since the determination of octant status is a 3-class classification, we use the cross entropy loss to define the structure loss.
    
    The structure loss is formed by the weighted sum of cross entropies across all the levels:

  - The patch loss L_patch:
   
   measures the squared distance error between the plane parameters and the ground truth at all the leaf octants in each level

#### Experiments

##### Shape classification
on ModelNet40 augmented by 12 rotations
when resolution is more than 32^3 the AOCNN tends to overfit...so we should augment more..

##### 3D Autoencoding
on ShapeNet Core v2
max-depth 7 i.e. resolution 128^3

We evaluate the quality of the decoded shape via measuring the Chamfer distance between it and its ground-truth shape. The chamfer distance is defined for points .. thus we sample a set of dense points uniformly from the estimated planar patches.

example application: shape completion

##### Shape reconstruction from a single image

Notes
---
- from table 1 we see that OCNN classification is using less than 1GB memory for representation of 32^3 (depth 5) with batch size 32 thus my machine is indeed able to run it.
- other baselines for shape reconstruction: PSG and AtlasNet
- from fig9 we see that AOCNN generates patches that are orientation-persistent:)
- in the OCNN: When the stride of the CNN operation is 1, the signal is processed with unchanged resolution and it remains in the current octree level. When the stride of the CNN operation is larger than 1, the signal is condensed and flows along the octree from the bottom to the top.

My questions
---
1. ~~what is "planar patch normal"?~~patches of rectangular (planes) shapes ... to cover up a shape! (you can see the octree2mesh generating a mesh that is basically rectangular shapes of different sizes covering up the object's shape)
2. ~~as i understand from fig.3 the difference of OCNN and AOCNN is that we dont just go until max depth wherever our object(occupancy map) is , but we decide on each point/segment of the object(occupancy map) whether to go deeper or not. On what condition is the decision made ? Also, i dont see any difference between middle and right picture.~~ Indeed, as explained in introduction, in OCNN we just split until max depth, but in AOCNN every octant stores a patch and if the shape is represented well by the patch (if the patch associated with the octant approximates the local shape) we dont need to go deeper.
3. from fig4 i see the encoder having skip_connections ... are these the ones referred in the code (where there is flag to use skip_connections or not) !? Actually .. are these skip connections or not ? do we have conv of octants at depth 4 passed to depth 5 via pooling and also convolutions of octants at depth 5 passed to depth 5 ?
4. ~~in fig5 what is Lstruct and Lpatch ? what is the corresponding code?~~ answered in [loss function section](loss function)
5. in abstract what does it mean "takes the planar patch **normal and displacement**" ?
6. what is the 4-dim input signal?