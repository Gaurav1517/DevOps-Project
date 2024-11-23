#!/bin/bash

# Update and install prerequisites
sudo yum update -y
sudo yum install -y curl tar gzip wget

# JDK 17 installation
echo "Installing Amazon Corretto JDK 17..."

# Import the Corretto GPG key
sudo rpm --import https://yum.corretto.aws/corretto.key

# Add the Corretto repository
sudo curl -L -o /etc/yum.repos.d/corretto.repo https://yum.corretto.aws/corretto.repo

# Install Java 17
sudo yum install -y java-17-amazon-corretto

# Setting up JDK environment variables
echo "Configuring Java environment variables..."
echo "export JAVA_HOME=/usr/lib/jvm/java-17-amazon-corretto" | sudo tee -a /etc/profile
echo "export PATH=\$PATH:\$JAVA_HOME/bin" | sudo tee -a /etc/profile

# Source the profile to ensure environment variables are loaded
source /etc/profile

# Verify Java installation
if command -v java &>/dev/null; then
    java -version
else
    echo "Java installation failed. Exiting."
    exit 1
fi

# Maven installation
echo "Downloading and installing Maven 3.9.9..."
sudo wget https://dlcdn.apache.org/maven/maven-3/3.9.9/binaries/apache-maven-3.9.9-bin.tar.gz -P /tmp
sudo tar -xzf /tmp/apache-maven-3.9.9-bin.tar.gz -C /opt

# Create a symbolic link for Maven (optional, but recommended)
sudo ln -s /opt/apache-maven-3.9.9 /opt/maven

# Configure environment variables for Maven
sudo tee /etc/profile.d/maven.sh > /dev/null <<EOL
# Apache Maven Environment Variables
export JAVA_HOME=/usr/lib/jvm/java-17-amazon-corretto
export M2_HOME=/opt/maven
export MAVEN_HOME=/opt/maven
export PATH=\${M2_HOME}/bin:\${PATH}
EOL

# Modify file permissions for the Maven configuration script
sudo chmod +x /etc/profile.d/maven.sh

# Source the Maven configuration script to apply changes
source /etc/profile.d/maven.sh

# Verify Maven installation
if command -v mvn &>/dev/null; then
    mvn --version
else
    echo "Maven installation failed. Exiting."
    exit 1
fi

echo "Installation of JDK 17 and Maven 3.9.9 is complete."

#Git Installation
sudo yum install -y git* 

# If get error to install git . 
sudo yum install git* -y --skip-broken

# Verity version 
git --version 

# Jenkins Installation
echo "Installing Jenkins..."
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
sudo yum upgrade -y
sudo yum install jenkins -y
sudo systemctl enable jenkins --now
sudo systemctl status jenkins

# Install Docker
echo "Installing Docker..."
sudo yum update -y
sudo yum install docker -y
sudo systemctl start docker
sudo systemctl enable docker

# Add Jenkins user to Docker group to avoid permission error
sudo usermod -aG docker jenkins
# To avoid permission denied while connecting to Docker socket
sudo chmod 666 /var/run/docker.sock

# Install Trivy
echo "Installing Trivy..."
# Add Trivy repository
cat << EOF | sudo tee /etc/yum.repos.d/trivy.repo
[trivy]
name=Trivy repository
baseurl=https://aquasecurity.github.io/trivy-repo/rpm/releases/\$basearch/
gpgcheck=1
enabled=1
gpgkey=https://aquasecurity.github.io/trivy-repo/rpm/public.key
EOF

# Update the package list
sudo yum -y update

# Install Trivy
sudo yum -y install trivy

# Verify installation
echo "Verify trivy installation."
trivy --version


# Install Ansible and dependencies
echo "Installing Ansible and dependencies..."
# Install Python 3, python-devel, python3-pip, and OpenSSL
echo "Installing Python 3, python-devel, python3-pip, and OpenSSL..."
sudo yum install -y python3 python3-devel python3-pip openssl

# Install Ansible
echo "Installing Ansible..."
 sudo amazon-linux-extras install ansible2 -y

# Verify installations
echo "Verifying installations..."
python3 --version
pip3 --version
ansible --version

echo "Installation of Python 3, Python development tools, pip, OpenSSL, and Ansible is complete." 

echo "Installation completed successfully."
