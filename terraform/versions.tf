terraform {
  required_version = ">= 1.5.7"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 6.52"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 3.0"
    }

    flux = {
      source = "fluxcd/flux"
      version = "~> 1.4"
    }
  }
}