The GAN architecture is comprised of both a generator and a discriminator model.

The **generator** is responsible for creating new outputs, such as images, that plausibly could have come from the original dataset.

The generator model is typically implemented using a deep convolutional neural network and results-specialized layers that learn to fill in features in an image rather than extract features from an input image.

Two common types of layers that can be used in the generator model are a upsample layer (in keras: UpSampling2D) that simply doubles the dimensions of the input and the transpose convolutional layer (in keras: Conv2DTranspose) that performs an inverse convolution operation.

Generator needs a layer to translate from coarse salient features to a more dense and detailed output.

The **discriminator** is responsible for classifying images as either real (from the domain) or fake (generated).

