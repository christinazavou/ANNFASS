###Usual (2D) convolution:
(used usually with images)

from keras.layers import Conv2D
model.add(Conv2D(1, kernel_size=(3,3), input_shape = (128, 128, 3)))

output shape is 26x26x1

tf.keras.layers.Conv2D(
    filters, kernel_size, strides=(1, 1), padding='valid', data_format=None,
    dilation_rate=(1, 1), activation=None, use_bias=True,
    kernel_initializer='glorot_uniform', bias_initializer='zeros',
    kernel_regularizer=None, bias_regularizer=None, activity_regularizer=None,
    kernel_constraint=None, bias_constraint=None, **kwargs
)

usually we do the same WidthxHeight convolution in each channel and then all channels are merged with sum or average for example into one number. That's why at the end, if we use 4 filters in our convolution layer we will end up with 4 channels in the output.


Typically, the stride of a convolutional layer is (1×1), i.e. a filter is moved along one pixel horizontally for each read from left-to-right, then down pixel for the next row of reads. A stride of 2×2 on a normal convolutional layer has the effect of downsampling the input, much like a pooling layer. (i.e. we can use conv2d with 2×2 stride instead of conv2d + pooling)


### 1D convolution
(used usually with time series)

from keras.layers import Conv1D
model.add(Conv1D(1, kernel_size=5, input_shape = (120, 3)))

output shape is 116x1

again, if we use Conv1D(1, kernel_size=5, input_shape = (120, 3)) the output shape will be 116x4


### 3D convolution 
(used usually with 3D objects or videos)

from keras.layers import Conv3D
model.add(Conv3D(1, kernel_size=(3,3,3), input_shape = (128, 128, 128, 3)))
         
output shape is 126x126x126x1

input shape is height, width, depth, channels


Padding
---

1. "VALID" = without padding
```
 1  2  3  4  5  6  7  8  9  10 11 (12 13)
                  |________________|                dropped
                                 |_________________|
```

i.e. "VALID" only ever drops the right-most columns (or bottom-most rows).

naming: With "VALID" padding, there's no "made-up" padding inputs. The layer only uses valid input data.

2. "SAME" = with zero padding
``` 
pad|                                      |pad
   inputs:      0 |1  2  3  4  5  6  7  8  9  10 11 12 13|0  0
               |________________|
                              |_________________|
                                             |________________|
```

i.e. "SAME" tries to pad evenly left and right, but if the amount of columns to be added is odd, it will add the extra column to the right, as is the case in this example (the same logic applies vertically: there may be an extra row of zeros at the bottom).

naming: With "SAME" padding, if you use a stride of 1, the layer's outputs will have the same spatial dimensions as its inputs.


Pooling
---
note that you can use stride also in the pooling layer!

e.g. input size 110x110, max pool of size 3x3 and stride 2 ==> output shape will be 55x55!