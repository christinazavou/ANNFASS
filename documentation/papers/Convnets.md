Visualizing and Understanding Convolutional Networks
---
(https://arxiv.org/pdf/1311.2901v3.pdf)


##### Goal
introduce a technique to visualize CNNs to understand better the intermediate feature layers and the operation of the classifier

##### How: Visualization Technique
By a multi-layered Deconvolutional Network that projects the feature activations back to the input pixel space!

##### Problem
until now visualizing features was limited to:
- 1st layer visualization where projections to the pixel space are possible
- hard & inaccurate visualization in the other layers

##### How: Analysis of classifier
By occluding portions of the input image revealing which parts of the scene are important for classification.

##### How: network architecture
concolution layer + max pooling + local contrast operation that normalizes responses across feature maps + fully connected layer + softmax layer

##### How: network training
N labeled images {x,y}
cross entropy loss

##### Visualization with a Deconvnet
To start, an input image is presented to the convnet and features computed throughout the layers. To examine a given convnet activation, we set all other activations in the layer to zero and pass the feature maps as input to the attached deconvnet layer.
Then we successively (i) unpool, (ii) rectify and (iii) filter to reconstruct
the activity in the layer beneath that gave rise to the chosen activation. This is then repeated until input pixel space is reached

Unpooling: In the convnet, the max pooling operation is non-invertible, however we can obtain an approximate inverse by recording the locations of the maxima within each pooling region in a set of switch variables. In the deconvnet, the unpooling operation uses these switches to place the reconstructions from the layer above into appropriate locations, preserving the structure of the stimulus.

The convnet uses learned filters to convolve the feature maps from the previous layer. To invert this, the deconvnet uses transposed versions of the same filters, but applied to the rectified maps, not the output of the layer beneath i.e. we flip the filter vertically and horizontally.

##### Results
outperform models on ImageNet classification benchmark (and on Caltech101 and Caltech256)

### Notes / Interesting
1. fig4: the visualization shows the strongest activation (across all training examples) for a given feature map. Also each feature map is shown in different epochs (look at the face one!!!!).

2. notice how visualization is done in fi7. we have the feature map and then its projection onto the input image (only then we understant what the feature map focuses on)

3. notice in fi7 the difference between features of hidden encoding (convolutional) layers and output classification layer .. e.g. strongest feature in layer 5 is the letters but the classifier is most sensitive to the wheel!

### My Questions
1. in fig2, they project the activations of one layer into pixel space using deconv approach.. do they mean that the deconv filters of size MxM into initial pixel size NxN or they show pixels fo layer size i.e. MxM ? if it's the first ... are all papers showing activations using deconv? (also in fig7 how is the projection done?!)

2. what is the conclusion from fig5? that the network is transformation invariant in some inputs (some classes) and in few (e.g. entertainment center) is not?

3. ~~in fig7 what is the purpose of the grey square in the input ? to add noise in training data? or to see that is the activations and labels at the grey i.e. if it understands missing part?!~~ it is to see the activations and class probabilities when the grey pixel moves around the parts of the input image!

4. what is "contrast operation that normalizes responses across feature maps"?
