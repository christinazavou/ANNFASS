Back-End Design and Training
---

For each downstream task, we concatenate MID-Net with simple back-end layers.

### for shape-classification:
a one-layer fully-connected (FC) network

### for shape segmentation:
two-layer FC

MID-FC = MID-Net with the FC backend 

We optimize the concatenated networks with two training schemes:
- MID-FC(Fix):
    
    fix the pre-trained MID-Net and only train the back-end with the labeled training data in each shape analysis task.

- MID-FC(Finetune):
 
    fine-tune both MID-Net and the FC back-end with the labeled training data in each shape analysis task. 
    
    the MID-Net is initialized with the pre-trained weights, and the FC back-end is randomly initialized.
    
- MID-FC(NoPre):
    
    train the concatenated networks in a supervised way where both MID-Net and FC layers are randomly initialized
    

### Note:

1. first constructs the octree of input 3D point cloud and 
2. compute input features of the finest-level octants with the same process used in MID-Net pre-training
3. then the MID-Net computes the shape and point features of 3D input, where the feature of each point is computed from the output features of nearby eight leave octants via tri-linear interpolation.
4. after that, the output shape or point features are fed into the following back end layers for computing the shape analysis results.

