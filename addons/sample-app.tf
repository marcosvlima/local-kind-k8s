resource "helm_release" "sample_app" {
  count = var.nginx_controller ? 1 : 0  
  name       = "sample-app"
  chart = "samples/sample-app/"

  # outras configurações do release
}