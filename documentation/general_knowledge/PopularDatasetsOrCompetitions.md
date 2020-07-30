3D object classification:
---

####Datasets:
  
  - [ModelNet40](https://modelnet.cs.princeton.edu/)
    - 12,311 CAD models from 40 man-made object categories
  - ModelNet10 (voxelized 3D shapes for object classification)

3D object part segmentation:
---

####Datasets:
  - [ShapeNet](https://shapenet.cs.stanford.edu/shrec17/)
    - 16,881 shapes from 16 categories, annotated with 50 parts in total
    - most object categories are labeled with two to five parts
    - ground truth annotations are labeled on sampled points on the shapes
    - represented as sparse point clouds with only about 3k points for each model
  - ShapeNetCore 
    - airplane, bag, cap, car, chair, earphone, guitar, knife, lamp, laptop, morotbike, mug, pistol, rocket, skateboard, table
  - ShapeNetCore55 (shapes of triangle meshes)
    - 51190 3D models with 55 categories and 204 subcategories-
    - consistent upright orientation



Semantic segmentation:
---

####Datasets
  - [Stanford 3D](http://graphics.stanford.edu/data/3Dscanrep/)
    - 3D scans from Matterport scanners in 6 areas including 271 rooms
    - Each point in the scan is annotated with one of the semantic labels from 13 categories (chair, table, floor, wall etc. plus clutter).
  
  - [Princeton Segmentation Benchmark](https://segeval.cs.princeton.edu/) (SIGGRAPH 2009)
  
  - RueMonge2014
  
  - [NYUv2](https://cs.nyu.edu/~silberman/datasets/nyu_depth_v2.html)


3D Object Retrieval
---

####Competitions
  - SHREC16


General
---

####Datasets
  - [ABC dataset](https://cs.nyu.edu/~zhongshi/publication/abc-dataset/)  (Koch et al. 2019)
    - 1M CAD models
    - ground truth for differential quantities, patch segmentation, geometric feature detection, and shape reconstruction
  
  - [PartNet](https://github.com/kevin-kaixu/partnet-symh) (Mo et al. 2019)


Other Databases
---

- [Trimple Warehouse](https://3dwarehouse.sketchup.com/)
