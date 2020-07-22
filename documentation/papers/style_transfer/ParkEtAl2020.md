Swapping Autoencoder for Deep Image Manipulation
---
(https://arxiv.org/pdf/2007.00653.pdf)

### From Abstract, Discussion and Images

##### Goal
a deep NN for image manipulation (i.e. for image editing...like photoshop...so for example change the lighting of the sky or change landscape from dry soil to wet grass, or change hair of person etc)

##### How
encode an image into two independent components & enforce that any swapped combination maps to a realistic image 

encourage the components to represent **_structure_** and _**texture**_ by enforcing one component to _**encode co-occurrent patch statistics**_ across different parts of the image

##### Result
the method enables us to manipulate real input images in various ways like:
- texture swapping
- local and global editing
- latent code vector arithmetic

better results and more efficient than current generative models

### My Questions
~~1. in abstract...how do they enforce realistic image? do they have training data with changes ? or is it really autoencoder ? if yes then how do they ensure meaningful components?~~
2. what is 'latent code vector arithmetic'?