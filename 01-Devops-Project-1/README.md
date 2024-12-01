#############################################################################

After configuring server Jenkins & kubernetes using terraform. 
Set root password on both server . 
sudo su  OR sudo su - 
Fistly , configure in   /etc/ssh/sshd_config file
 To automate the process of enabling root login and password authentication in the /etc/ssh/sshd_config file, you can use the sed command in a script or command sequence. Below are the steps to achieve this:
Automation Steps

    Update PermitRootLogin to yes using sed.
    Update PasswordAuthentication to yes using sed.
    Restart the sshd service to apply the changes.

#!/bin/bash

# File path
SSH_CONFIG_FILE="/etc/ssh/sshd_config"

# Backup the original file
cp "$SSH_CONFIG_FILE" "${SSH_CONFIG_FILE}.bak"

# Enable root login
sed -i 's/^#?PermitRootLogin .*/PermitRootLogin yes/' "$SSH_CONFIG_FILE"

# Enable password authentication
sed -i 's/^#?PasswordAuthentication .*/PasswordAuthentication yes/' "$SSH_CONFIG_FILE"

# Restart the SSHD service
systemctl restart sshd

echo "Root login and password authentication enabled. SSH service restarted."

Make the script executable:
chmod +x enable_root_login.sh

Run the script as a superuser:
sudo ./enable_root_login.sh

Set root password. 
passwd  root
password

#######################################################################################

Now copy ssh authentication key from jenkins server to k8s server. 
Create key using ssh-keygen comammnd .
ssh-keygen
root@worker-2:~# ls ~/.ssh/
authorized_keys  id_rsa  id_rsa.pub

Now copy this key to k8s server. 
Syntax: ssh-copy-id username@private-ip-K8s-sever
ssh-copy-id root@192.168.157.137

check on k8s server
ls ~/.ssh/
authorized_keys  id_rsa  id_rsa.pub  known_hosts

########################################################################################################

Get jenkins password form the jenkins server
http://pulic-ip-Jenkins-Server:8080
sudo cat /etc/lib/jenkins/secrets/initialAdminPassword

Installed Suggested plugins > Getting Started Username:admin password:password  Confirm password:password, Full Name: sysops amdin , E-mail-ID:gchauahan1517.ca20@chitkara.edu.in > Instance configuration http://public-ip-Jenkins-Server > Save and Finsish > Jenkins is ready! > Start using Jenkins .

Configure some credentials in jenkins server like docker-hub , github(webhook)
Manage Jenkins > Credentials > Store scoped to Jenkins > System:(global) > +Add Credentials >
New Credentials > Kind:Username with password > Scope:Global(Jenkins, nodes, items, all child items, etc.) >
Username:hub.docker-username > password:password> ID:hub-creds(NOte:calling in pipeline.) > Description: mY docker hub userName password.  SAVe

Add EC2 pem key in Jenkins Credentials
Dashboard > Manage Jenkins > Credentials > System> Global credentials(unrestricted) > New credentials> Kind:SSH Username with private key > Scope:Global(Jenkins, nodes, items, all child items, etc.) > ID:ec2_user > Description: Aws EC2 username & password > Private Key Key: . 


Add Github Credentials for private repository in jenkins Global Credentials.
Username top corner SEttings > Devloper Settings > Personal Access tokens (Token classic)> Generate classic token. > passsord github > Note: Github cred for jenkins -server. Expration:7 days.> Select scope Select all for now.  copy token 
Save in Global credeniotal as secret text. 


Configure maven in jenkins dashboard. or in Jenkins sever and set environment vairable. 
I have alreday configure while configuring jenkins server.
OR using jenkins dashboard. 
Dashboard > Manage Jenkins > Tools > Maven installation > Add Maven Name:maven > Install automatically ✔️ > Install from Apache VErision:3.9.9 >Apply > Save.

OR use this script  to configure. 

#!/bin/bash
# Maven installation
echo Downloading and installing Maven 3.9.9...
wget https://dlcdn.apache.org/maven/maven-3/3.9.9/binaries/apache-maven-3.9.9-bin.tar.gz
tar -xvzf apache-maven-3.9.9-bin.tar.gz
mv apache-maven-3.9.9 /opt/maven

# create a new file named maven.sh inside of the /etc/profile.d/ directory.
touch /etc/profile.d/maven.sh

# Setting up Maven environment variables
echo Configuring Maven environment variables...
echo export M2_HOME=/opt/maven | tee -a /etc/profile.d/maven.sh
echo export MAVEN_HOME=/opt/maven | tee -a /etc/profile.d/maven.sh
echo export PATH=\$M2_HOME/bin:\$PATH | tee -a /etc/profile.d/maven.sh
echo export PATH=/opt/maven/apache-maven-3.9.9/bin:\$PATH | tee -a /etc/profile.d/maven.sh

#Run this manual 
#export JAVA_HOME=/usr/lib/jvm/jre-openjdk
#export M2_HOME=/opt/maven
#export MAVEN_HOME=/opt/maven
#export PATH=${M2_HOME}/bin:${PATH}


# Make the script executable by running the following chmod command:
chmod +x /etc/profile.d/maven.sh

# Source the profile again to ensure environment variables are loaded
source /etc/profile.d/maven.sh

# Set executable permissions for Maven binaries
chmod +x /opt/maven/bin/mvn

# Check mvn version 
 mvn -version



Create pipeline. 
CI-Pipeline. 

Pipeline stages
1. cleanup 
2. Git Checkout
3. Maven Unit Testing (pom.xml{Project Object Model}) 
4. Maven Build (Code --> .jar)
5. Maven Integration Testing
6. Docker build ((Dockerfile) .jar -> image)
7. scan Image for vulnerablilities (trivy)
8. Docker tag (username/project-name:version-tag)
9. Docker login , push to image to hub.docker.com 






































