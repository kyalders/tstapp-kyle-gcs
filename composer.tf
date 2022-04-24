module "composer_service_account" {
  source     = "terraform-google-modules/service-accounts/google"
  version    = "~> 3.0"
  project_id = var.project_id
  prefix     = "composer-sa"
  names      = ["first", "second"]
  project_roles = ["${var.project_id}=>roles/composer.worker",
  "${var.project_id}=>roles/iam.serviceAccountUser"]
}

resource "google_dns_managed_zone" "artifact-registry-zone" {
  name        = "artifact-registry"
  dns_name    = "pkg.dev."
  description = "artifact-registry zone"
  labels = {
  }

  visibility = "private"

  private_visibility_config {
    networks {
      network_url = module.vpc.network_id
    }
  }
}

resource "google_dns_record_set" "artifact-registry-cname" {
  name         = "*.pkg.dev."
  managed_zone = google_dns_managed_zone.artifact-registry-zone.dns_name
  type         = "CNAME"
  ttl          = 300

  rrdatas = ["pkg.dev."]
}