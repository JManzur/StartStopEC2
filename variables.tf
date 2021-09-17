# AWS Region: North of Virginia
variable "aws_region" {
  type    = string
  default = "us-east-1"
}

# SSH Key-Pair 
variable "key_name" {
  type    = string
  default = "jmanzur"
}

# AMI: AWS Linux 2
variable "aws_ami_id" {
  type    = string
  default = "ami-087c17d1fe0178315"
}

# Instance size
variable "instance_type" {
  type    = string
  default = "t2.micro"
}

# Main VPC
variable "main_vpc" {
  type    = string
  default = "vpc-1c6c1766"
}

# Main Subnet
variable "private_subnet_id" {
  type    = string
  default = "subnet-0a9b22433e6dc9df9"
}

### Tags Variables ###

variable "demo-startstop" {
  type = map(string)
  default = {
    service     = "Auto-StartStop-Demo",
    environment = "demo"
    owner       = "example@mail.com"
  }
}

variable "tag_project" {
  type    = string
  default = "auto-startstop-demo"
}