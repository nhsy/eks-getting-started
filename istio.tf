data "helm_repository" "istio" {
  name = "istio.io"
  url  = "https://storage.googleapis.com/istio-release/releases/${var.istio_version}/charts/"
}

resource "kubernetes_namespace" "istio_system" {
  metadata {
    name = "istio-system"
  }
}

resource "kubernetes_service_account" "tiller" {
  metadata {
    name      = "tiller"
    namespace = "kube-system"
  }

  automount_service_account_token = true
}

resource "kubernetes_cluster_role_binding" "tiller" {
  metadata {
    name = "tiller-cluster-admin"
  }

  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = "cluster-admin"
  }

  subject {
    kind      = "ServiceAccount"
    name      = "${kubernetes_service_account.tiller.metadata.0.name}"
    namespace = "${kubernetes_service_account.tiller.metadata.0.namespace}"
  }
}

resource "helm_release" "istio_init" {
  repository = "${data.helm_repository.istio.name}"
  chart      = "istio-init"
  name       = "istio-init"
  namespace  = "${kubernetes_namespace.istio_system.metadata.0.name}"
  wait       = true

  depends_on = ["kubernetes_cluster_role_binding.tiller"]
  timeout    = "300"
}

resource "helm_release" "istio" {
  repository = "${data.helm_repository.istio.name}"
  chart      = "istio"
  name       = "istio"
  namespace  = "${kubernetes_namespace.istio_system.metadata.0.name}"

  values = [
    "${file("files/values-istio-demo.yaml")}",
  ]

  wait       = true
  depends_on = ["helm_release.istio_init", "kubernetes_cluster_role_binding.tiller"]
  timeout    = 600
}
