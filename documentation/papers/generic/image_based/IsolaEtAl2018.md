Image-to-Image Translation with Conditional Adversarial Networks
---

### Task
image to image translation

### Method
conditional adversarial networks: they learn:
    - mapping from input image to output image
    - loss function to train the mapping

### Result
effective at:
    - synthesizing photos from label maps
    - reconstructing objects from edge maps
    - coloring images
    etc
for all these cases we use the same architecture, and just train on different data

### Software
pix2pix


Notes
---

- image translation examples:
    - image of semantic segmentation (colors) into a real image
    - aerial image to map
    - day image to night image
    - sketch drawing (edge map) to photo
    - black and white image to color image

- fig.2: in the conditional GAN, both the generator and discriminator observe the input (edge map), unlike in an unconditional GAN

- from fig4+5: different loss functions generate different results. adding skip connections boosts performance.