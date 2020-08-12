[Adaptive O-CNN: A Patch-based Deep Representation of 3D Shapes](https://wang-ps.github.io/AO-CNN_files/AOCNN.pdf)
---

#### input
planar patch normal and displacement

#### process
encoder: ```3D convolutions only at the octants at each level```

decoder: 
```
1. infers the shape occupancy and subdivision status of octants at each level 
2. estimates the best plane normal and displacement for each leaf octant
```


Notes
- from table 1 we see that OCNN classification is using less than 1GB memory for representation of 32^3 (depth 5) with batch size 32 thus my machine is indeed able to run it.
- other baselines for shape reconstruction: PSG and AtlasNet
- from fig9 we see that AOCNN generates patches that are orientation-persistent:)

My questions
---
1. ~~what is "planar patch normal"?~~patches of rectangular (planes) shapes ... to cover up a shape! (you can see the octree2mesh generating a mesh that is basically rectangular shapes of different sizes covering up the object's shape)
2. as i understand from fig.3 the difference of OCNN and AOCNN is that we dont just go until max depth wherever our object(occupancy map) is , but we decide on each point/segment of the object(occupancy map) whether to go deeper or not. On what condition is the decision made ? Also, i dont see any difference between middle and right picture.
3. from fig4 i see the encoder having skip_connections ... are these the ones referred in the code (where there is flag to use skip_connections or not) !?
4. in fig5 what is Lstruct and Lpatch ? what is the corresponding code?
