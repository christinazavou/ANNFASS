Learning Style CompatibilityBetween Objects in a Real-World 3D Asset Database
---
(https://onlinelibrary.wiley.com/doi/epdf/10.1111/cgf.13879)

### From Abstract, Discussion and Images

##### Task
given a query object, find other objects with same style 

##### data
121 3D asset packages containing 4K 3D objects from the Unity Asset Store

##### How
scalable, learning-based approach, for use with real-world 3D asset databases

_**They synthesize training labels for metric learning that work as well as human labels.**_

The NN analyzes the in-engine rendered appearance of an object (combining geometry, material and texture)

##### Conclusion


### Notes

- they used triplet network to model embeddings similarity

- four object categories used in experiments: furniture, vegetation, trees, vehicles. 

- the input for one 3D shape is a 7-channel image (RGB,normals,depth) - fig.4

- _**from table 4: Using No Texture or No Material introduces more failures in retrieving  similar objects or distinguish dissimilar ones**_ (note that including texture or material is included in the 7-channel image representation)

##### Results
they can generate as many labels as the available 3D assets

### My Questions
1. ~~in abstract they say 'method analyzes in-engine rendered ..' ... is it images as input or something else?~~ ~~from fig.2 i understand that input is an image because is given to VGG16.correct?~~ ~~yes. as seen in fig.4~~

2. ~~what are the style labels in fig.3?~~ or i guess there are no style labels, but just compatible styles and non compatible styles in each input triplet. right?

