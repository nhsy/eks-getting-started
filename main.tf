/**
*# EKS Getting Started
*
* This is taken from https://www.terraform.io/docs/providers/aws/guides/eks-getting-started.html
*
* See that guide for additional information.
*
* # Parameters
*/

locals {
  cluster_name = "${var.resource_prefix}-cluster"
  node_name    = "${var.resource_prefix}-node"
}
