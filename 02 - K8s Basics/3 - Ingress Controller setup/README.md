Here, we will setup an ingress controller for any existing service (say, `kubernetes-dashboard` by `minikube`)

Rules for creating TLS/Secret for HTTPS connection:
- Keys should be exactly tls.crt and tls.key
- Value should be actual file content, not paths
- Secret must be in the same namespace as the Ingress object

Uses of Ingress Controller:

- When you don't want to expose any of the K8s component (LB).
- A Separate Ingress controller will route the traffic based on ingress rules to the specific services.
- Setup routes to different services based on paths or sub-domains.


Reference: https://youtu.be/X48VuDVv0do?si=EyR96W-324SroVxs&t=8178