Fine-Grained PartNet Segmentation
---

### Experiments: Data
- The part numbers in each shape category vary from 3 to 50. 
- Each shape contains 10,000 points and each point has a part ID label. 
- We use their Level-3 labels.

### Experiments: Output
Each algorithm takes a 3D point cloud as input and predicts the part ID for each point. 

### Experiments: Evaluation
mean IOU across all 17 categories. 
(note that the ShapeNet dataset used for pre-training does not contain Door, Fridge, and Storage categories of PartNet.)

### Experiments: Hyperparameters
- SGD with batch size 32
- The learning rate of MID-FC(Fix) and MID-FC(NoPre) starts from 10^−1 and decreases to 10^−3, and the learning rate of MID-FC(Finetune) decays from 10^−2 to 10^−4.

### Experiments: Results
- MID-FC(Fix) outperforms all existing supervised approaches, which is significant considering the fact that MID-FC(Fix) only contains 2 trainable FC layers and optimizes less than 0.3M parameters. With fine-tuning, MID-FC(Finetune) achieves more improvements and the accuracy increases 14.3 points at least, compared to supervised approaches, and 2 point improvement over MID-FC(NoPre).

- _For the three categories that are not in ShapeNet, MID-FC(Finetune) and MID-FC(Fix) still achieve better performance, which demonstrates the good generality of our pre-trained features._

- _The accuracy of MID-FC(Fix) and MID-FC(Finetune) trained with 20% labeled data is comparable to other supervised methods trained with 100% labeled data._

