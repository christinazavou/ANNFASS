
https://towardsdatascience.com/a-practical-guide-on-convolutional-neural-networks-cnns-with-keras-21421172005e
---

**_Stride_** parameter controls the movement of the filter
if stride = 1:
10 x 10 image + 3x3 filter = 8x8 feature map 
10 x 10 image + 5x5 filter = 6x6 feature map

if we want to preserve the pixels on the borders, we can use _**padding**_ and add zeros around the image

_**In a convolution layer, not just one filter is used.**_ Many different filters are applied to the image. Each filter is aimed to capture a different feature such as edges, horizontol lines and so on.

In the convolution layer, rectifier function (usually RELU but others can be used to i guess) is applied to increase the non-linearity in the image. 

Then we have _**Pooling layer**_ (needs a pooling box size) which reduces the size of the feature maps while maintaining the preserved features of the image. (e.g. max pooling, avg, sum..)

Now, we need to flatten pooled feature maps in order to feed them to a fully connected layer.

note: in CNN all input images need to be of same shape

useful Keras functionality
---
ImageDataGenerator.flow_from_directory


My Questions
---
1. pooling happens on one filter output and not among multiple filters' output right ?

