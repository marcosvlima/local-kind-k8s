module "addons" {
  source = "./addons"

  kyverno_enabled = var.kyverno_enabled
  metric_server = var.metric_server
}
