### Note
**Persistent Volumes:**
- The attributes in the yaml file are specific to each storage type. 
- Volumes cannot be placed inside a namespace.
- DO NOT use local volumes for persistent storage for databases, as they tie to a specific node, and it may not survive cluster crashes.

**Persistent Volume Claim**
- `PersistentVolumeClaim` is used by an application to claim the use of a persistent volume. This must be in the same namespace as the pod using the claim.

**Special local volumes**
- You can also use `ConfigMap`, or `Secret` as these are a type of local volumes managed by K8s.

**Storage Class**
- Allocate/Provision persistent volumes dynamically, whenever a PVC claims it.

Reference: 
- https://gitlab.com/nanuchi/youtube-tutorial-series/-/tree/master/kubernetes-volumes
- Refer to the [documentation](https://kubernetes.io/docs/concepts/storage/volumes/) to view all supported volume types, and for more info.
- https://youtu.be/X48VuDVv0do?si=VfKwY1XSWYBAP1rc&t=10129