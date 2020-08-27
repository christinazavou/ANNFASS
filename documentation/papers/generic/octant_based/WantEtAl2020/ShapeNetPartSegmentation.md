ShapeNet Part Segmentation
---

### Experiments: Data
- ShapeNet-Part dataset (16,881 3D point clouds, collected from 16 categories of ShapeNet).
- Each point cloud has 2 to 6 part segmentation labels.
- Shapes in each category share the same part segmentation (i.e. , the same label set), while different shape categories have their own segmentation.
- The number of points of a shape varies from 1000 to 3000, which is sparser than the point cloud used in our pre-training, where the point number varies from 6,000 to 8,000. 

### Experiments: Output
Takes as input the 3D point cloud and predicts the part label for each point.

### Experiments: Evaluation
- mean-IoU across all categories
- mean-IoU across all instances in each category

### Experiments: Hyperparameters
- SGD with batch size 32. 
- For MID-FC(Fix) and MID-FC(NoPre), the learning rate decays from 10^−1 to 10^−3. For MID-FC(Finetune), the learning rate decays from 10^−2 to 10^−4, respectively.
