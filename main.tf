
resource "google_compute_instance" "http_server" {
  project      = "${var.project_id}"
  zone         = "us-east4-b"
  name         = "${var.env}-apache2-instance"
  machine_type = "f1-micro"
  allow_stopping_for_update = true

  metadata_startup_script = "sudo apt-get update && sudo apt-get install apache2 -y && echo '<html><body><h1>Environment: ${var.env}</h1></body></html>' | sudo tee /var/www/html/index.html"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    #subnetwork = "default"
    subnetwork = module.vpc.subnets_names[0]

    access_config {
      # Include this section to give the VM an external ip address
    }
  }

  # Apply the firewall rule to allow external IPs to access this instance
  tags = ["http-server"]
}

module "vpc" {
  source  = "terraform-google-modules/network/google"
  version = "3.3.0"

  project_id   = "${var.project_id}"
  network_name = "${var.env}-network"

  subnets = [
    {
      subnet_name   = "${var.env}-subnet-01"
      subnet_ip     = "10.${var.env == "dev" ? 10 : 20}.10.0/24"
      subnet_region = "us-east4"
    },
  ]

  secondary_ranges = {
    "${var.env}-subnet-01" = []
  }
}
  
 resource "google_compute_firewall" "allow-http" {
  name    = "${module.vpc.network_name}-allow-http"
  network = module.vpc.network_name
  project = "${var.project_id}"

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  target_tags   = ["http-server2"]
  source_ranges = ["0.0.0.0/0"]
}
