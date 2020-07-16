Co-Locating Style-Defining Elements on 3D Shapes
---
(https://vcc.tech/file/upload_file//0/58//weboem_informations/style.pdf)

### From Abstract, Discussion and Images

##### Goal
co-locate style-defining elements over a set of 3D shapes

translate high-level style descriptions (e.g. chineese, european) for furniture models into _**explicit and localized regions over the geometric models**_ that characterize each style.

##### How
- for each style:
    - set of style-defining elements:
        - union of all elements able to discriminate the style
        
1. given: input set of 3D shapes among many categories and styles
2. the 3D shapes are grouped according to their style labels
3. they perform a cross-category co-analysis of the shape set to learn and spatially locate a set of defining elements for each style
    a. sample a large number of candidate geometric elements
    b. iteratively apply feature selection to extract style-discriminating elements until no additional elements can be found

##### Result
They demonstrate that the co-location of style-defining elements allows to solve problems like style classification and is useful for: style revealing view selection, style-aware sampling, style-driven modeling for 3D shapes.

### Interesting
- see in fig.12 in Building shapes it's the most confusing style elements...i.e. elements of style 'european' can appear in buildings that are of style 'chineese' etc

### My Questions
1. is the goal to clusterize the 3D objects according to their style ?
2. look again at fig3
3. in fig5: how are the small elements found? what are the features used and what method as similarity ? i guess in b) the location is a feature and in c) is not!?
4. i dont understand fig.6...why are all vectors same ???
5. as i understood from fig7 the metric to get the style is using histograms comparison of the object under examination versus the overall stylistic category histogram!?
6. from fig.8...do we use a NN that's why we need positive and negative examples? do we train a NN for each class(style) ? are the elements just random small pieces with the label of the object's style?
7. in fig.12 how did they found (compare) that some elements of one style exist in shapes of other styles?



