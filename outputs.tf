#
# Outputs
#
//output "config_map_aws_auth" {
//  value       = "${local.config_map_aws_auth}"
//  description = "Contents of aws-auth config map"
//}
//
//output "kubeconfig" {
//  value       = "${local.kubeconfig}"
//  description = "Contents of kubeconfig"
//}

output "kubeconfig_file" {
  value       = "${var.kube_config_file}"
  description = "Kubeconfig file path"
}

output "local_ip" {
  value       = "${local.workstation-external-cidr}"
  description = "Workstation public ip address"
}

output "istio_ingress_gateway" {
  value       = "kubectl get svc istio-ingressgateway --namespace istio-system -o jsonpath={.status.loadBalancer.ingress[0].hostname} --kubeconfig ${local_file.kube_config.filename}"
  description = "Istio ingress gateway"
}
