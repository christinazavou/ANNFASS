ideas:
---
1. similarity of buildings **based on similarity of segmented elements**
    - to evaluate such method we need to have annotations on similarity of segmented elements .. or we would at the end find an overall similarity and use annotations of similar buildings
    - this could be done directly with deep learning or with feature engineering like in LunKalogerakisSheffer2015 and then machine learning for weights learning
    
    ** if done with DL then it might be new i.e. not applied before a similarity learning on patch level. we can use as patch annotations the annotation of the whole building .. however some buildings are hybrid so this might not work 
    
    ** if with LunKalogerakisSheffer2015 then it's application of different work to get segmentations and then existing work of stylistic element comparison on different set of data (possible to use as features a hidden representation from the segmentation network that is of the intial-image resolution)
    
2. **similarity of buildings**
    - this could be done directly with deep learning and triplet(margin) loss or contrastive loss. 
    - an example could be to use voxel representation (OCNN) + HRNet architecture to have encoding of whole building and encoding of points per se and apply on either the shape encoding or the combined encoding a similarity metric (using contrastive or triplet loss)
    
    ** we can do deconvolutions to find back the initial places that were important for the style comparison

3. similarity of buildings from **multitask training on similarity and segmentation** i.e. one epoch train for segmentation and one epoch train for style similarity or both at each epoch.
    - use of triplet loss or contrastive loss
    - the issue here is that in segmentation the network probably learns to identify structures and not styles .. so style and segmentation might be two tasks that shouldn't be trained together 
    
    ** for this maybe look at ParkEtAl2020 where they restrict their network to learn one style and one texture representation using patch co-occurrence..

4. use **YuEtAl2018 to select style patches and to learn to cluster** them in predefined building categories (i.e. randomly select patches, then convolve them with multiple images then feature selection by clustering etc) 

5. create a patch selector neural network. give it one building and pass its output to another network that convolves it with many versions of the initial building (augmented set with rotation and scaling) and the compared-building .. then pass this output to a contrastive loss function

6. if we have some annotations of building classes and some annotations of building similarity-pairs we can train a network to do at the same time **stylistic classification and stylistic similarity**

questions:
---
1. what annotations do we have? (amount of annotations, triplets or pairs of buildings, amount of annotators)

2. if we use LunKalogerakisSheffer2015, what elementary distances can we use to learn their weights with our amount of data? (before using this approach we can see the correlation of such distances with the ground truth)

3. do we have any of our buildings in a contour image? do we have any of our buildings as a multi-view images set?
