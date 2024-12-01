
# Jenkins server key-pair
# Generate a new RSA private key
resource "tls_private_key" "jenkins_rsa" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Create an AWS key pair using the public key from the generated private key
resource "aws_key_pair" "jenkins_key" {
  key_name   = var.jenkins_keypair
  public_key = tls_private_key.jenkins_rsa.public_key_openssh
}

# Save the private key locally for future use
resource "local_file" "jenkins_key" {
  content  = tls_private_key.jenkins_rsa.private_key_pem
  filename = "${path.module}/jenkins_key.pem"
}

# # # Change the file permissions to 400
# resource "null_resource" "jenkins_set_permissions" {
#   provisioner "local-exec" {
#     command = "chmod 400 ${path.module}/jenkins_key.pem"
#   }
# }

# Kubernetes server key-pair
# Generate a new RSA private key
resource "tls_private_key" "k8s_rsa" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Create an AWS key pair using the public key from the generated private key
resource "aws_key_pair" "k8s_key" {
  key_name   = var.ks_keypair
  public_key = tls_private_key.k8s_rsa.public_key_openssh
}

# Save the private key locally for future use
resource "local_file" "k8s_key" {
  content  = tls_private_key.k8s_rsa.private_key_pem
  filename = "${path.module}/k8s_key.pem"
}

# # # Change the file permissions to 400
# resource "null_resource" "k8s_set_permissions" {
#   provisioner "local-exec" {
#     command = "chmod 400 ${path.module}/k8s_key.pem"
#   }
# }
