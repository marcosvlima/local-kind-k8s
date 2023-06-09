resource "helm_release" "ingress_nginx" {
  count = var.nginx_controller ? 1 : 0
  name       = "ingress-nginx"
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"
  version    = "4.0.6"

  namespace        = "nginx"
  create_namespace = true

  values = [file("addons/values/nginx_ingress_values.yaml")]
}

resource "null_resource" "wait_for_ingress_nginx" {
  count = var.nginx_controller ? 1 : 0
  triggers = {
    key = uuid()
  }

  provisioner "local-exec" {
    command = <<EOF
      printf "\nWaiting for the nginx ingress controller...\n"
      kubectl wait --namespace ${helm_release.ingress_nginx[count.index].namespace} \
        --for=condition=ready pod \
        --selector=app.kubernetes.io/component=controller \
        --timeout=90s
    EOF
  }

  depends_on = [helm_release.ingress_nginx]
}