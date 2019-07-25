data "helm_repository" "istio" {
  name = "istio.io"
  url  = "https://storage.googleapis.com/istio-release/releases/${var.istio_version}/charts/"
}

resource "kubernetes_namespace" "istio_system" {
  metadata {
    name = "istio-system"
  }

  depends_on = ["aws_autoscaling_group.eks-cluster"]
}

resource "helm_release" "istio_init" {
  repository = "${data.helm_repository.istio.name}"
  chart      = "istio-init"
  name       = "istio-init"
  namespace  = "${kubernetes_namespace.istio_system.metadata.0.name}"
  wait       = true

  depends_on = ["kubernetes_cluster_role_binding.tiller"]
}

###
# add delay to allow istio crd to propagate
###
resource "null_resource" "delay" {
  triggers {
    after = "${helm_release.istio_init.id}"
  }

  provisioner "local-exec" {
    command = "sleep 30"
  }

  depends_on = ["helm_release.istio_init"]
}

resource "helm_release" "istio" {
  repository = "${data.helm_repository.istio.name}"
  chart      = "istio"
  name       = "istio"
  namespace  = "${kubernetes_namespace.istio_system.metadata.0.name}"

  values = [
    "${file("files/values-istio-demo.yaml")}",
  ]

  wait       = false
  depends_on = ["helm_release.istio_init", "null_resource.delay"]
}
