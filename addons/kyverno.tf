resource "helm_release" "kyverno" {
  count = var.kyverno_enabled ? 1 : 0
  name       = "kyverno"

  repository = "https://kyverno.github.io/kyverno/"
  chart      = "kyverno"

}