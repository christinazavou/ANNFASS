
[Semi-Supervised Co-Analysis of 3D Shape Styles from Projected Lines](https://www.cs.sfu.ca/~haoz/pubs/yu_tog18_style.pdf)

### Goal
achieve style patch localization with only weak supervision

### How
given a collection of 3D shapes over multiple categories and styles

- style co-analysis over projected feature lines of each 3D shape and
- back project the learned style features onto the 3D shapes

pipeline (fig.2):
 1. mid-level patch sampling and pre-selection of candidate style patches
 2. encode projective features via patch convolution
 3. multi-view feature fusion and style clustering under the PSLF framework (Partially Shared Latent Factor learning) which selects the final style patches from the candidates

### Result
as you see in fig1 given a collection of many objects the method can cluster them into similar style objects and highlight their stylistic patches

#### PSLF:
**PSLF is essentially a dimensionality reduction technique** that is realized through a non-negative matrix factorization (NMF).

#### Mid-level patches:
- neither too local nor too global
- While unsupervised approaches typically perform the analysis purely at the patch level, weakly supervised approaches typically detect mid-level patches or compute patch clusterings to attain maximal adherence to the image or object labels

#### Convolutional activational features:
We use the discriminatively detected mid-level patches as filters to perform feature encoding based on a sliding-window convolutional operation. We use these features as per-view initial features and **conduct multi-view feature fusion and selection via PSLF**.

#### The difference with the other deep-learning approaches:
- they have labels of similarity and they just learn an encoding and the similarity metric .. we learn to spatially locate style patches.
- they focus on style-driven shape retrieval, trying to learn a specialized shape similarity ... we face **style classification/clustering** and **style patch extraction**
- they adapt metric learning to learn a global style metric...we adapt PSLF clustering to help us select and locate style feature patches

#### Multi-view feature lines:
- render the object from 12 virtual cameras (with 30 degrees rotation each and elevation of 30 degrees from the ground pointing towards the center of the shape)
- extract 
    - suggestive contours and
    - dihedral angle based feature lines 
- leading to 200x200 image

#### Patch sampling and pre-selection:
1. we first randomly sample a set of points on each shape (For a 200×200 image, we extract about 30 patches, where the patch size is chosen experimentally)
2. for each sample point and each view in which this point is visible, a patch is generated as the window centered at the projection of the point. 
3. We then perform k-means clustering to extract a set of representatives as the cluster center (In practice, we extract 50 representative patches for each view)

#### Per view feature encoding:
- for each feature line image:
    
    - for each sub-image:
        
        extract a feature map from a patch convolution where the convolution kernel is the pre-selected mid-level patch (**These feature maps are not learned using a convolutional neural network, but extracted by directly applying the convolution operations over input images.** We also divide the input image in 4 and apply same convolution in each 4 sub images for scale invariance..then we do max pooling!..)
        
        therefore we have multi-scale features (by concatenating the feature vectors of all convolution filters, we have a 5K-dimensional feature vector for K mid-level patches)

#### Multi-view feature integration (fusion):
We have a feature vector for each view of a given shape. We perform multi-view feature fusion to extract a **new feature for the shape**. This feature **uses information from jointly analyzing a set of shapes**. To do this we use PSLF, which is a clustering method coupled with multi-view feature integration.

**PSLF** employs **non-negative matrix factorization (NMF)** to learn a compact yet comprehensive partially shared latent representation.... Essentially, PSLF learns the fused feature matrix V and the basis matrix U, while tuning the weights of different views, all in **an unsupervised manner, by minimizing the reconstruction error** with respect to the input features...The projection of the fused features over the basis leads to a clustering of input features. 

use of PSLF:
 - separates input multi-view features into 
    - parts which are shared by multiple views and 
    - those which are distinct to a specific view
 
 => the final multi-view feature is compact and comprehensive, encoding both shared and distinct information in different views
 
#### Unsupervised and semi-supervised style analysis:
**Based on the clustering result, we re-select the representative mid-level patches to learn more and more discriminative ones with respect to the evolving style clusters.** This will in turn update the feature encoding in the next iteration. Such cluster-and-select process iterates until the clusters and patches become stable.

if we want to use semi-supervised process:
    - either use user-prescribed style labels on a small portion of the shape collection
    - or triplets of shapes indicating their style similarity
 
**Finally, we backproject the learned discriminative patches from projective space to surfaces of the input 3D shapes to extract and visualize the style patches over these 3D shapes.**

Adjusting clustering for semi-supervised clustering:
1. Label-constrained style clustering:
    we need to adjust the objective function of NMF
2. Triplet-constrained style clustering:
    we need to adjust the objective function of NMF
Unsupervised style clustering:
1. Having computed the fused feature matrix with NMF we just use the self-tuning spectral clustering..  

Directly clustering the fused features may not generate the optimal results since the per-view features, computed with random patches, may not be the most relevant. To this end, we devise an iterative algorithm that interleaves clustering and cluster-guided patch re-selection. Such iterative cluster improvement can be performed either in semi-supervised analysis or unsupervised analysis.

#### Cluster-guided style patch selecting:
Based on the PSLF clustering results, we re-select discriminant mid-level patches for each view, to be those which are frequent only within one cluster.

#### Style patch extraction on shape surfaces:
We can backproject the **final selected 2D patches** onto the initial 3D surfaces, by keeping the location information when we go from 3D to 2D. The issue here is that the final style patches are selected from only a few 3D shapes .. thus to locate the style patches on other shapes we need to compare them against all patches sampled in those shapes and take the most similar based on the HOG features (i.e. the representation)

#### Style analysis results and evaluation:
Since it is difficult to collect consistent ground truth data for style patches, we instead conduct a user study where human participants are asked to judge the results produced by our algorithm.

For style clustering with style labels set up, we evaluate our results using the standard clustering purity measure: 
    
    C = clusters
    L = ground truth clusters
    
    P(c,l) = |c intersection l| / |c|

    p(C,L) = average of weighted purities..

Notes
---
- multi view feature lines = like sketching .. check fig.3
- style analysis is essentially a grouping problem, while style patch extraction is discriminative feature selection problem
- in the data they use there are buildings as well. "Buildings are labeled based on their geographic-temporal styles such as Gothic, Greek, Byzantine, and Asian"
- "Our core analysis problem consists of a clustering of the input shape collection and a selection of style feature patches from the shapes which accentuate the shape clustering."
- "feature lines are remarkably efficient at conveying shape and meaning while reducing visual clutter"
- feature lines are detected in 3D object space based on geometry analysis .. and then projected in each view! in this way they are more reliable than lines extracted from rendered images of each view which could be influenced by illumination and viewing artifacts!
- **"To support both unsupervised and semi-supervised style analysis, we develop a constrained formulation of PSLF which accepts both user-specified shape style labels and style-ranked triplets as classical metric learning"**
- this method takes a 3D object and makes 2D line projections of different angled-views.
- "In multi-view learning, the goal is to discover consistent and complementary information among multiple views of the data, with both types of information supporting the concept. Specifically, consistent information should be shared across most views in identifying the concept, while complementary information is something that is distinctively reflected from one or few views and complementary to other such information."  (todo: move this to general knowledge)
- "In our work, the concept to learn is shape styles and the multiple views are provided by the multi-projection feature lines of the 3D shapes. Decorative shape styles may be shared consistently across multiple views, e.g., stylistic details over the surface of a sofa. They can be also exclusive to one or few views to complement other style features such as an emblem on top of a bed’s headboard. As a result, our style analysis problem is well-suited for a multi-view learning approach."
- parameters in section 5


My questions
---
1. ~~how is the style clustering performed and used? it says that it uses info from style triplets..but clustering is generally unsupervised..so i guess the things connected to the clustering (i.e. encoding with convolution) is the one utilizing optimization(learning) from the triplets?~~ ~~from fi10-13 i think this can be unswered by understanding PSLF~~ indeed, PSFL selects the most distinctive mid-level patches which make the best clustering (look at [supervised and semi-supervised style analysis:](#unsupervised-and-semi-supervised-style-analysis)). In fact in unsupervised we iterate using metrics that specify how good the cluster is .. in semi-supervised we use additionally human labels ..
2. as i understand from fig4 we sample some patches from each view in each shape (object) .. and then we cluster all of those together into K clusters where any sampled patch can belong (be close to) one of those clusters .. so you can see different shapes of similar styles (related patches) being close together !? ...so... where is the supervision applied !? in fig5 does he mean that after the clusters we do convolution of all clusters with the image and then max pooling and now we have the encoded representation of our object?!
3. ~~in randomly selected patches (fig 8b) do we have some constant patch size that we select?~~ For a 200×200 image, we extract about 30 patches, where the patch size is chosen experimentally
4. ~~from fig8 .. do we use the annotated patches as predefined kmeans or we use them differently?~~ we use them differently. Actually these annotations are just for evaluation, and other labels we have are used during the semi-supervised clustering.
5. ~~in fig 9 is it a preference selection of best patches by some users?~~ yes
6. ~~PSLF~~
7. how are the buildings in their data look like? is all color info removed? they say they learn what makes a bulding Gothic/Greek and where the style regions are!
8. ~~how can i get feature lines from a 3D shape e.g. a .obj or .ply ?~~ explained in [Multi-view feature lines:](#multi-view-feature-lines):
9. ~~how is the backprojection done actually? is it just convolution and visualization of maximum activations?~~ it is just keeping locations of patches as explained in [Style patch extraction on shape surfaces:](#style-patch-extraction-on-shape-surfaces)
10. ~~the "back-projected features" is just to show where we detect similar style patches, right?~~ yes
11. in fig2c, the supervision box is showing a triplet i.e. triplet loss ??
12. ~~how are the mid-level-patches-that-should-show-some-style detected?~~ look at [Patch sampling and pre-selection](#patch-sampling-and-pre-selection) Ok. but how do i know these patches preserve style?
13. ~~what does the convolution of a patch with a feature line (contour image) show me? does it show high activation values in case the patch and the contour image match , so by using many images and many patches i give more importance to the ones that appear a lot and are discriminative and using feature-selection-over-many-shapes(PSLF) the important patches can be selected !?~~ **looks like yes .. and because of the iteration and evaluation of the clusters we can select more meaningful patches (while at the beginning they are random) .. however, how do i know in the case of unsupervised clustering that the patches i select are not patches showing structure? i.e. how are my cluster metrics incorporate style evaluation to ensure style patches are picked?**
14. the separation of common and special features from PSLF (fig2c) is something that comes with PSLF method or a functionality they specifically added in a way?
15. ~~in the iteration process how do we define that the clusters became stable?~~ i think by convergence of the cluster metrics 
16. is PSLF doing feature selection or does it create latent features? can i see selected stylistic patches in either way because we just pick all patches selected in the last iteration (best trained checkpoint) ?
