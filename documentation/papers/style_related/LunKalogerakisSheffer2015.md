[Elements of Style: Learning Perceptual Shape Style Similarity](https://people.cs.umass.edu/~zlun/papers/StyleSimilarity/StyleSimilarity.pdf)
---

### Goal
a structure-transcending style similarity measure (i.e. structure doesn't need to be similar to calculate style similarity)

### How
1. quantifying the geometric properties that make humans perceive geometric elements as similarly shaped and salient in the context of style
2. employ this quantification to detect pairs of matching style related elements on the analyzed 3D models
3. collate the element-level geometric similarity measurements into an object-level style measure consistent with human perception

Notes
---
- from fig.3: element-level style similarity criteria:
    - shape
    - scale (proportions)
    - dominant curve (lines)
    
- in this work style transends function (i.e. a chair and a lamp can have similar style!)

- this work is applied on buildings
    -  presence of similarly shaped, salient, geometric elements, a key indicator of stylistic similarity (e.g. domes, or doors are similar in Byzantine churches)
    - difficulty:
        - we do not know beforehand the number, size, location, area of the style-related elements
        - we dont know how to exactly quantify these elements into similarity features
    - soltuion:
        - based on crowdsourcing similarity labels (object B, object C, both object, neither of them) and machine learning

- the algorithm:
    1. given two input shapes
    2. first identify matching elements (e.g. the handle of the spoon and the handle of the knife)
    3. now compute the style dissimilarity (or distance) of all pairs of matching elements, by:
        - considering geometric features related to element shape, proportions and lines. 
        - Not all pairs of matching elements are equally important. Thus, their distances are weighted according to element saliency, which is also formulated as a function of geometric features. 
        - we add another term measuring the element prevalence. This term penalizes the area in the two shapes that was not covered by any matching elements.
            - this term measures the percentage of the area not covered on each model(shape) weighted by its saliency and weighted with a penalty parameter

- the matching elements detection:
    1. we first segment the input shapes into approximately convex patches at multiple scales
    ![](../../figures/convexpatchesmultiplescales.png)
    2. then we examine similarity between the pairs of patches by 
        - approximately aligning the two patches with an affine transformation
        - evaluate now the distance using a weighted combination of some distances like
            - point to point distance
            - curvature histogram distance
          The weights are learned from crowdsource data.
          ![](../../figures/weighted_elementary_distances.png)
    3. pairs of patches that have high similarity are grouped (use of min-cut problem)
      _**note**: this similarity measure is also used in the main algorithm to specify similarity of elements. The difference is that at that point we weight that measure by the saliency of the elements. Precisely, the element saliency is calculated from a weighted saliency of different features like curvature and ambient occlusion, and these weights are also learned from crowdsource. _
      
- overall the parameters to be learned are:
    - the element-similarity weights
    - the saliency weights
    - the prevalence penalty
  ![](../../figures/parameterslearning.png)
  
- We regularize the L1 norm of the weights to help us discover the most relevant geometric features for style.

- data:
    - more than 50K responses
    - more than 2.5K participants
    - 7 categories (buildings, furniture, lamps, columns, cutlery, coffee set, dishes)
    - 1000 shapes

-  If the participants were NOT consistent in picking responses to the given style similarity comparisons we provided to them then it would not make any sense to develop a style similarity measure in general. Our participants were 85% consistent (agree on style similarity decision). 

- Doing a 10-fold cross validation our measure is 89% consistent (agree on style similarity decision with the users' pluarility response).


Previous work
---
They tried to find similar objects by finding similar structures. Thus they could not compare style similarity of shapes with large structural
differences, and were limited to categorizing shapes into sub-groups within a particular class e.g., wall clock or hand clock.

Their Buildings Data
---
238 buildings
1000 triplets

My questions
---
1. in fig2 what is Delement(saliency x distance) and what is Dprevalence?
2. ~~in their ply objects there are non ascii data.~~ Indeed, the header is written as text but the numbers are transformed in binary.
