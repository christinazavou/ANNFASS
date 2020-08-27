Multi-Resolution instance discrimination
---

#### Shape-instance discrimination loss

To train shape-level features we use a linear classifier that:
- classifies shape instances into N classes, where each 3D shape Xi and its augmented instances are classified into the i-th class

and for loss we use:
- [cross entropy](https://guandi1995.github.io/Softmax-Function-and-Cross-Entropy-Loss-Function/) for i-th class defined as cross entropy over the N augmented shapes of that class

#### Point-instance discrimination loss

To train point-level features we use a linear classifier that:
- classifies patch instances into the patches of that class(i.e. original shape i.e. object).


#### MID loss

We define the loss for an instance of shape Xi as:
- loss of shape and
- average loss of its patches


#### Note
 Although our method applies different linear classifiers
for points of different 3D shapes, the shape encoder is shared by all 3D shapes... _i.e. even if we have K=200 for each 3D shape we train a different linear classifier for the points-classifier of each 3D shape as the classes (patches) are different in each object..._


My Questions
---
1. ~~since "each 3D shape Xi and its augmented instances are clssified into the i-th class" why do we say that we only have self-supervised signal and no human annotations? or is it that initially we have N objects thus we have N classes and then the NxL (L=augmentations) objects must be classified into the initial N classes?!~~ looking at the loss of a class i believe yes!
2. as i understand we manually do some training epochs for shape-instance classification and some training epochs for point-instance classification .. i.e. train both network-tails .. thus in the shape-instance classification we should have a classifier of N classes .. what is this N in the code?!
