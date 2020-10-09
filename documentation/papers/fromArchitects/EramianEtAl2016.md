Image-based search and retrieval for biface artefacts using features capturing archaelogically significant characteristics
---

### Goal
a search system for archaelogists .. i.e. based on images ... create biface descriptors that can be used for querying similar bifaces..
 

### Related work:
- [21] automatic method for shape extraction from raster images of line drawings
- [32] **classification of thin-shell ceramics based on colour and texture descriptors in order to do vessel reconstruction**
- [26] image segmentation based on active contours and image registration with Fourier–Mellin Transform. similarity based on classic intercorrelation factor

### Image preprocessing
1. isolate the object of interest from the rest of the image
2. images are smoothed with a 5x5 gaussian filter with sigma=0.5 pixels
3. images are converted to the HSV colour space
4. the biface object is segmented by selecting all pixels that have neither minimum nor maximum saturation. This gives accurate segmentation results for almost all bifaces, except for a very few which have very dark or very bright areas on their surface. To address this problem, all holes in the detected foreground regions were filled.

### Similarity metric

Distance between the geometric descriptors of the images is based on absolute difference and distance between texture descriptors is based on chi-square distance.
The distances are normalized based on all the data in the database.


### Descriptors (features)
- shape features (normalized length, normalized ratio etc)
- texture features 
    - like generating binary images based on some thresholds and then taking their fractal dimensions..
    - phase congruency
    - gabor wavelet transform

Notes
---

- [British Archaelogy Data Service](https://archaeologydataservice.ac.uk/)
    e.g. [Victorian baths](https://archaeologydataservice.ac.uk/archives/view/northern1-402011/), [Medieval castle](https://archaeologydataservice.ac.uk/archives/view/sheffieldcastle_uos_2020/), https://archaeologydataservice.ac.uk/archives/view/vindomor1-349214/, https://archaeologydataservice.ac.uk/archives/view/archaeol5-391136/, ... TO BE VIEWED

- "If the blade is heavily worked, meaning much of the stone has had the cortex removed, it gives indication of the advancement of the civilization that created the artefact" .. ia this applied to us ? like some buildings look to have older materials thus from an older era?

- "length and height is important to classify the biface"

- morphology = shape. Size, shape, texture are diagnostic for bifaces.