
1. Siamese Networks
---

A siamese network is often shown as two different encoding networks that share weights, but in reality the same network is just used twice before doing backpropagation.

When training a siamese network, 2 or more inputs are encoded and the output features are compared. This comparison can be done with e.g. triplet loss or pseudo labeling & cross-entropy loss or contrastive loss.

Training this network is make it recognize similar things and also recognize when things are dissimilar, both with good confidence.