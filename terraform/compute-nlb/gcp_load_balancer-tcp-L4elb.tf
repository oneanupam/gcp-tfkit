/*
Google Cloud Platform (GCP) Network Load Balancers distributes traffic among VM instances 
in the same region in a VPC network.
*/

# Resources required for L4 External TCP/UDP Load Balancer

# Resource block to deploy regional forwarding rule.
resource "google_compute_forwarding_rule" "dev_l4elb_tcp_forwarding_rule" {
  project = var.project_id

  name   = "dev-l4elb-tcp-forwarding-rule"
  region = var.resource_region

  port_range            = "80"
  ip_address            = google_compute_address.dev_l4elb_eip.address
  ip_protocol           = "TCP"
  load_balancing_scheme = "EXTERNAL"

  # Use this for Backend Service
  backend_service = google_compute_region_backend_service.dev_l4elb_backend_service.self_link

  # Use this for Target Pool
  # target = google_compute_target_pool.dev_l4elb_target_pool.self_link
}

# Resource block to deploy regional backend service
resource "google_compute_region_backend_service" "dev_l4elb_backend_service" {
  name                  = "dev-l4elb-backend-service"
  region                = var.resource_region
  load_balancing_scheme = "EXTERNAL"
  protocol              = "TCP"

  backend {
    group = resource.google_compute_instance_group.dev_umig.self_link
  }

  session_affinity = "NONE"
  health_checks    = [google_compute_region_health_check.dev_health_check_regional.id]
}

/*
# Resource block to deploy target pool
resource "google_compute_target_pool" "dev_l4elb_target_pool" {
  project = var.project_id

  name   = "dev-l4elb-target-pool"
  region = var.resource_region

  instances = [
    resource.google_compute_instance.dev_gce01.self_link
  ]

  session_affinity = "NONE"
  health_checks    = [google_compute_http_health_check.dev_health_check_legacy.id]
}
*/