possibilities based on LunKalogerakisSheffer2015 and YuEtAl2018:
1. similarity of segmented elements
    - to evaluate such method we need to have annotations on similarity of segmented elements .. or we would at the end find an overall similarity and use annotations of similar buildings
    - this could be done directly with deep learning or with feature engineering like in LunKalogerakisSheffer2015 and then machine learning for weights learning
2. similarity of buildings
    - this could be done directly with deep learning and triplet loss or contrastive loss. (using approach of LunKalogerakisSheffer2015 is possible but a lot of engineering and too simple for such data)
3. similarity of buildings after getting encoded representation from the segmentation network i.e. one epoch train for segmentation and one epoch train for similarity or both at each epoch.
    - use of triplet loss or contrastive loss
4. use YuEtAl2018 to select style patches and to learn to cluster them in predefined categories


questions:
1. what annotations do we have? (amount of annotations, triples or pairs of buildings, amount of annotators)
2. if we use LunKalogerakisSheffer2015, what elementary distances can we use to learn their weights with our amount of data? (before using this approach we can see the correlation of such distances with the ground truth)
3. do we have any of our buildings in a contour image? do we have any of our buildings in a multi-view images set?
