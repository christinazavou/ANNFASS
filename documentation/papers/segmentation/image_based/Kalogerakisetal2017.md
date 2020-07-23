3D Shape Segmentation with Projective Convolutional Networks
---

(https://arxiv.org/pdf/1612.02808.pdf)

### From Abstract, Conclusion and Images

##### Task
segment 3D object into their labeled semantic parts

##### Approach
_named: ShapePFCN_

image-based Fully Convolutional Networks (FCNs) 
+
surface-based Conditional Random Fields (CRFs)

1. multiple views and scales --> in FCN --> effective aggregated representation
--> projected onto 3D object surfaces
2. combine output with geometric consistency cues into a surface-based CRF
3. train end-to-end with labels the semantic segmentation

##### Result
outperforms current benchmark

##### Notes:
- evaluation: average accuracy for category (you can include only categories with more than 3 labels) and for dataset (you can include only samples with more than 3 labels)
- the CRF is used to favor coherent shape segmentations

### My Questions
1. ~~what is FCNs?~~ FCN is network composed of convolutional layers without any MLP at the end as usually done for classification. FCN learns filters everywhere. Even the decision-making layers at the end of the network are filters...i.e. it tries to learn representations and make decisions based on local spatial input... if we were to append a MLP at the end we would like the network to learn something using global information.
2. how do you project output of FCN onto 3D object surface in practice? i.e. how is Image2Surface projection layer in fig.1 ?


