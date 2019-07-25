# EKS Getting Started

This is taken from https://www.terraform.io/docs/providers/aws/guides/eks-getting-started.html

See that guide for additional information.

# Parameters

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| desired\_nodes | ASG desired nodes | string | `"2"` | no |
| instance\_type | Node instance type | string | `"t3.large"` | no |
| istio\_version | Istio version in form X.Y.Z, used to target Istio Helm chart from https://storage.googleapis.com/istio-release/releases/X.Y.Z/charts/ | string | `"1.2.2"` | no |
| key\_name | SSH key name | string | n/a | yes |
| kube\_config\_file | Kubeconfig file to create | string | `"~/.kube/config"` | no |
| max\_nodes | ASG max nodes | string | `"5"` | no |
| min\_nodes | ASG min nodes | string | `"2"` | no |
| network\_cidr | Network CIDR | string | `"10.0.0.0/16"` | no |
| region | AWS region | string | `"us-east-2"` | no |
| resource\_prefix | Resource prefix | string | `"eks-demo"` | no |

## Outputs

| Name | Description |
|------|-------------|
| config\_map\_aws\_auth | Contents of aws-auth config map |
| kubeconfig | Contents of kubeconfig |
| kubeconfig\_file | Kubeconfig file path |
| local\_ip | Workstation public ip address |

