#Firewall rule 
resource "google_compute_firewall" "allow-http" {
  name    = "${module.vpc.network_name}-allow-http"
  network = module.vpc.network_name
  project = var.project_id

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  target_tags   = ["http-server"]
  source_ranges = ["0.0.0.0/0"]
}


resource "google_compute_firewall" "allow-ssh" {
  name    = "${module.vpc.network_name}-allow-ssh"
  network = module.vpc.network_name
  project = var.project_id

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  target_tags   = ["http-server"]
  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "allow-gke-ingress" {
  name    = "${module.vpc.network_name}-allow-gke-ingress"
  network = module.vpc.network_name
  project = var.project_id

  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }

  target_tags   = ["http-server"]
  source_ranges = ["130.211.0.0/22", "35.91.0.0/16"]
}