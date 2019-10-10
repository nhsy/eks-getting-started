#
# Outputs
#
//output "config_map_aws_auth" {
//  value       = "${local.config_map_aws_auth}"
//  description = "Contents of aws-auth config map"
//}
//
output "kubeconfig" {
  value       = local_file.kube_config.filename
  description = "kubeconfig filename"
}

output "endpoint" {
  value       = aws_eks_cluster.eks.endpoint
  description = "The eks cluster endpoint"
}

output "version" {
  value = aws_eks_cluster.eks.version
}

output "certificate-authority" {
  value = aws_eks_cluster.eks.certificate_authority[0].data
}

output "id" {
  value = aws_eks_cluster.eks.id
}

output "arn" {
  value = aws_eks_cluster.eks.arn
}

output "role_arn" {
  value = aws_eks_cluster.eks.role_arn
}

output "name" {
  value = aws_eks_cluster.eks.name
}
