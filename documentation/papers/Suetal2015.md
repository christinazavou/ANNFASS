Multi-view Convolutional Neural Networks for 3D Shape Recognition
---
(**MVCNN**)
(Multi-view Convolutional Neural Networks for 3D Shape Recognition)

### From Abstract, Conclusion and Images

##### Question:
representation of 3D shapes for recognition.. should be with descriptors operating on their
native 3D formats (e.g. voxel grid, polygon mesh) or
 with view-based descriptors?
 
##### Approach
recognize 3D shapes from a collection of their (3d shapes) rendered views on 2D images

first they show that with a cnn and an image as input (with the object in any view) we can recognize a 3d object with better accuracy than methods of recognition on 3D shape descriptors (like mesh)

they also show that recognition (especially in retrieval) becomes better when we feed the cnn with multiple views instead of one

##### Notes:
- they used ModelNet40
- fig.3: **the saliency maps are computed by back-propagating the gradients of the class score onto the image via the view-pooling layer.**

##### Future work research questions (might be already done)
1.  experiment with different combinations of
2D views. Which views are most informative? How many
views are necessary for a given level of accuracy? Can informative views be selected on the fly?
2.  can our view aggregating techniques be used for building compact and discriminative descriptors for real-world 3D objects from multiple views, or automatically from video, rather than merely
for 3D polygon mesh models.

###### My questions
- in abstract..what does it mean 'recognition rates increase'? does he want to say retrival is increased and for retrieval we classify many and so the speed and the percentage classified are better?
- how is retrieval done?



