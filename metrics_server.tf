resource "helm_release" "metrics_server" {
  chart = "stable/metrics-server"
  name  = "metrics-server"
  wait  = true
}
