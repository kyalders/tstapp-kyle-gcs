terraform {
  #required_version = "~>1.1.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 3.0.0, < 5.0.0"
    }

    google-beta = {
      source  = "hashicorp/google-beta"
      version = ">= 3.0.0, < 5.0.0"
    }
  }

  backend "remote" {
    organization = "kylesbx"

    workspaces {
      prefix = "tstapp-kyle-gcs-"
    }
  }



}


provider "google" {
  project = var.project_id
}

provider "google-beta" {
  project = var.project_id
}
