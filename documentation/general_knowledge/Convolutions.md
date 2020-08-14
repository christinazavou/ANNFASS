---
References:
- https://towardsdatascience.com/a-practical-guide-on-convolutional-neural-networks-cnns-with-keras-21421172005e
---

Parameters:

- _**_Stride and Padding_**_:
    
    Stride controls the movement of the filter.
    ```
    e.g.  with stride set to 1:
    
    if padding = 'VALID':
    10 x 10 image and 3x3 filter gives 8x8 feature map 
    10 x 10 image and 5x5 filter gives 6x6 feature map
  
    if padding = 'SAME':
    10 x 10 image and 3x3 filter gives 10x10 feature map 
    (so it adds one column of padding on left and one column of padding on right and similarly on top and bottom to generate an output shape that keeps width and height same)
    10 x 10 image and 5x5 filter gives 10x10 feature map
    (..adds two columns of padding on left and two columns of padding on right...)
    ```
  
- Padding  

    1. padding = "VALID" means without padding, i.e. it drops the **_right-most columns (or bottom-most rows_**). 
    
    ```
     1  2  3  4  5  6  7  8  9  10 11 (12 13)
                      |________________|                dropped
                                     |_________________|
    ```
    
    naming: With "VALID" padding the layer only uses valid input data.

    2. padding = "SAME" means with zero padding

    ``` 
    pad|                                      |pad
       inputs:      0 |1  2  3  4  5  6  7  8  9  10 11 12 13|0  0
                   |________________|
                                  |_________________|
                                                 |________________|
    ```

    i.e. "SAME" tries to pad evenly left and right, but if the amount of columns to be added is odd, it will add the extra column to the right, as is the case in this example (the same logic applies vertically: there may be an extra row of zeros at the bottom).

    naming: With "SAME" padding, if you use a stride of 1, the layer's outputs will have the _**same spatial dimensions as its inputs.**_

- Pooling

    Note that you can use stride also in the pooling layer!

    ```
  e.g. input size 110x110, max pool of size 3x3 and stride 2 ==> output shape will be 55x55!
    ```

---

Architecture of Convolutional Layer:

- _**in one conv layer, many filters are used.**_ 

    Each filter aims to capture a different feature such as edges, horizontal lines, corners etc.
    
    Then an activation function (usually RELU) is used to increase the non-linearity in the input image.
    
    Then we can have a pooling layer.
 
- Pooling layer

    This needs a pooling box size.
    
    This reduces the size of the feature maps while maintaining the preserved features of the image. (e.g. max/avg/sum pooling...)

    - After the conv layer you can use a flatten layer to flatten the pooled feature maps and feed them to a fully connected layer.

- in conv layer all input images need to be of same shape

---

Types of Convolution:

- Usual (2D) convolution:

    Used usually with images.
    
    ```python
    from keras.layers import Conv2D
    model.add(Conv2D(1, kernel_size=(3,3), input_shape = (128, 128, 3)))
    # output shape is 26x26x1
  
    # filters: A 4-D tensor of shape [filter_height, filter_width, in_channels, out_channels]
    # This will apply the same Width x Height convolution in each input channel and then all results will be merged (e.g. with sum or average) into one number. This is why at the end, if we use 4 filters we will end up with 4 channels in the output (feature map).
    ```

    Typically, the stride is (1×1), i.e. a filter is moved along one pixel horizontally for each read from left-to-right, then down pixel for the next row of reads. A stride of 2×2 on a normal convolutional layer has the effect of downsampling the input, much like a pooling layer. (i.e. we can use conv2d with 2×2 stride instead of conv2d + pooling)


- 1D convolution
    
    Used usually with time series.

    ```python
    from keras.layers import Conv1D
    model.add(Conv1D(1, kernel_size=5, input_shape = (120, 3)))
  # output shape is 116x1

    model.add(Conv1D(4, kernel_size=5, input_shape = (120, 3)))
    # output shape is 116x4
    ```

- 3D convolution 

    Used usually with 3D objects or videos.

    ```python
    from keras.layers import Conv3D
    # input shape is height, width, depth, channels
    
    model.add(Conv3D(1, kernel_size=(3,3,3), input_shape = (128, 128, 128, 3)))
    # output shape is 126x126x126x1

    model.add(Conv3D(4, kernel_size=(3,3,3), input_shape = (128, 128, 128, 3)))
    # output shape is 126x126x126x4
    ```


Popular network architectures:
---
for encoding (i.e. going from high resolution to low resolution):
VGGNet, ResNet
for decoding (i.e. going from low resolution to high resolution):
SegNet, DeconvNet, U-Net

