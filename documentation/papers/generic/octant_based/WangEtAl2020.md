[Unsupervised 3D Learning for Shape Analysis via Multiresolution Instance Discrimination](https://arxiv.org/pdf/2008.01068.pdf)

### Goal
unsupervised method for learning a generic and efficient shape encoding network for different shape analysis tasks

### method
jointly encode and learn shape and point features from unlabeled 3D point clouds

They adapt the HRNet to octree-based CNN (fused multiresolution subnetworks)

They designed a Multiresolution Instance Discrimination loss for jointly learning the shape and point features.

input: 3D point cloud
output: shape and point features

After training, the network can be concatenated with simple task-specific back-end layers and fine-tuned for different shape analysis tasks.

### result
good for shape classification, semantic shape segmentation, shape registration tasks.

My questions
---
1. when we say in fig2 "to be discriminative and transformation-invariant under the supervision of the MID loss on both shape instance and point levels" what do we mean about point level ? that we want the color information to be correct? or if we have class per point to have correct class? what else can it be?
2. fig4 right?
3. what is "shape registration task"?
