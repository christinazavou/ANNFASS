![](../../figures/aap1.png)
![](../../figures/aap2.png)

[What is a polygon mesh?](https://conceptartempire.com/polygon-mesh/)

![](../../figures/aap3.png)
![](../../figures/aap4.png)
![](../../figures/aap5.png)
![](../../figures/aap6.png)
![](../../figures/aap7.png)
![](../../figures/aap8.png)


What should be stored?

  - Geometry: 3D coordinates
  - Attributes
    - e.g. normal, color, texture coordinate
    - Per vertex, per face, per edge
  - Connectivity
    - What is adjacent to what

What should it support?
  - Rendering
  - Queries
    - What are the vertices of face #3?
    - Is vertex #6 adjacent to vertex #12?
    - Which faces are adjacent to face #7?
  - Modifications
    - Remove/add a vertex/face
    - Vertex split, edge collapse
