Network Training
---

**input:** a set of shapes, {Xi} where i=1..N
**to be learned:** 
    - encoder
    - weights fom the shape classifier, {si} where i=1..N
    - weights for each patch classifier, {v_ic} where i=1..N and c=1..Ki

A naïve approach to train the network is to update the weights of the shape encoder network and the linear classifier together according to the back-propagated gradient of the MID loss function.

However, we found that updating the linear classifiers in each minibatch often makes the classifier training unstable and hinders the optimization of the shape encoder, thus we update the weights of the linear shape-instance classifier slowly by:

1. randomly sample a mini-batch {Xb} with b=1..B
2. compute MID loss
3. update encoder weights with SGD from MID loss
4. update {si} and {v_ic} with:
    - s˜i = (1 − λs ) · s˜i + λs · si
    - v˜i,c = (1 − λp ) · v˜i,c + λp · vi,c ,
    where λs and λp are momentum parameters set to 0.5

#### Details:
We have implemented our network using Tensorflow and trained the MID-Net on ShapeNetCore55 dataset.

For each shape, we average the points inside each non-empty finest-level octants and use these average
points as the sample points of this shape. We set the batch size as 32, momentum as 0.9, and weight decay as 0.0005. The initial learning rate is 0.03 and it decays by a factor of 10 after 200 epochs and 300 epochs, respectively. The whole training process is finished
after 400 epochs, which takes about 60 hours on an NVIDIA 2080 Ti graphics card.

We visualize both the shape-features and patch-features learned by T-SNE.