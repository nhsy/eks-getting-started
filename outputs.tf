#
# Outputs
#
output "config_map_aws_auth" {
  value = "${local.config_map_aws_auth}"
}

output "kubeconfig" {
  value = "${local.kubeconfig}"
}

output "kubeconfig_file" {
  value = "${var.kube_config_file}"
}

output "local_ip" {
  value = "${local.workstation-external-cidr}"
}
output "service_url" {
  value = "${kubernetes_service.nginx.load_balancer_ingress.0.hostname}"
}
