# Resource block to deploy Proxy-Only Subnet for L7-ILB
resource "google_compute_subnetwork" "dev_l7ilb_proxyonly_subnet" {
  provider = google-beta

  name          = "dev-l7ilb-proxy-subnet"
  ip_cidr_range = "10.0.2.0/24"
  region        = var.resource_region
  purpose       = "INTERNAL_HTTPS_LOAD_BALANCER"
  role          = "ACTIVE"
  network       = google_compute_network.dev_vpc01.id
}

# Resource block to create regional HTTP Forwarding Rule for L7-ILB
resource "google_compute_forwarding_rule" "dev_l7ilb_http_forwarding_rule" {
  name       = "dev-l7ilb-http-forwarding-rule"
  region     = var.resource_region
  network    = google_compute_network.dev_vpc01.id
  # The subnetwork that the load balanced IP should belong to for this Forwarding Rule. 
  # This field is only used for INTERNAL load balancing.
  subnetwork = google_compute_subnetwork.dev_vpc01_subnet01.id

  ip_protocol           = "TCP"
  port_range            = "80"
  load_balancing_scheme = "INTERNAL_MANAGED"

  target       = google_compute_region_target_http_proxy.dev_l7ilb_http_proxy.id
  ip_address   = google_compute_address.dev_l7ilb_iip.address

  depends_on = [google_compute_subnetwork.dev_l7ilb_proxyonly_subnet]
}

# Resource block to create regional HTTP Proxy for L7-ILB
resource "google_compute_region_target_http_proxy" "dev_l7ilb_http_proxy" {
  name    = "dev-l7ilb-http-proxy"
  region  = var.resource_region
  url_map = google_compute_region_url_map.dev_l7ilb_url_map.id
}

# Resource Block to create regional URL Maps for L7-ILB
resource "google_compute_region_url_map" "dev_l7ilb_url_map" {
  name            = "dev-l7ilb-url-map"
  region          = var.resource_region
  default_service = google_compute_region_backend_service.dev_l7ilb_backend_service.id
}

# Resource block to create regional Backend Service for L7-ILB
resource "google_compute_region_backend_service" "dev_l7ilb_backend_service" {
  name   = "dev-l7ilb-backend-service"
  region = var.resource_region

  protocol              = "HTTP"
  port_name             = "http" # named port of instance group
  timeout_sec           = 10
  load_balancing_scheme = "INTERNAL_MANAGED"

  backend {
    group           = resource.google_compute_instance_group.dev_umig.self_link
    balancing_mode  = "UTILIZATION"
    capacity_scaler = 1.0
    max_utilization = 0.8
  }

  session_affinity = "NONE"
  health_checks    = [resource.google_compute_region_health_check.dev_health_check_regional.id]
}