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

/* EC2 Instance type */
#Use: instance_type = var.instance_type["type1"]
variable "instance_type" {
  type = map(string)
  default = {
    "type1" = "t2.micro"
    "type2" = "t2.small"
    "type3" = "t2.medium"
  }
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