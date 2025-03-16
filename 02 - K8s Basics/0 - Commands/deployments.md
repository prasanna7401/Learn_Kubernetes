1. Create a deployment (Fast way)
'''sh
kubectl create deployment --image=nginx nginx
'''

2. Generate Deployment YAML file (-o yaml). Don't create it(--dry-run)

'''sh
kubectl create deployment --image=nginx nginx --dry-run=client -o yaml
'''

3. Generate Deployment YAML file (-o yaml). Don’t create it(–dry-run) and save it to a file.

'''sh
kubectl create deployment --image=nginx nginx --dry-run=client -o yaml > nginx-deployment.yaml
'''

4. Make necessary changes to the file (for example, adding more replicas) and then create the deployment.

'''sh
kubectl create -f nginx-deployment.yaml
'''

or 

'''sh
kubectl create deployment --image=nginx nginx --replicas=4 --dry-run=client -o yaml > nginx-deployment.yaml
'''