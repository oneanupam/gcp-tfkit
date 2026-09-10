# Resource block to create Global HTTP Forwarding Rule for L7-ELB
resource "google_compute_global_forwarding_rule" "dev_l7elb_http_forwarding_rule" {
  project = var.project_id
  name    = "dev-l7elb-http-forwarding-rule"

  ip_protocol           = "TCP"
  port_range            = "80"
  load_balancing_scheme = "EXTERNAL"

  target     = google_compute_target_http_proxy.dev_l7elb_http_proxy.self_link
  ip_address = google_compute_global_address.dev_l7elb_eip.address
}

# Resource block to create Global HTTP Proxy for L7-ELB
resource "google_compute_target_http_proxy" "dev_l7elb_http_proxy" {
  project = var.project_id

  name    = "dev-l7elb-http-proxy"
  url_map = google_compute_url_map.dev_l7elb_url_map.id
}

# Resource Block to create Global URL Maps for L7-ELB
resource "google_compute_url_map" "dev_l7elb_url_map" {
  project = var.project_id

  name            = "dev-l7elb-url-map"
  default_service = google_compute_backend_service.dev_l7elb_backend_service.self_link

  /*
  host_rule {
    hosts        = ["mysite.com"]
    path_matcher = "allpaths"
  }

  path_matcher {
    name            = "allpaths"
    default_service = google_compute_backend_service.dev_l7elb_backend_service.self_link

    path_rule {
      paths   = ["/*"]
      service = google_compute_backend_service.dev_l7elb_backend_service.self_link
    }
  }
  */
}

# Resource block to create Global Backend Service for L7-ELB
resource "google_compute_backend_service" "dev_l7elb_backend_service" {
  project = var.project_id
  name    = "dev-l7elb-backend-service"

  protocol              = "HTTP"
  port_name             = "http" # named port of instance group
  timeout_sec           = 30
  load_balancing_scheme = "EXTERNAL"

  backend {
    group           = resource.google_compute_instance_group.dev_umig.self_link
    balancing_mode  = "UTILIZATION"
    capacity_scaler = 1.0
    max_utilization = 0.8
  }

  session_affinity = "NONE"
  health_checks    = [google_compute_health_check.dev_health_check_global.id]
}
