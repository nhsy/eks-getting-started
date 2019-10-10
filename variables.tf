#
# Variables Configuration
#

locals {
  env = terraform.workspace

  common_tags = {
    "Environment" = local.env
    "Owner"       = var.owner
    "Project"     = var.project
    "Terraform"   = "true"
  }

}

variable "owner" {
  type        = "string"
  description = "The owner of the project"
}

variable "project" {
  type        = "string"
  description = "The name of the project"
}

variable default_tags {
  description = "Default tags to use on resources"
  type        = map(string)
  default     = {}

}

###########################
# EKS
###########################

variable "desired_nodes" {
  type        = string
  description = "ASG desired nodes"
  default     = 3
}

variable "instance_type" {
  type        = "string"
  description = "Node instance type"
  default     = "t3.micro"
}

variable "min_nodes" {
  type        = "string"
  default     = 3
  description = "ASG min nodes"
}

variable "max_nodes" {
  type        = "string"
  default     = 5
  description = "ASG max nodes"
}

variable "region" {
  type        = "string"
  description = "AWS region"
}

variable "kube_config_file" {
  type        = string
  description = "Kubeconfig file to create"
  default     = ".eks-kubeconfig"
}

variable "resource_prefix" {
  type        = string
  description = "Resource prefix"
}

variable "ebs_optimized" {
  description = "If true, the launched EC2 instance will be EBS-optimized"
  type        = bool
  default     = false
}

variable "subnet_ids" {
  type = list
}

variable "vpc_id" {
  type = string
}

variable "mgmt_cidrs" {
  type    = list
  default = []
}

variable "ssh_key_name" {
  type = string
}
