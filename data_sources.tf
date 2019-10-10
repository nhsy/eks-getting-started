data "template_file" "eks_kube_config" {
  template = file("${path.module}/templates/kube_config.tf.tpl")

  vars = {
    cluster_endpoint    = aws_eks_cluster.eks.endpoint
    cluster_certificate = aws_eks_cluster.eks.certificate_authority.0.data
    cluster_name        = local.cluster_name

  }
}

data "aws_ami" "eks-worker" {
  filter {
    name   = "name"
    values = ["amazon-eks-node-${aws_eks_cluster.eks.version}-v*"]
  }

  most_recent = true
  owners      = ["602401143452"] # Amazon EKS AMI Account ID
}
