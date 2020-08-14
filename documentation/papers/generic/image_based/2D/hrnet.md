[Deep High-Resolution Representation Learning
for Visual Recognition](https://arxiv.org/pdf/1908.07919.pdf)
---

### Goal
high resolution representations for:
- human pose estimation
- semantic segmentation
- object detection

### existing
apply convolution after convolution e.g. ResNet, VGGNet and go in an encoder-decoder u shape network i.e. goes from high resolution to low and then back to high

### Approach
HRNet: maintain high-resolution representation throught the whole network by:
1. connect the high-to-low resolution convolution streams in parallel
2. repeatedly exchange the information across resolutions

### result
HRNet is a stronger backbone for computer vision problems!


Notes
---
- basically from fig2+3, you can see that each layer can be represented by a block. in each block you have several input shapes and you do few streamed convolutions on each input. the output of each block is as many input shapes plus one. the last step in a block merges the data from different shapes by doing convolutions with stride and convolutions with upsampling. the network consists of a chain of such blocks. in the last block you will have all shapes together.

