[Unsupervised 3D Learning for Shape Analysis via Multiresolution Instance Discrimination](https://arxiv.org/pdf/2008.01068.pdf)

_"we adapt HR-Net to octree-based convolutional neural networks for jointly encoding shape and point features with fused multiresolution subnetworks and design a simple-yet-efficient Multiresolution Instance Discrimination (MID) loss for jointly learning the shape and point features."_

### Goal
unsupervised method for learning a generic and efficient shape encoding network for different shape analysis tasks

### method
jointly encode and learn shape and point features from unlabeled 3D point clouds

They adapt the HRNet to octree-based CNN (fused multiresolution subnetworks)

They designed a Multiresolution Instance Discrimination loss for jointly learning the shape and point features.

**input**: 3D point cloud<br>
**output**: shape and point features

_After training, the network can be concatenated with simple task-specific back-end layers and fine-tuned for different shape analysis tasks._

### result
good for shape classification, semantic shape segmentation, shape registration tasks.


####Method:MID loss
  - shape instance discrimination loss classifies augmented copies of each shape instance of a 3D dataset in one class, 
  - point instance discrimination loss classifies the same points on the augmented copies of a shape instance in a class
  
  We first exploit the shape instance discrimination loss to classify the point of each shape into a class and then apply the point instance discrimination to classify the points on each shape separately (otherwise we would have too many useless comparisons). We exploit the geometric similarity of nearby points and cluster local points on a shape as one class.

####Method:backbone shape encoding network

  Trained on ShapeNetCore55
  
####Method:pretext task for unsupervised learning
Inspired by the idea of instance discrimination which operates on a single image-level, we design a pretext task to discriminate multiresolution instances of shapes for learning representative shape features and develop effective training schemes to reduce the computational and memory cost caused by the large number of instances.

####Related work: Handcrafted 3D shape descriptors

- transformation invariant features of 3D shapes:
    - global shape descriptors
        - shape size
        - shape distribution
        - shape histogram
    - local shape descriptors
        - mean curvature
        - spin images
        - heat kernel signatures

can be used for simple tasks like key-point matching
        
####Related work: Supervised 3D feature learning for shape analysis
- utilizing labels like
    - shape category labels in ModelNet
    - segmented patch labels in ShapeNet
    
can be used for hard tasks like classification and segmentation

####Related work: Unsupervised 3D feature learning for shape analysis
- Shape-level feature learning:
    - 3D-GANs (Wu et al 2016)
    - L-GANs (autoencoder and GAN) (Achlioptas et al 2018)
    - FoldingNets (Yang et al 2018) & AtlasNets (Groueix et al 2018) optimize an autoencoder by reconstructing shapes from deformed point clouds
    
- Patch-level feature learning

- Point-level feature learning
    - PPF-FoldNets(Dang et al 2018)

todo: read and move to general knowledge

####Method:Details
[Input Data processing](InputDataProcessing.md) <br>
[Network Design](NetworkDesign.md)<br>
[Multi Resolution Instance Discrimination](MultiResolutionInstanceDiscrimination.md) <br>
[Network Training](NetworkTraining.md)


####MID-NETS for shape analysis
[Back End Design and Training](BackEndDesignAndTraining.md) <br>
[Shape Classification](ShapeClassification.md) <br>
[Fine-Grained PartNet Segmentation](FineGrainedPartNetSegmentation.md) <br>
[Shape Registration](ShapeRegistration.md)

#### Summarized results
1. The MID-Net model outperforms most state-of-the-art unsupervised methods in both classification and segmentation tasks, especially when the amounts of labeled training data in the downstream tasks are small.
2. With simple back-end and fine-tuning, our pre-trained MIDNet model can surpass all the state-of-the-art supervised methods that are designed and optimized for specific downstream tasks, especially in the challenging PartNet segmentation benchmark. Furthermore, the fine-tuning pre-trained MID-Net always achieves better performance than the MID net trained with random initialization.
3. Our pre-trained MID-Net model is robust for 3D point clouds whose density is different to the pre-training data (e.g. point clouds in ShapeNet-Part segmentation test), and the ones that are out of shape collections used in pre-training (e.g. three categories in the PartNet segmentation test).

As the amount of the labeled data in the downstream tasks decreases, a pre-trained model learned from large unlabeled shape collections via a well-designed pretext task could resolve the gap between the generic pretext task and the downstream task and outperform supervised approaches.

### Method Validation

1. Contributions of HR-Net and MID in Table 7


Notes
---
- "Our key observation is that a 3D shape is composed of its local parts and thus the feature for shape and points are coherent and should be encoded and trained jointly. So we adapt HRNet to octree-based net for extracting and fusing features from both points and shapes via parallel multiresolution subnetworks and connections across subnetworks."
- for unsupervised pre-training a key idea is to design some pretext (surrogate) tasks that use supervision signals from the data itself. e.g. in NLP use ```mask context prediction``` or ```next sentence prediction```. In Computer Vision some pretext tasks are ```colorization```, ```context prediction```, ```motion segmentation```, ```image instance discrimination```, ```contrustive losses```.
- "Our pre-trained MID-Net model is robust for 3D point clouds whose density is different to the pre-training data (e.g. point clouds in ShapeNet-Part segmentation test), and the ones that are out of shape collections used in pre-training (e.g. three categories in the PartNet segmentation test)."
- "it is non-trivial for an unsupervised pre-trained model to achieve superior performance than supervised methods designed and optimized for specific downstream tasks due to the gap between the generic pretext task and the downstream tasks. For 3D shape analysis, our finding here is that as the amount of the labeled data in the downstream tasks decreases, a pre-trained model learned from large unlabeled shape collections via a well-designed pretext task could resolve this gap and outperform supervised approaches."
- **PointNet++ has as well instance level and point level features thus it was easy to apply MID loss on that for comparisons!**
- Ablation study of table 8 is useful.

My questions
---
1. ~~when we say in fig2 "to be discriminative and transformation-invariant under the supervision of the MID loss on both shape instance and point levels" what do we mean about point level ? that we want the color information to be correct? or if we have class per point to have correct class? what else can it be?~~ answered on [Method:MID loss](#Method:MID loss).
2. ~~fig4 right?~~ the point-features from many objects coming from 6 categories.
3. ~~what is "shape registration task"?~~ The process of point cloud registration is to align a point cloud with its transformed version.
4. how are the tasks specified in notes pretext ??
5. ~~is called multi-resolution because of shape info and point info or also because we scale each shape in many other scaled examples?~~ because of HRNet
6. in code how is the output for shape-instance and patch-instance ? is it a vector with probabilities of each shape and a matrix of 100 probabilities of each patch ?
7. ~~what does it mean "different classifiers but same encoder"?~~ i guess if one shape has 10 patches and another shape has 20 patches then you need two different classifiers for the point classification of each shape!
8. ~~algorithm 1~~
9. in table 8 it shows the training using fusion and MID loss (two loss function) vs no fusion (unet) and no MID (single loss function) ... in the code do we have that ?
10. As i understand you can use the MID-net and basically use shape-features (or both features concatenated) for shape classification and point-features (or both features concatenated) for part segmentation..correct?! e.g. in MID-FC(NoPre) for classification what do they use ? both features concatenated ?! 
11. do they have publish implementation of PointNet++ with MID scheme? is it HRNet + PointNet + FC ?

