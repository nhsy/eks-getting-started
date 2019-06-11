#AWS auth config map to join nodes to the cluster
resource "kubernetes_config_map" "aws_auth_configmap" {
  metadata {
    name      = "aws-auth"
    namespace = "kube-system"
  }

  data = "${local.config_map_aws_auth}"

}
