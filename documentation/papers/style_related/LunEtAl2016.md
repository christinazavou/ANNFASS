Functionality Preserving Shape Style Transfer
---
(https://people.cs.umass.edu/~zlun/papers/StyleTransfer/StyleTransfer.pdf)

### From Abstract, Discussion and Images

##### Task
algorithmic synthesis of 3D models 

generation of man-made shapes with 
- user-specified style described by an exemplar shape
- functionality encoded by a functionality target shape

##### Goal
transfer the style of the exemplar to the target

##### Challenges in performing cross-functional style transfer
implicitly separate an object's style from its function

##### Keys
- salient geometric elements can be an indication of stylistic similarity between 3D shapes

##### How
allow compatible operations (don't affect target functionality) and 
introduce a cross-structural element _**compatibility metric**_ that estimates the impact of each operation on the edited shape

they trained the metric on databasess of 3D objects
they evaluated the framework on furniture,light fixtures, tableware,.. & did user studies to ask about the generated objects'style and function

##### Result

"Key to our success is a novel, learned metric designed to assess element compatibility across shapes with different structure and function."

##### Future Work
1. as input for style use sketches
2. as input for style use natural language

### My Questions
1. in fig.2 what are the functionality constraints? how are they modeled?

2. in fig.4 how is part compatibility done?

3. i dont get fig5

4. in fig.7 who made that segmentation?



