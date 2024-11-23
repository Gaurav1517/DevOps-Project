# Jenkins-server Security Group 
resource "aws_security_group" "ec2_security_group" {
  name        = var.ec2_security_group
  description = "Allow SSH, HTTP, HTTPS inbound traffic and all outbound traffic"
  vpc_id      = data.aws_vpc.default.id

  tags = {
    Name = "${var.ec2_security_group}"
  }
}

# Ingress rule for SSH (port 22) - IPv4
resource "aws_security_group_rule" "jenkins_allow_ssh_ipv4" {
  security_group_id = aws_security_group.ec2_security_group.id
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

# Ingress rule for HTTP (port 80) - IPv4
resource "aws_security_group_rule" "jenkins_allow_http_ipv4" {
  security_group_id = aws_security_group.ec2_security_group.id
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

# Ingress rule for HTTPS (port 443) - IPv4
resource "aws_security_group_rule" "jenkins_allow_https_ipv4" {
  security_group_id = aws_security_group.ec2_security_group.id
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

# Ingress rule for Jenkins  (port 8080) - IPv4
resource "aws_security_group_rule" "jenkins_allow_jenkins_ipv4" {
  security_group_id = aws_security_group.ec2_security_group.id
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

# Ingress rule for Maven  (port 8081) - IPv4
resource "aws_security_group_rule" "jenkins_allow_maven_ipv4" {
  security_group_id = aws_security_group.ec2_security_group.id
  type              = "ingress"
  from_port         = 8081
  to_port           = 8081
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}


# Egress rule for all traffic - IPv4
resource "aws_security_group_rule" "jenkins_allow_all_outbound_ipv4" {
  security_group_id = aws_security_group.ec2_security_group.id
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

###########################################################

# K8s-server Security Group 
# Description: K8s requires ports 22, 80, 443, 6443, 8001, 10250, 30000-32767
resource "aws_security_group" "ks_security_group" {
  name        = var.ks_security_group
  description = "Allow SSH, HTTP, HTTPS, inbound traffic and all outbound traffic"
  vpc_id      = data.aws_vpc.default.id

  tags = {
    Name = "${var.ks_security_group}"
  }
}

# Ingress rule for SSH (port 22) - IPv4
resource "aws_security_group_rule" "k8s_allow_ssh_ipv4" {
  security_group_id = aws_security_group.ks_security_group.id
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

# Ingress rule for HTTP (port 80) - IPv4
resource "aws_security_group_rule" "k8s_allow_http_ipv4" {
  security_group_id = aws_security_group.ks_security_group.id
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

# Ingress rule for HTTPS (port 443) - IPv4
resource "aws_security_group_rule" "k8s_allow_https_ipv4" {
  security_group_id = aws_security_group.ks_security_group.id
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

# Ingress rule for Jenkins  (port 8080) - IPv4
resource "aws_security_group_rule" "k8s_allow_jenkins_ipv4" {
  security_group_id = aws_security_group.ks_security_group.id
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

# Ingress rule for Maven  (port 8081) - IPv4
resource "aws_security_group_rule" "k8s_allow_maven_ipv4" {
  security_group_id = aws_security_group.ks_security_group.id
  type              = "ingress"
  from_port         = 8081
  to_port           = 8081
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

# Ingress rule for Kubernetes API server  (6443) - IPv4
resource "aws_security_group_rule" "k8s_allow_api_ipv4" {
  security_group_id = aws_security_group.ks_security_group.id
  type              = "ingress"
  from_port         = 6443
  to_port           = 6443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

# Ingress rule for etcd server client API  (2379-2380) - IPv4
resource "aws_security_group_rule" "k8s_allow_etcd_ipv4" {
  security_group_id = aws_security_group.ks_security_group.id
  type              = "ingress"
  from_port         = 2379
  to_port           = 2380
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}
# Ingress rule for Kubelet API  (10250) - IPv4
resource "aws_security_group_rule" "k8s_allow_kubelet_ipv4" {
  security_group_id = aws_security_group.ks_security_group.id
  type              = "ingress"
  from_port         = 10250
  to_port           = 10250
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}
# Ingress rule for kube-scheduler  (10259) - IPv4
resource "aws_security_group_rule" "k8s_allow_scheduler_ipv4" {
  security_group_id = aws_security_group.ks_security_group.id
  type              = "ingress"
  from_port         = 10259
  to_port           = 10259
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}
# Ingress rule for 	kube-controller-manager  (10257) - IPv4
resource "aws_security_group_rule" "k8s_allow_controller_ipv4" {
  security_group_id = aws_security_group.ks_security_group.id
  type              = "ingress"
  from_port         = 10257
  to_port           = 10257
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}
# Ingress rule for 	kube-proxy  (10256) - IPv4
resource "aws_security_group_rule" "k8s_allow_kube_proxy_ipv4" {
  security_group_id = aws_security_group.ks_security_group.id
  type              = "ingress"
  from_port         = 10256
  to_port           = 10256
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}
# Ingress rule for 		NodePort Services†  (30000-32767) - IPv4
resource "aws_security_group_rule" "k8s_allow_nodeport_service_ipv4" {
  security_group_id = aws_security_group.ks_security_group.id
  type              = "ingress"
  from_port         = 30000
  to_port           = 32767
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}


# Egress rule for all traffic - IPv4
resource "aws_security_group_rule" "k8s_allow_all_outbound_ipv4" {
  security_group_id = aws_security_group.ks_security_group.id
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

