Analogy-Driven 3D Style Transfer
---
(http://www.chongyangma.com/publications/st/2014_st_preprint.pdf)

### From Abstract, Discussion and Images

##### Goal
apply the style of an exemplar model to a target one 

##### SubGoal
algorithmically distinguish style from structure

##### How
recast style transfer in terms of shape analogies
detect the structural differences between the source and target


- basically you can see figure 6. you find 
    - source-exemplar correspondence and 
    - source-target possible transformations
  and then you calculate an analogy optimization to generate the output


(uses mathematical formulas)


##### Results
better than state of the art

also applied in 'completion task'

### Notes

- fig.8: because the initial mesh is sampled, but the output should be more complete, a transformation that is applied on a sampled mesh triangle is applied also at it's original neighbour triangles


### My Questions

1. did they create the dataset with the targets manually !? by CAD designers ?!
