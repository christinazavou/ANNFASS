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


####Method:MID loss
  - shape instance discrimination loss classifies augmented copies of each shape instance of a 3D dataset in one class, 
  - point instance discrimination loss classifies the same points on the augmented copies of a shape instance in a class
  
  We first exploit the shape instance discrimination loss to classify the point of each shape into a class and then apply the point instance discrimination to classify the points on each shape separately (otherwise we would have too many useless comparisons). We exploit the geometric similarity of nearby points and cluster local points on a shape as one class.

####Method:backbone shape encoding network

  Trained on ShapeNetCore55
  
####Method:pretext task for unsupervised learning
Inspired by the idea of instance discrimination which operates on a single image-level, we design a pretext task to discriminate multiresolution instances of shapes for learning representative shape features and develop effective training schemes to reduce the computational and memory cost caused by the large number of instances.


####Method:Details

Input data:
    - each point in the cloud should have a normal vector (if not we assign one using PCA)
    - we normalize each point cloud into a unit sphere
    - we generate shape instances with a transformation
composed by random rotations, random translations within [-0.25,
0.25], and random scaling along each coordinate axis with the ratio
within [0.75,1.25]. 
    - We label the transformed instances of the same shape with its index in the input dataset.
    - We label each point on the generated instance by the same index of the corresponding point in the input shape in the dataset.

i.e. We create N shape-instance classes and Mi point-instance
classes for each shape-instance class. **These multiresolution class
labels serve as self-supervision signals for our network training.**
(Note that these labels can be acquired by free and there is no human annotations here.)

Because we can generate many transformed shapes and each one can have a lot of point-level classes .. we introduce patch-instance class.

  - on each shape we over-segment it into Ki patches (less than points) ... Thus for each shape-instance class we can create Ki patch-instance classes.
  
  - we use K-means to compute over-segmented patches and choose the same K for all shapes, K=100.
  
Loss:
  - shape-instance loss: linear classifier (MLP) with cross entropy
  - patch-instance loss: linear classifier (MLP) with cross entropy
  
  MID loss for an instance of shape Xi:
  L(Xi) = Ls(si) + 1/Mi Σ Lp(pi,j)

**We use different linear classifiers for points of different 3D shapes, but the shape encoder is shared across all shapes.**

#### Back end design and tasks:

- shape classification:
    - a one-layer fully-connected (FC) network
- shape segmentation:
    -  two-layer FC 

MID-FC(Fix): we fix the pre-trained MID-Net and only train the back-end with the labeled training data in each shape analysis task.

MID-FC(Finetune): we fine-tune both MID-Net and the FC back-end with the labeled training data in each shape analysis task. The MID-Net is initialized with the pre-trained weights, and the FC back-end is randomly initialized.

MID-FC(NoPre): we initialize both MID-Net and FC layers with random initialization and train the network from scratch with the labeled training data of each shape analysis task.


#### Fine-grained PartNet segmentation
pretrained on shapenet. trained on partnet.


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

Notes
---
- "Our key observation is that a 3D shape is composed of its local parts and thus the feature for shape and points are coherent and should be encoded and trained jointly. So we adapt HRNet to octree-based net for extracting and fusing features from both points and shapes via parallel multiresolution subnetworks and connections across subnetworks."
- for unsupervised pre-training a key idea is to design some pretext (surrogate) tasks that use supervision signals from the data itself. e.g. in NLP use ```mask context prediction``` or ```next sentence prediction```. In Computer Vision some pretext tasks are ```colorization```, ```context prediction```, ```motion segmentation```, ```image instance discrimination```, ```contrustive losses```.

My questions
---
1. ~~when we say in fig2 "to be discriminative and transformation-invariant under the supervision of the MID loss on both shape instance and point levels" what do we mean about point level ? that we want the color information to be correct? or if we have class per point to have correct class? what else can it be?~~ answered on [Method:MID loss](#Method:MID loss).
2. fig4 right?
3. what is "shape registration task"?
4. how are the tasks specified in notes pretext ??
5. ~~is called multi-resolution because of shape info and point info or also because we scale each shape in many other scaled examples?~~ because of HRNet
6. in code how is the output for shape-instance and patch-instance ? is it a vector with probabilities of each shape and a matrix of 100 probabilities of each patch ?
7. ~~what does it mean "different classifiers but same encoder"?~~ i guess if one shape has 10 patches and another shape has 20 patches then you need two different classifiers for the point classification of each shape!
8. algorithm 1
