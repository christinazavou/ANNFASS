Feature-extraction methods for historical manuscript dating based on
writing style development
---

### Goal

detect date of manuscript

### How

- extract handwritting styles using feature extraction techniques
- a self organizing time map is used as a codebook
- support vector regression is used to estimate a date based on the vector of a manuscript

### Data
- the most recent digitized images of the DSS collection (Photographed the scrolls using 28 different spectral bands of light, at a resolution of 1,215 pixels per inch. In addition to the original scroll fragments, the photos may contain color calibrators, plate number-tags, scale bars, and adhesion tapes)
- Most of them were written on parchment, and the rest were written on papyrus

- considered only periods with sufficient data:
Archaic, early-Hasmonean, Hasmonean, late-Hasmonean,
early-Herodian, Herodian, late-Herodian, and post-Herodian.

### Preprocessing

- binarization: each pixel is thresholded to either a background (white) pixel or a foreground (black) pixel. BiNet is used for binarization. (a deeplearning-based method derived from the general shape of UNet)

### Feature Extraction Techniques

**The methodology is based on the idea that the handwriting style of the general population evolves over time. By capturing this change over time, the general style of each period can be determined. Then, an inference on a manuscript’s date can be made by comparing its handwriting style to the general styles of the periods.**

#### Textural based
Capture statistical information on attributes of handwriting, like the curvature and slant(slope) of the contours. As these methods look at the image as a whole, they do not require a segmentation technique.

- Hinge
  ```
  Calculate the joint probability distribution of the angle combination of two hinged edge fragments.
  This can be extended in more features.
  ```
- CoHinge: ```joint distribution on two different points with distance l..```
- QuadHinge: ```incorporates curvature info of the contour fragments in hinge kernel```
- DeltaHinge: ```rotation invariant feature```
- QuillHinge
- Triple chain code


#### Grapheme based

Aims to extract the individual graphemes of the handwritting

- COnnected COmponenets COntour (C0^3)

  ```
  i.e. contours obtained from each connected component (these represent graphemes)
  Then they create a statistical distribution of the graphemes by using bag-of-words approach. (This is the codebook)
  ```
 
### To train the codebook, they use:

- KMeans clustering or
- Self Organizing Map

  (i.e. not using the known temporal information of the input)

- Self Organizing Time Map (SOTM): train a sub-codebook for every time period

  (i.e. using the known temporal information of the input)

**The initial sub-codebook D1 is randomly initialized and trained using a SOM and only characters from y(1), the Archaic time period. Then, sub-sequential codebooks are trained using the previous codebook Dt−1 as initialization for the SOM and characters from the time period in y(t) as training data. The final codebook is the combination of all the sub-codebooks: D = {D1,D2, . . .,Dt, . . .D7}**

**In order to determine the feature vector for a document, a histogram is built by mapping each extracted grapheme to the most similar element in the codebook using the Euclidean distance measure.**

_(this would be interesting approach for us as well !? i.e. only for component-wise learning)_

**The final step of the model is to determine the date using the calculated feature vector. Regression is more suitable than classification since the documents were written over a continuous period. However, before we decide, we need to check what labeled data we have. Few manuscripts have a year and the rest have a period. However the periods are not big, so if we use their center as the year we dont introduce a big error. Thus we do regression. To train they use SVM**

_(we should use classification)_

### Evaluation
Mean Absolute Error and Cumulative Score


### Notes
- in estimating date of manuscript the paleographers consider
    - the writing style
    - the contents
    - the writing materials
  _(similarly for us: the style of building, the type of building, the building materials)_
   
- contrasting opinions for an estimated data are always on the table
  _(like for us)_
  
- The handwriting style of an individual changes over his/her lifetime, causing slight variations in the way the characters are written by the same individual.
  The general script style also changes over a long period
  _(like for us the buildings are hybrid and the styles are not clear)_
  
- **a script-style evolution map can be generated for the known (dated) data.**

**- some datasets:**
    - digitized sources of the DSS with > 2K images
    - Medieval Palaeographic Scale data set with medieval charters in 1300-1550CE
    - Svenskt Diplomatariums huvudkartotek (SDHK) containing  medieval charters
    
- some approaches:
    - A neural-network-based approach that extracts the handwriting style in the hidden layers and determines the date in the final layer. (using Google books corpus written between 1500 and 1900). Combined with a text-based approach achieves better results.

  
My Questions
---
- "The final codebook is the combination of all the sub-codebooks: D = {D1,D2, . . .,Dt, . . .D7} ... In order to determine the feature vector for a document, a histogram is built by mapping each extracted grapheme to the most similar element in the codebook using the Euclidean distance measure." ... does it mean that he takes the closest element from all of D1,...,D7 or one from each?
- if not grapheme-based then the codebook is just result of clustering the manuscripts represented as vectors based on the textural features?
