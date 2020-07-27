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

