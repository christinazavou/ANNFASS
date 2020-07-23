Learning 3D Mesh Segmentation and Labeling
---
(https://people.cs.umass.edu/~kalo/papers/LabelMeshes/LabelMeshes.pdf)


### From Abstract, Conclusion and Images

##### Goal
simultaneous segment and label parts in 3D meshes

##### How
use of CRF

##### Outcomes
segmentation methods that use training data are way better

**Performance drops with less training data, but, even with only 3
examples, our method still out-performs previous methods by a small margin.**

**It's pretty cool that you can train on birds and (applying knowledge transfer) infer on planes, or train on chairs and infer on tables etc.**

**Classes with larger variability across the data require larger
training sets for good results.**

##### My Questions
- so (fig.2) only 3 training examples to be able to perform well on validation example ? generally what where the full training data (+labels) ?
 ---> see table 1...20 categories used
 
- fig.5 : what is jointboost?



