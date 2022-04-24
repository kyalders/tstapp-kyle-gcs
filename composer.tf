resource "google_dns_managed_zone" "artifact-registry" {
  name        = "artifact-registry"
  dns_name    = "pkg.dev"
  description = ""
  labels = {
  }

  visibility = "private"

  private_visibility_config {
    networks {
      network_url = google_compute_network.network-1.id
    }
  }
}

resource "google_dns_record_set" "artifact-registry-cname" {
  name         = "*.pkg.dev"
  managed_zone = google_dns_managed_zone.artifact-registry.dns_name}
  type         = "CNAME"
  ttl          = 300

  rrdatas = ["pkg.dev."]
}