PointNet++: Deep Hierarchical Feature Learning on
Point Sets in a Metric Space
---
(https://arxiv.org/pdf/1706.02413.pdf)


### From Abstract, Conclusion and Images

### issue tackled
1. by design, PointNet does not capture local structures so it can't recognize well the fine-grained patterns or generalize to complex scenes

2. point sets are usually sampled with varying densities, so performance of NN trained on uniform densities are not the best

### approach
1. a hierarchical NN that applies PointNet recursively on a nested partitioning of the input point set! 
exploitation of metric space distances

2. proposed novel set learning layers to adaptively combine features from multiple scales!

### result
1. able to learn local features with increasing contextual scales

2. learns deep point set features efficiently and robustly

better than state-of-the-art!

### notes:
- from fig.4 we see that one way to deal with non uniform input cloud is to randomly drop some points during training

- (from conclusion) the point set is sampled according to a distance metric and PointNet++ learns hierarchical features with respect to this distance metric

### My Questions
1. from fig.3 & 2 is it true that they do: selection of different pieces of input (with different sizes) and then apply pointNet and concat results to give further down the NN .. and also select results from first pointnet (level: broad) and second pointnet (level: narrow) and concatenate to use them further down the NN .. !?
