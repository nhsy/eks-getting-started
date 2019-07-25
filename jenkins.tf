resource "helm_release" "jenkins" {
  chart = "stable/jenkins"
  name  = "jenkins"
}
