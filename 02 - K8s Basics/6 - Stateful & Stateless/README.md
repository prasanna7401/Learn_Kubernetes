Notes:
- `Deployment` for stateless; `Statefulset` for stateful applications.
- But why?
    - `Deployment` can replicate pods easily, can setup one LB to load balance between all replicas, pods can be created in any order with any random name (random-hashes), all are identical and interchangable, etc.
    - While stateful applications, they cannot be created/deleted at same time, cannot be randomly addressed (replica pods are not identical, as each has their own pod identity). These get fixed-order names. (Master: my-app-0, Replica: my-app-1, my-app-2,...)
    - Stateful pod replicas are created in order, so if the previous one is failed or waiting, the next one won't be created.
    - These pods also get their own dedicated DNS name (fixed format). Although the attached IP may change when a pod dies and gets recreated, they get same identity and DNS name.
    - But why do they need an identity? In distributed database systems, there can be a maximum of one write, and multiple read from all replicas (Master-original, Worker-replica: Not all pods are same). Also, they do not use the same physical storage. This pod identity helps in reattaching the PV when a dead pod is replaced by a new one in the same place.

Reference:
- https://youtu.be/X48VuDVv0do?si=uUyGC5wwVxZ-iDXp&t=11234