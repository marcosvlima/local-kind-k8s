variable "kyverno_enabled" {
  description = "Enable or disable Kyverno"
  default = false
}

variable "metric_server" {
  description = "Enable or disable metric server"
  default = false
}

variable "nginx_controller" {
  description = "Enable or disable nginx controller"
  default = false
}