#
# Variables Configuration
#
variable "cluster_name" {
  default = "terraform-eks-demo"
  type    = "string"
}

variable "key_name" {
  type = "string"
}

variable "desired_nodes" {
  type    = "string"
  default = 2
}

variable "instance_type" {
  type    = "string"
  default = "t3.micro"
}

variable "min_nodes" {
  type    = "string"
  default = 2
}

variable "max_nodes" {
  type    = "string"
  default = 3
}

variable "region" {
  type = "string"
  default = "us-east-2"
}

variable "kube_config_file" {
  type = "string"
  default = "~/.kube/config"
}
