############################################
#testing resource deployment to EKS
############################################
//resource "kubernetes_namespace" "self-service-portal" {
//  metadata {
//    name = "${var.namespace_name}"
//    labels {
//      name = "self-service-portal"
//    }
//    annotations {
//      name = "example-annotation"
//    }
//  }
//  depends_on = [
//    "local_file.kube_config"
//  ]
//}

resource "kubernetes_pod" "nginx" {
  metadata {
    name      = "${var.nginx_pod_name}"
    namespace = "${var.namespace_name}"

    labels {
      app = "nginx"
    }
  }

  spec {
    container {
      name  = "${var.nginx_pod_name}"
      image = "${var.nginx_pod_image}"

      port {
        container_port = 80
      }
    }
  }

  depends_on = ["local_file.kube_config"]
}

resource "kubernetes_service" "nginx" {
  metadata {
    name      = "${var.nginx_pod_name}"
    namespace = "${var.namespace_name}"

    annotations {
      #testing deploying network load balancer  #"service.beta.kubernetes.io/aws-load-balancer-type" = "nlb"
    }
  }

  spec {
    selector {
      app = "${kubernetes_pod.nginx.metadata.0.labels.app}"
    }

    port {
      port = "80"
    }

    type = "LoadBalancer"
  }

  depends_on = ["kubernetes_pod.nginx"]
}

########################
#variables for testing
########################
variable "namespace_name" {
  default = "default"
  type    = "string"
}

variable "nginx_pod_name" {
  default = "nginx"
  type    = "string"
}

variable "nginx_pod_image" {
  default = "nginx:latest"
  type    = "string"
}

//locals {
//  service_url = "${kubernetes_service.nginx.load_balancer_ingress.0.hostname}"
//}
