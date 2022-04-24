resource "google_dns_managed_zone" "artifact_registry" {
  name        = "artifact-registry"
  dns_name    = "pkg.dev"
  description = "artifact-registry zone"
  labels = {
  }

  visibility = "private"

  private_visibility_config {
    networks {
      network_url = module.vpc.network_name
    }
  }
}

resource "google_dns_record_set" "artifact_registry_cname" {
  name         = "*.pkg.dev"
  managed_zone = google_dns_managed_zone.artifact_registry.dns_name
  type         = "CNAME"
  ttl          = 300

  rrdatas = ["pkg.dev."]
}