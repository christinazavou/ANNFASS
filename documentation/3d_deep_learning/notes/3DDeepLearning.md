3D representation approaches:
  - Rasterized approaches (i.e. regular grids) (Note: currently NNs can work on these representations)
 
    - multi-view images
    - depth map
    - volumetric
    
  - Geometric approaches (i.e. irregular grids)
    - polygonal mesh
    - point cloud
    - primitive-based CAD models

![](../../figures/3d1.png)
![](../../figures/3d2.png)

[What is deconvolution?](https://gregbenzphotography.com/photography-tips/what-is-deconvolution-sharpening-and-how-to-get-increased-detail)
it is like interpolation..

![](../../figures/3d3.png)
![](../../figures/3d4.png)
Question: is there any code example/tutorial to obtain these examples?

#### Common distance metrics (to measure loss of the network):

1. Hausdorff distance (HD): A single farthest pair determines the distance. note: this is not robust to outliers

2. Chamfer distance (CD): Average all the nearest neighbor distance by nearest neighbors

3. [Earth Mover’s distance (EMD)](https://towardsdatascience.com/earth-movers-distance-68fff0363ef2): Solves the optimal transportation (bipartite matching) problem!

A fundamental issue: there is always uncertainty in prediction, due to:
- limited network ability
- Insufficient training data
- inherent ambiguity of groundtruth for 2D-3D dimension lifting

By loss minimization, the network tends to predict a “mean shape” that averages out uncertainty in geometry
![](../../figures/3d5.png)
