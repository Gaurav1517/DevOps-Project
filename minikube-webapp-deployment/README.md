# 🚀 Task 5: Build a Kubernetes Cluster Locally with Minikube & Deploy web application

## 📦 minikube Cluster Setup

Minikube is local Kubernetes, focusing on making it easy to learn and develop for Kubernetes.

All you need is Docker (or similarly compatible container or Virtual Machine environment), and Kubernetes is a single command away:  
```bash
minikube start
````

---

### ✅ What You’ll Need

* 2 CPUs or more
* 2GB of free memory
* 20GB of free disk space
* Internet connection
* Container or virtual machine manager, such as: Docker, QEMU, Hyperkit, Hyper-V, KVM, Parallels, Podman, VirtualBox, or VMware Fusion/Workstation

---

## 🖥️ Check System Requirements on Windows (PowerShell)

1. **Check CPU Count (Logical Processors)**

```powershell
powershell "Get-CimInstance -ClassName Win32_ComputerSystem | Select-Object NumberOfLogicalProcessors"
```

2. **Check Available Physical Memory (RAM)**

```powershell
powershell "Get-CimInstance -ClassName Win32_ComputerSystem | Select-Object TotalPhysicalMemory"
```

3. **Check Free Disk Space**

```powershell
Get-PSDrive -PSProvider 'FileSystem' | Select-Object Name,Free,Used, @{Name='FreeGB';Expression={[math]::Round($_.Free / 1GB, 2)}}
```

4. **Check Internet Connection**

```powershell
ping google.com
```

---

## 🐳 Install Docker Desktop on Windows

### Required Features:

* WSL 2 (Windows Subsystem for Linux, version 2)
* Virtual Machine Platform feature enabled
* Hyper-V (if using Hyper-V backend)
* Internet access for downloading components

### Check if WSL is Installed

```bash
wsl --list --verbose
```

### Check if "Virtual Machine Platform" is Enabled

```powershell
Get-WindowsOptionalFeature -Online -FeatureName VirtualMachinePlatform
```

### Download & Install Docker Desktop

➡️ [Docker Desktop Download](https://docs.docker.com/desktop/setup/install/windows-install/)

### Verify Docker

```bash
docker --version
```

---

## ⚙️ Configuring Minikube Cluster

### ✅ Step 1: Download Minikube

```powershell
New-Item -Path 'c:\' -Name 'minikube' -ItemType Directory -Force
$ProgressPreference = 'SilentlyContinue'; Invoke-WebRequest -OutFile 'c:\minikube\minikube.exe' -Uri 'https://github.com/kubernetes/minikube/releases/latest/download/minikube-windows-amd64.exe' -UseBasicParsing
```

### ✅ Step 2: Add Minikube to System PATH

```powershell
$oldPath = [Environment]::GetEnvironmentVariable('Path', [EnvironmentVariableTarget]::Machine)
if ($oldPath.Split(';') -inotcontains 'C:\minikube'){
  [Environment]::SetEnvironmentVariable('Path', $('{0};C:\minikube' -f $oldPath), [EnvironmentVariableTarget]::Machine)
}
```

### 🚀 Step 3: Start Your Cluster

```bash
minikube start --driver=docker
```
![minikube-start](/snap/minikube-start.png)
---

## 🧰 Manage Your Cluster

```bash
minikube status
minikube pause
minikube unpause
minikube stop
minikube delete --all
```

---

## 📝 Dockerfile to Host a Static Web Page

### `Dockerfile`

```Dockerfile
FROM nginx:alpine
COPY index.html /usr/share/nginx/html/index.html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
```

### 🔨 Build the Docker Image 

```bash
docker build -t <username>/task-5-app:latest .
```
![build-image](/snap/build-image.png)

---

## 🔐 Create Docker Hub Access Token

1. Log in to [Docker Hub](https://hub.docker.com/)
2. Go to **Account Settings**
3. Navigate to **Security**
4. Click **New Access Token**
5. Name your token (e.g., CI/CD or Local Minikube)
6. Click **Generate**
7. **Copy the token immediately** — you won't see it again!

---

## 🔐 Login & Push Docker Image

```bash
docker login -u gchauhan1517
docker push <username>/task-5-app:latest
```
![docker-login-push-image](/snap/docker-login.png)
![docker-images](/snap/docker-images.png)
---

## 📄 Kubernetes YAML Files

### `namespace.yaml`

```yaml
apiVersion: v1
kind: Namespace
metadata:
  name: task-5
```

---

### `deployment.yaml`

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: task-5-deployment
  namespace: task-5
spec:
  replicas: 2
  selector:
    matchLabels:
      app: task-5-app
  template:
    metadata:
      labels:
        app: task-5-app
    spec:
      containers:
      - name: task-container
        image: gchauhan1517/task-5-app
        ports:
        - containerPort: 8080
```

---

### `service.yaml`

```yaml
apiVersion: v1
kind: Service
metadata:
  name: task-5-service
  namespace: task-5
spec:
  type: NodePort
  selector:
    app: task-5-app
  ports:
    - protocol: TCP
      port: 80
      targetPort: 80
      nodePort: 30480
```

---

## 📦 Deploy Kubernetes Resources

### 1. Create deployment in `task-5` namespace:

```bash
kubectl create -f namespace.yaml
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
```

---

### 2. Set default namespace for current context:

```bash
kubectl config set-context --current --namespace=task-5
```

#### ✅ Validate it's set

```bash
kubectl config view --minify | findstr "namespace:"
```
![create-resources](/snap/create-resources.png)
---

### 3. Interact with Resources

```bash
kubectl get ns | findstr "task-5"
kubectl get all
kubectl get pods
kubectl get rs
kubectl get svc
kubectl scale deployment task-5-deployment --replicas=4
kubectl describe deployment task-5-deployment
kubectl logs <pod-name>
```

---

### 4. Access the App in Browser

```bash
minikube service task-5-service
```
![mini-kubeservice](/snap/minikube-service.png)
![app-minikube-service](/snap/app-minikube-service.png)

✅ Opens browser with your deployed web page.

#### 🔁 Optional: Port Forward Alternative

```bash
kubectl port-forward service/task-5-service 8080:80 -n task-5
```

Then open:

```
http://localhost:8080
```
![app-snap](/snap/app-snap.png)

---

## 📚 References

* [minikube installation](https://minikube.sigs.k8s.io/docs/start/)
* [Docker Desktop installation](https://docs.docker.com/desktop/setup/install/windows-install/)
* [Kubernetes Docs](https://kubernetes.io/)
* [Docker Hub](https://hub.docker.com/)

```

---

