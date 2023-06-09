module "addons" {
  source = "./addons"

  kyverno_enabled = var.kyverno_enabled
}
