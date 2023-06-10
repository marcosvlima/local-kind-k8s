resource "helm_release" "kyverno_app" {
  count = var.kyverno_lab ? 1 : 0
  create_namespace = true
  namespace = "mimoso-kyverno"
  name       = "sample-app"
  chart = "samples/mimoso-app/"

}

resource "null_resource" "apply_manifest" {
  provisioner "local-exec" {
    command = "kubectl apply -f labs/kyverno/add-ns-quota.yaml"
  }

  depends_on = [ 
    helm_release.kyverno_app
   ]
}