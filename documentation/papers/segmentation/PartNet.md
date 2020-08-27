[PartNet: A Large-scale Benchmark for Fine-grained and
Hierarchical Part-level 3D Object Understanding](https://openaccess.thecvf.com/content_CVPR_2019/papers/Mo_PartNet_A_Large-Scale_Benchmark_for_Fine-Grained_and_Hierarchical_Part-Level_3D_CVPR_2019_paper.pdf)
---

Contributions:
---

1. **Dataset**:
    - 573,585 part instances 
    - 26,671 3D models
    - 24 object categories
    
     Among 24 object categories, all of them have the coarse level, while 9 have the middle level and 17 have the fine level.

2. **3 benchmarking tasks (proposed to demonstrate the usefulness of this data)**:
    - fine-grained semantic segmentation
    - hierarchical semantic segmentation
    - instance segmentation

3. **benchmarked 4 state-of-the-art algorithms for semantic segmentation and 3 baseline methods for hierarchical segmentation using this data**

    - Unsurprisingly, performance for all four algorithms drop by a large margin from the coarse level to the fine-grained level. (Table 3)
    
    - We propose three baseline methods to tackle **hierarchical segmentation**: bottom-up, topdown and ensemble. The bottom-up method considers only the leaf-node parts during training and groups the prediction of the children nodes to parent nodes as defined in the hierarchies in bottom-up inference. The top-down method learns a multi-labeling task over all part semantic labels on the tree and conducts a top-down inference by classifying coarser-level nodes first and then finer-level ones. For the ensemble method, we train flat segmentation at multiple levels as defined in Sec. 5.1 and conduct joint inference by calculating the average log-likelihood scores over all the root-to-leaf paths on the tree.
    
    - The goal of **instance segmentation** is to detect every individual part instance and segment it out from the context of the shape. (challenging because many visually similar but semantically-different parts). _Given a shape point cloud as input, the task of part instance segmentation is to provide several disjoint masks over the entire point cloud, each of which corresponds to
an individual part instance on the object. We adopt the part semantics from the defined segmentation levels in Sec. 5.1. The detected masks should have no overlaps, but they together do not necessarily cover the entire point cloud, as some points may not belong to any part of interests._

4. **proposed part instance segmentation**
    - proposed network with loss:
        - a cross-entropy semantic segmentation loss
        - an IoU loss for mask regression
        - n IoU loss for the unlabeled points 
        -  a prediction-confidence loss
        -  a l2,1-norm regularization term

Notes
---
- Our experiments reveal that **existing algorithms developed for coarse and homogeneous part understanding do not work well on PartNet**:
    - _small and fine-grained parts, e.g. door handles and keyboard buttons, are abundant and present new challenges_ 
    - _many geometrically similar but semantically different parts require more global shape context to distinguish_
    - _understanding the heterogeneous variation of shapes and parts necessitate hierarchical understanding_

- the **criteria used to guide template design**:
    - Well-defined: parts are identifiable by multiple annotators
    - Consistent: Part concepts are shared and reused across different parts, shapes and object categories
    - Compact: no unnecessary part concept, part concepts are reused
    - Hierarchical: Part concepts are organized in a taxonomy to cover both coarse and fine-grained parts
    - Atomic: Leaf nodes in the part taxonomy consist of primitive, non-decomposable shapes
    - Complete: The part taxonomy covers a heterogeneous variety of shapes as completely as possible.

- example of **AND-OR-Graph** in fig.3!

- check **annotation interface** at fig.4!

- **Data preparation**:
    - for evaluation ignore parts that require additional information to identify, such as 
        - glass parts on cabinet doors which requires opacity to identify, and 
        - buttons on microwaves which requires texture or color information to distinguish it. 
    - for evaluation remove infrequent parts due to the lack of data samples.
    - We sample 10000 points from each model with furthest point sampling
    - We use the 3D coordinates as the neural network inputs
    - We split into 70% train, 10% validation, 20% test

- Checked segmentation algorithms:
    - PointNet
    - PointNet++
    - SpiderCNN
    - PointCNN
    
My Questions
---
1. ~~what is our (in OCNN segmentation) algorithm ? is fine-grained semantic segmentation ?~~ yes