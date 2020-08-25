
[Semi-Supervised Co-Analysis of 3D Shape Styles from Projected Lines](https://www.cs.sfu.ca/~haoz/pubs/yu_tog18_style.pdf)

### Goal
achieve style patch localization with only weak supervision

### How
given a collection of 3D shapes over multiple categories and styles

- style co-analysis over projected feature lines of each 3D shape and
- back project the learned style features onto the 3D shapes

pipeline:
- mid-level patch sampling
- pre-selection of candidate style patches
- encode projective features via patch convolution
- multi-view feature integration and style clustering (using PSLF learning)

i.e. check fig.2: multiview patch selection --> convolution --> feature fusing and semi supervised analysis (style clustering with style triplets)

Notes
---
- multi view feature lines = like sketching .. check fig.3

My questions
---
1. ~~how is the style clustering performed and used? it says that it uses info from style triplets..but clustering is generally unsupervised..so i guess the things connected to the clustering (i.e. encoding with convolution) is the one utilizing optimization(learning) from the triplets?~~ from fi10-13 i think this can be unswered by understanding PSLF
2. as i understand from fig4 we sample some patches from each view in each shape (object) .. and then we cluster all of those together into K clusters where any sampled patch can belong (be close to) one of those clusters .. so you can see different shapes of similar styles (related patches) being close together !? ...so... where is the supervision applied !? in fig5 does he mean that after the clusters we do convolution of all clusters with the image and then max pooling and now we have the encoded representation of our object?!
3. in randomly selected patches (fig 8b) do we have some constant patch size that we select?
4. from fig8 .. do we use the annotated patches as predefined kmeans or we use them differently?
5. ~~in fig 9 is it a preference selection of best patches by some users?~~ yes
6. PSLF

