#
# Variables Configuration
#
variable "key_name" {
  type = "string"
  description = "SSH key name"
}

variable "desired_nodes" {
  type    = "string"
  default = 2
  description = "ASG desired nodes"
}

variable "instance_type" {
  type    = "string"
  default = "t3.large"
  description = "Node instance type"
}

variable "min_nodes" {
  type    = "string"
  default = 2
  description = "ASG min nodes"
}

variable "max_nodes" {
  type    = "string"
  default = 5
  description = "ASG max nodes"
}

variable "region" {
  type    = "string"
  default = "us-east-2"
  description = "AWS region"
}

variable "kube_config_file" {
  type    = "string"
  default = "~/.kube/config"
  description = "Kubeconfig file to create"
}

variable "resource_prefix" {
  type    = "string"
  default = "eks-demo"
  description = "Resource prefix"
}

variable "istio_version" {
  type        = "string"
  default     = "1.2.2"
  description = "Istio version in form X.Y.Z, used to target Istio Helm chart from https://storage.googleapis.com/istio-release/releases/X.Y.Z/charts/"
}

variable "network_cidr" {
  type    = "string"
  default = "10.0.0.0/16"
  description = "Network CIDR"
}
