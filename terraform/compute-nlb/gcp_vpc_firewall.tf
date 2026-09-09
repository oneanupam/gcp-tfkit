# Resource block to deploy VPC Firewall
resource "google_compute_firewall" "iap_ingress_fw" {
  name    = "allow-ingress-from-iap"
  network = google_compute_network.dev_vpc01.id

  priority  = 300
  direction = "INGRESS"

  allow {
    protocol = "tcp"
    ports    = ["22", "3389"]
  }

  source_ranges = ["35.235.240.0/20"]
  target_tags   = []
}

resource "google_compute_firewall" "allow_health_checks_fw" {
  name    = "allow-health-checks-from-probers"
  network = google_compute_network.dev_vpc01.id

  priority  = 305
  direction = "INGRESS"

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["35.191.0.0/16", "130.211.0.0/22"]
  target_tags   = []
}

resource "google_compute_firewall" "allow_health_checks_fw_legacy" {
  name    = "allow-health-checks-from-probers-legacy"
  network = google_compute_network.dev_vpc01.id

  priority  = 305
  direction = "INGRESS"

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["209.85.152.0/22", "209.85.204.0/22"]
  target_tags   = []
}

resource "google_compute_firewall" "http_https_ingress_fw" {
  name    = "allow-http-https-inbound"
  network = google_compute_network.dev_vpc01.id

  priority  = 310
  direction = "INGRESS"

  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = []
}