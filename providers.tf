#
# Provider Configuration
#

provider "aws" {
  version = "~> 2.15"
  region  = "${var.region}"
}

# Using these data sources allows the configuration to be
# generic for any region.
data "aws_region" "current" {}

data "aws_availability_zones" "available" {}

# Not required: currently used in conjuction with using
# icanhazip.com to determine local workstation external IP
# to open EC2 Security Group access to the Kubernetes cluster.
# See workstation-external-ip.tf for additional information.
provider "http" {
  version = "~> 1.1"
}

provider "kubernetes" {
  version     = "~> 1.7"
  config_path = "${local_file.kube_config.filename}"
}

provider "helm" {
  version         = "~> 0.9"
  install_tiller  = true
  service_account = "${kubernetes_service_account.tiller.metadata.0.name}"
  namespace       = "${kubernetes_service_account.tiller.metadata.0.namespace}"

  kubernetes {
    config_path = "${local_file.kube_config.filename}"
  }
}

provider "local" {
  version = "~> 1.2"
}

provider "null" {
  version = "~> 2.1"
}
