resource "google_dns_managed_zone" "artifact-registry-zone" {
  project     = var.project_id
  name        = "artifact-registry"
  dns_name    = "pkg.dev."
  description = "artifact-registry zone"
  labels = {
  }

  visibility = "private"

  private_visibility_config {
    networks {
      network_url = module.vpc.network_self_link
    }
  }
  depends_on = [
    module.vpc
  ]
}

resource "google_dns_record_set" "artifact-registry-cname" {
  project      = var.project_id
  name         = "*.pkg.dev."
  managed_zone = google_dns_managed_zone.artifact-registry-zone.name
  type         = "CNAME"
  ttl          = 300

  rrdatas = ["pkg.dev."]

  depends_on = [
    resource.google_dns_managed_zone.artifact-registry-zone
  ]
}

resource "google_dns_record_set" "artifact-registry-a" {
  project      = var.project_id
  name         = "pkg.dev."
  managed_zone = google_dns_managed_zone.artifact-registry-zone.name
  type         = "A"
  ttl          = 300

  rrdatas = ["199.36.153.4",
    "199.36.153.5",
    "199.36.153.6",
    "199.36.153.7",
  ]

  depends_on = [
    resource.google_dns_managed_zone.artifact-registry-zone
  ]
}

resource "google_dns_managed_zone" "composer-private-access-zone" {
  project     = var.project_id
  name        = "composer-private-access"
  dns_name    = "composer.cloud.google.com."
  description = "composer-private-access zone"
  labels = {
  }

  visibility = "private"

  private_visibility_config {
    networks {
      network_url = module.vpc.network_self_link
    }
  }
  depends_on = [
    module.vpc
  ]
}

resource "google_dns_record_set" "composer-private-access-cname" {
  project      = var.project_id
  name         = "*.composer.cloud.google.com."
  managed_zone = google_dns_managed_zone.composer-private-access-zone.name
  type         = "CNAME"
  ttl          = 300

  rrdatas = ["composer.cloud.google.com."]

  depends_on = [
    resource.google_dns_managed_zone.composer-private-access-zone
  ]
}

resource "google_dns_record_set" "composer-private-access-a" {
  project      = var.project_id
  name         = "composer.cloud.google.com."
  managed_zone = google_dns_managed_zone.composer-private-access-zone.name
  type         = "A"
  ttl          = 300

  rrdatas = ["199.36.153.4",
    "199.36.153.5",
    "199.36.153.6",
    "199.36.153.7",
  ]

  depends_on = [
    resource.google_dns_managed_zone.composer-private-access-zone
  ]
}

resource "google_dns_managed_zone" "container-registry-zone" {
  project     = var.project_id
  name        = "container-registry"
  dns_name    = "gcr.io."
  description = "container-registry zone"
  labels = {
  }

  visibility = "private"

  private_visibility_config {
    networks {
      network_url = module.vpc.network_self_link
    }
  }
  depends_on = [
    module.vpc
  ]
}

resource "google_dns_record_set" "container-registry-cname" {
  project      = var.project_id
  name         = "*.gcr.io."
  managed_zone = google_dns_managed_zone.container-registry-zone.name
  type         = "CNAME"
  ttl          = 300

  rrdatas = ["gcr.io."]

  depends_on = [
    resource.google_dns_managed_zone.container-registry-zone
  ]
}

resource "google_dns_record_set" "container-registry-a" {
  project      = var.project_id
  name         = "gcr.io."
  managed_zone = google_dns_managed_zone.container-registry-zone.name
  type         = "A"
  ttl          = 300

  rrdatas = ["199.36.153.4",
    "199.36.153.5",
    "199.36.153.6",
    "199.36.153.7",
  ]

  depends_on = [
    resource.google_dns_managed_zone.container-registry-zone
  ]
}

resource "google_dns_managed_zone" "private-google-access-zone" {
  project     = var.project_id
  name        = "private-google-access"
  dns_name    = "googleapis.com."
  description = "private-google-access zone"
  labels = {
  }

  visibility = "private"

  private_visibility_config {
    networks {
      network_url = module.vpc.network_self_link
    }
  }
  depends_on = [
    module.vpc
  ]
}

resource "google_dns_record_set" "private-google-access-cname" {
  project      = var.project_id
  name         = "*.googleapis.com."
  managed_zone = google_dns_managed_zone.private-google-access-zone.name
  type         = "CNAME"
  ttl          = 300

  rrdatas = ["restricted.googleapis.com."]

  depends_on = [
    resource.google_dns_managed_zone.private-google-access-zone
  ]
}

resource "google_dns_record_set" "private-google-access-a" {
  project      = var.project_id
  name         = "restricted.googleapis.com."
  managed_zone = google_dns_managed_zone.private-google-access-zone.name
  type         = "A"
  ttl          = 300

  rrdatas = ["199.36.153.4",
    "199.36.153.5",
    "199.36.153.6",
    "199.36.153.7",
  ]

  depends_on = [
    resource.google_dns_managed_zone.private-google-access-zone
  ]
}
