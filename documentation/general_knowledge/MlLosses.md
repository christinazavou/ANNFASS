1. Softmax cross entropy for classification
---
- [blog post](https://guandi1995.github.io/Softmax-Function-and-Cross-Entropy-Loss-Function/)

2. Contrastive Loss
---

- [blog post 1](https://towardsdatascience.com/contrastive-loss-explaned-159f2d4a87ec)

Used in siamese networks, when instead of having class labels and using categorical cross entropy, we dont have labels, so we can use contrastive loss.

Contrastive loss takes the output of the network for a positive example and calculates its distance to an example of the same class and contrasts that with the distance to negative examples. 

This is accomplished by taking the cosine distances of the vectors and treating the resulting distances as prediction probabilities from a typical categorization network. **The big idea is that you can treat the distance of the positive example and the distances of the negative examples as output probabilities and use cross entropy loss.**

![cl](../figures/contrastiveloss.png)

Contrastive loss looks suspiciously like the softmax function. That’s because it is, with the addition of the vector similarity and a temperature normalization factor.

![expfun note](../figures/exp_func.png)

```python
import numpy as np
def contrastive_loss(vec, pos_vec, neg_mat):
    pos_dot = vec.dot(pos_vec)
    # Most of the negatives are pretty far away, so small or negative
    num_neg = len(neg_mat)
    neg_dot = np.zeros(num_neg)
    for i in range(num_neg):
        neg_vec = neg_mat[i]
        neg_dot[i] = vec.dot(neg_vec)
    
    # make a vector from the positive and negative vectors comparisons
    v = np.concatenate(([pos_dot], neg_dot))
    # take e to the power of each value in the vector
    exp = np.exp(v)
    # divide each value by the sum of the exponentiated values
    softmax_out = exp/np.sum(exp)
    
    # Contrastive loss of the example values
    # temp parameter
    t = 0.07
    # concatenated vector divided by the temp parameter
    logits = np.concatenate(([pos_dot], neg_dot))/t
    #e^x of the values
    exp = np.exp(logits)
    # we only need to take the log of the positive value over the sum of exp. 
    loss = - np.log(exp[0]/np.sum(exp)) 
    return loss


contrastive_loss(
np.array([-0.83483301, -0.16904167, 0.52390721]), 
np.array([-0.83455951, -0.16862266, 0.52447767]), 
np.array([
[0.70374682, -0.18682394, -0.68544673],
[0.15465702, 0.32303224, 0.93366556],
[0.53043332, -0.83523217, -0.14500935],
[0.68285685, -0.73054075, 0.00409143],
[0.76652431, 0.61500886, 0.18494479]])
)
# gives 4.9068650660314756e-05
contrastive_loss(
np.array([-0.83483301, -0.16904167, 0.52390721]),
np.array([-0.83455951, -0.16862266, 0.52447767]),
np.array([
[-0.83455951, -0.16862266, 0.52447767],
[-0.83455951, -0.16862266, 0.52447767],
 [0.53043332, -0.83523217, -0.14500935],
[0.68285685, -0.73054075, 0.00409143],
 [0.76652431, 0.61500886, 0.18494479]])
)
# gives 1.0986122899985278
```

- [blog post 2](https://towardsdatascience.com/how-to-choose-your-loss-when-designing-a-siamese-neural-net-contrastive-triplet-or-quadruplet-ecba11944ec)

![](../figures/contrastiveloss1.png)
![](../figures/tripletloss.png)

Contrastive loss takes as input your current sample and another sample (which is labeled either as similar or dissimilar) while Triple loss takes as input your current sample, one similar sample and one dissimilar sample.

- [Tensorflow implementation](https://stackoverflow.com/questions/38260113/implementing-contrastive-loss-and-triplet-loss-in-tensorflow)
