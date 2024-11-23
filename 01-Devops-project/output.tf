#Output the instance ID:
output "Jenkins_instance_id" {
  description = "The ID of the Jenkins EC2 instance"
  value       = aws_instance.jenkins_server[0].id
}

# Output the public IP address:
output "Jenkins_public_ip" {
  description = "The public IP address of the Jenkins EC2 instance"
  value       = aws_instance.jenkins_server[0].public_ip
}

#Output the private IP address:
output "Jenkins_private_ip" {
  description = "The private IP address of the Jenkins EC2 instance"
  value       = aws_instance.jenkins_server[0].private_ip
}


###################
# k8s sever 
# STEP3: OUTPUT PUBLIC IP OF EC2 INSTANCE
output "KS_id" {
  description = "The ID of the K8S EC2 instance"
  value       = aws_instance.k8s_server[0].id
}

# Output the public IP address:
output "KS_public_ip" {
  description = "The public IP address of the K8S EC2 instance"
  value       = aws_instance.k8s_server[0].public_ip
}

#Output the private IP address:
output "KS_private_ip" {
  description = "The private IP address of the K8S EC2 instance"
  value       = aws_instance.k8s_server[0].private_ip
}
