Front-end: Mongo-express (Web-based MongoDB admin interface)
Back-end: Mongo

Architecture:
![alt text](../../.github/screenshots/2%20-%20k8s%20basics/mongodbexpress-arch.png)

To generate base64 encoded value for credentials:  `echo -n 'your-word' | base64` 

Note:
1. Dependencies (Secret, ConfigMap, etc.) must be created before deployment
2. In Minikube, external service will not automatically get an external IP (it will be _pending_). To solve this, run `minikube service <service_name>`
    ![image](../../.github/screenshots/2%20-%20k8s%20basics/start%20service.png)
    ![image](../../.github/screenshots/2%20-%20k8s%20basics/express-server.png)
3. The default username:password for accessing the mongo-express server is `admin:pass`

### kubectl apply commands in order
    
    kubectl apply -f mongo-secret.yaml
    kubectl apply -f mongo.yaml
    kubectl apply -f mongo-configmap.yaml 
    kubectl apply -f mongo-express.yaml

### kubectl get commands

    kubectl get pod
    kubectl get pod --watch
    kubectl get pod -o wide
    kubectl get service
    kubectl get secret
    kubectl get all | grep mongodb

### kubectl debugging commands

    kubectl describe pod mongodb-deployment-xxxxxx
    kubectl describe service mongodb-service
    kubectl logs mongo-express-xxxxxx

### give a URL to external service in minikube

    minikube service mongo-express-service

References: 
- [Kubernetes - Full Course in 4hrs | Youtube](https://youtu.be/X48VuDVv0do?si=HxhZbLm4fY2l7L-P&t=4649)
- hub.docker.com/_/mongo
- https://hub.docker.com/_/mongo-express