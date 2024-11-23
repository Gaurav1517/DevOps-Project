# Retrieve the default VPC ID
data "aws_vpc" "default" {
  default = true
}
