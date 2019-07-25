//resource "kubernetes_namespace" "spinnaker" {
//  metadata {
//    name = "spinnaker"
//  }
//}
//
//resource "helm_release" "spinnaker" {
//  chart      = "stable/spinnaker"
//  name       = "spinnaker"
//  namespace = "${kubernetes_namespace.spinnaker.metadata.0.name}"
//  wait = false
//}

