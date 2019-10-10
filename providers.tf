provider "kubernetes" {
  config_path      = local_file.kube_config.filename
  load_config_file = local_file.kube_config.filename != "" ? true : false
}
