[Reference](https://kubernetes.io/docs/tasks/administer-cluster/kubeadm/kubeadm-upgrade/)

Details:
- Upgrade Master node first & then proceed to workers
- In each node, upgrade kubeadm first, and then kubectl and kubelet

**Master node upgrade**:
```sh
# To modify remote package source
echo "deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.32/deb/ /" | sudo tee /etc/apt/sources.list.d/kubernetes.list
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.32/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg

sudo kubectl drain controlplane --ignore-daemonsets

# Find latest supported versions
apt update
apt-cache madison kubeadm

# Upgrade KUBEADM
sudo apt-mark unhold kubeadm && sudo apt-get update && sudo apt-get install -y kubeadm='1.32.x-*' && sudo apt-mark hold kubeadm
kubeadm upgrade plan
kubeadm upgrade apply v1.32.x

# Upgrade KUBECTL & KUBELET
sudo apt-mark unhold kubelet kubectl && \
sudo apt-get update && sudo apt-get install -y kubelet='1.32.x-*' kubectl='1.32.x-*' && \
sudo apt-mark hold kubelet kubectl

# Restart kubelet service
sudo systemctl daemon-reload
sudo systemctl restart kubelet

kubectl uncordon controlplane # make it schedulable
```

**Worker node upgrade** (for linux):

```sh
kubectl drain node01 --ignore-daemonsets

ssh node01

# Update remote package source
echo "deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.32/deb/ /" | sudo tee /etc/apt/sources.list.d/kubernetes.list
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.32/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg

# Upgrade KUBEADM
sudo apt-mark unhold kubeadm && \
sudo apt-get update && sudo apt-get install -y kubeadm='1.32.x-*' && \
sudo apt-mark hold kubeadm

# Upgrade KUBECTL & KUBELET
sudo apt-mark unhold kubelet kubectl && \
sudo apt-get update && sudo apt-get install -y kubelet='1.32.x-*' kubectl='1.32.x-*' && \
sudo apt-mark hold kubelet kubectl

# Restart kubelet service
sudo systemctl daemon-reload
sudo systemctl restart kubelet

kubectl uncordon node01
```