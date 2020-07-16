Identifying Style of 3D Shapes using Deep Metric Learning
---
(https://onlinelibrary.wiley.com/doi/epdf/10.1111/cgf.12977)

### From Abstract, Discussion and Images

##### How
metric learning with neural networks

train the similarity metric on a shape collection directly (thus low and high level features for describing style are learned by NN)

input: image tuple (redered from 3D shape)

##### additional tasks tackled
 - training NN on small dataset with good style classification accuracy

 - propose a method to incorporate heterogeneous data sources (including annotated online photos)

##### Results
the network creates an embedding space where _**stylistically similar samples are placed close together**_ and stylistically dissimilar ones are placed further apart

Objects with the same style can have varying geometric shapes, and the method is fine with it since it allows for variation in shape and structure!!

### Notes

- from fig.1 i see they give a triplet as input, with a simillar and a dissimilar to the 'query' sample

- basically because the 3D shapes are trasformed into images they can expand the training set with online annotated images

- when we have two inputs that are being compared we call it a siamese network. when we have two relative distances to compare (thus a query input, a positive input and a negative input) we call it a triplet network

- _**fig.3 is a great representation of the margin loss!!!!**_

- fig5: saliency is estimated by the entropy of the image intensities

- in conclusion .. they mention that now the 3D shape image-view selection is based on the view with higher saliency ... but this doesnt mean that the view showing most of the style is selected .. so in future work a different approach could be follow in selecting the view (rather than using max cross entropy)

### My Questions

- ~~what does it mean in fig.1. three convolutional networks ? three different ?~~ from fig.2. and fig.4 we see that one network (triplet) is used !
- in fig.4 the ||T(x)||_2 <= 1 is an equivalent of L2-regularization?
- ~~in fig.6 what does it mean "retaining the underlayed samples for training" ? does he mean in case we remove some training examples and add other ones?~~ he is probably saying this because of the experiments needed in fig.7 with less 3D shapes ..
