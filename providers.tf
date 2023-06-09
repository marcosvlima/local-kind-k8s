# https://registry.terraform.io/providers/kyma-incubator/kind/latest/docs/resources/cluster
terraform {
  required_providers {
    kind = {
      source = "kyma-incubator/kind"
      version = "0.0.11"
    }

    null = {
      source  = "hashicorp/null"
      version = "3.1.0"
    }
  }
}

provider "kind" {
  # Configuration options
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

