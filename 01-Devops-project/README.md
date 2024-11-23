This mini-project demonstrates the creation of an **Amazon EC2 instance** using Terraform, featuring modular and flexible configurations for defining infrastructure resources. The project consists of multiple Terraform files to organize and manage different aspects of the deployment. Here’s a detailed description:

### **Project Highlights**:
1. **AMI Selection**:
   - The EC2 instance uses the Amazon Linux 2 AMI ID, dynamically fetched using the `aws_ami` data source.

2. **Instance Type Configuration**:
   - The instance type is parameterized, providing flexibility to define it in multiple ways:
     - As a string.
     - From a list (defaulting to the first element, as shown in this configuration).
     - From a map with key-value pairs (commented for optional use).

3. **Automated Instance Setup**:
   - The `user_data` parameter integrates with the `app-install.sh` script to automatically set up the instance during initialization.

4. **Key Pair Association**:
   - The instance is secured with an SSH key pair, enabling secure access.

5. **Security**:
   - The instance is linked to a security group, defined separately in `security-group.tf`, to manage inbound and outbound traffic rules.

6. **Placement**:
   - The instance is deployed in a specified availability zone, ensuring optimal resource placement.

7. **Dynamic Resource Count**:
   - The `count` attribute allows for scaling by adjusting the number of instances created.

8. **Tagging**:
   - The instance is tagged with a unique name, incorporating an index value for easy identification in case of multiple instances.

### **Supporting Files**:
The project is structured with multiple Terraform files to ensure clarity and modularity:
1. **`app-install.sh`**: A shell script for automating the setup and configuration of the EC2 instance.
2. **`instance-type.tf`**: Manages instance-related configurations, such as type, count, and user data.
3. **`provider.tf`**: Defines the AWS provider configuration for Terraform.
4. **`security-group.tf`**: Configures security groups to control network traffic to and from the EC2 instance.
5. **`variable.tf`**: Stores reusable variables such as instance types, key pairs, and availability zones.
6. **`vpc.tf`**: Configures the default VPC to ensure the instance is deployed within a properly networked environment.

This project demonstrates how Terraform can be used to design scalable, reusable, and well-organized infrastructure-as-code, enabling efficient management of cloud resources.