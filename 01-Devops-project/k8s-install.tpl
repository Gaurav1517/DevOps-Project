#!/bin/bash

# Configure Kubernetes server

# Install Docker
# REF: https://docs.aws.amazon.com/eks/latest/userguide/install-kubectl.html
sudo yum update -y
sudo yum install -y docker
sudo systemctl start docker
sudo systemctl enable docker
sudo chmod 777 /var/run/docker.sock

# Install Kubernetes components
# REF: https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm/
sudo setenforce 0
sudo sed -i 's/^SELINUX=enforcing/SELINUX=permissive/' /etc/selinux/config

# Add Kubernetes repository
cat <<EOF | sudo tee /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://pkgs.k8s.io/core:/stable:/v1.29/rpm/
enabled=1
gpgcheck=1
gpgkey=https://pkgs.k8s.io/core:/stable:/v1.29/rpm/repodata/repomd.xml.key
EOF

# Install kubelet, kubeadm, and kubectl
sudo yum install -y kubelet kubeadm kubectl --disableexcludes=kubernetes
sudo systemctl enable --now kubelet

# Initialize Kubernetes cluster
sudo kubeadm init --pod-network-cidr=10.244.0.0/16 --ignore-preflight-errors=NumCPU,Mem

# Configure kubectl for the root user
mkdir -p $HOME/.kube
sudo cp /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

# Deploy Calico network plugin
kubectl apply -f https://docs.projectcalico.org/v3.18/manifests/calico.yaml

# Deploy Tigera Operator (optional)
kubectl apply -f https://raw.githubusercontent.com/projectcalico/calico/v3.27.0/manifests/tigera-operator.yaml

# Remove taints from control-plane nodes (allow workloads on the master node)
kubectl taint nodes $(hostname) node-role.kubernetes.io/control-plane:NoSchedule-
