resource "helm_release" "metric_server" {
  count = var.metric_server ? 1 : 0
  name       = "metrics-server"

  repository = "https://kubernetes-sigs.github.io/metrics-server/"
  chart      = "metrics-server"

  values = [
    jsonencode({
      args = [
        "--kubelet-preferred-address-types=InternalIP",
        "--kubelet-insecure-tls"
      ]
    })
  ]

}
