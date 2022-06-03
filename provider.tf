terraform {
  #required_version = "~>1.1.0"
  required_providers {
    google = {
      source = "hashicorp/google"
      #version = ">= 3.0.0, < 5.0.0"
    }

    google-beta = {
      source  = "hashicorp/google-beta"
      version = ">= 3.0.0, < 5.0.0"
    }
  }

  cloud {
    organization = "kylesbx"

    workspaces {
      tags = ["env:#{environment}#", "app:tst-app-kyle"]
    }
  }
}