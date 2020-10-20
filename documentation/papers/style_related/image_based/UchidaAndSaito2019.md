Stylized line-drawing of 3D models using CNN with line property encoding 
---

 drawing non-constant intensity lines is still an open problem. We propose a novel method of determining the intensities point by point on a line with the sequential process by the two convolutional neural networks (CNNs).
 Transforming the first CNN’s output to three encoded property images as the in- put of the second CNN makes the second one work effectively
 
Related work: 
silhouette line [5] ,
ridge and valley [7,20] 
suggestive contour [17,19] 
apparent ridge [21] 
photic extremum line [24] 
demarcating curve [25] 
Laplacian line [27]
These work do not focus on how to draw each line; the results consist of constant lines, far from non-constant stylized lines we are aiming

Method:
1. generate a line image from the depth and normal images of a 3D model by the first CNN (Net1);
    - same structure as in Maeda and Saito [29]
    - supervised (HOW DO THEY OBTAINED LABELS?)
2. construct lines from the line image and encode three line prop- erties to images; 
    - used the line detection method [46]. It detects lines as polylines, which consist of points on the line. Each point of the detected polyline has a coordinate, a normal angle, and a width on the point. Since the detected polylines often have wrong connections, they are separated at junction points once and connected correctly based on distance and angles of their end points...this is quite empirical.
    - images extracted:
        - line length image (bigger line is brighter)
        - internal position image (points that are further away from their closest line end -using arc length- are brighter)
        - junction distance image (points closer -using arc length- to junctions of lines are brighter)
    - in other words some features that are important in drawing stylistic line with various thickness is: length of line, start/end of line, areas with connecting lines... e.g. a line end that connects to a junction might be drawn strongly by the terminal, while a line end that does not intersect to other lines might be tapered.
3. generate an image with a non-uniform line thickness from images used in step 1 and two additional line property images produced in step 2 by the second CNN (Net2); (SUPERVISED??)
    - Net2 is also constructed by a fully-convolutional architecture.
    note: the receptive field for an output neuron in the network using fully- connected layers is the entire input.
    note: Determining line intensities is a problem that depends on global information.
    note: When adopting fully- convolutional neural networks, choosing an appropriate size for the receptive field is important. In general, the larger the receptive area is, the more diverse the input is. It causes difficulty in prepar- ing the training data. However, merely adopting a small receptive field as input cannot grasp a wide range of information. (SO WHAT DO THEY DO???)
    - The input of Net2 is an image that consists of two channels generated in Step 2 and four channels used by Net1.
    - The output is an image of lines which have varying thickness. If we set line intensity directly from pixel values of an image, the color in this case, it is a regression problem. A regression problem to determine each pixel value is more difficult than a binary classification problem for each pixel. Therefore, we set our problem as a binary classification of whether each pixel is on a line or not.
4. extract intensity at points on lines from the line thicknesses; 
    - the line width w_{detected,j} at the point p_j on the line is smoothed by convolution with gaussian kernel. local intensity i_j is found as normalized w_j
5. construct lines from the image and determine line properties; 
    - The determined local intensities are used to control the draw- ing style of the resultant line drawing. 
    - One intensity can generate different line properties and produce various styles.
6. control line style property by the intensity and generate a styl- ized line image.


Training data:
- The target images of Net1 were drawn manually with a 2-pixel line width by tracing on the edges of a normal image and a depth image.
- The target images for Net2 were drawn according to the follow- ing rules: lines are drawn only on the edges of normal and depth images; lines have a minimum of 2-pixel and a maximum of 4- pixel width; the width becomes thicker at large curvatures; the width becomes minimum at the endpoints, where it does not connect to other lines; and the width varies continuously.
- The images are augmented by flip and rotate operation as in the existing methods.
- For training Net1 and Net2, 128 ×128 patches are cropped from the training dataset. The cropping areas are selected randomly as candidates and then picked only if there is an object in the cen- ter of the area


Evaluation:
We measured recall and precision by defining the line ridge pixels as “true“ and other pixels as “false”. For the evaluation, we relaxed the judgment as pixels on a line by expanding the line pixel area by one pixel;
4-fold cross-validations.


My questions:
- ~~only these data? why? how do you know it's sufficient to apply on other data? did they use some categories as test and had good performance?~~"We have chosen five 3D models which have different features to make the networks robust. For example, the features are organic and inor- ganic, round and straight, or dense and sparse." "Although the number of original data is 36, the actual number of training dataset is much larger than that. This is because various patches are cropped from one image.""The precision and recall of line detection by Net1 were 0.952474 and 0.930050, respectively." "The precision and re- call of line detection by Net2 were 0.996043 and 0.991896, respec- tively."
- why used patches for training??
