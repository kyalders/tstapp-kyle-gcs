resource "google_dns_managed_zone" "artifact-registry-zone" {
  name        = "artifact-registry"
  dns_name    = "pkg.dev."
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

resource "google_dns_record_set" "artifact-registry-cname" {
  name         = "*.pkg.dev"
  managed_zone = google_dns_managed_zone.artifact-registry-zone.dns_name
  type         = "CNAME"
  ttl          = 300

  rrdatas = ["pkg.dev."]
}