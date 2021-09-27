/*
Google Cloud Platform (GCP) Internal TCP/UDP Load Balancers distributes traffic among VM instances
in the same region in a VPC network using a private, internal (RFC 1918) IP address.
*/

# Resources required for L4 Internal TCP/UDP Load Balancer aka Internal Load Balancer

# Resource block to deploy regional forwarding rule.
resource "google_compute_forwarding_rule" "dev_l4ilb_tcp_forwarding_rule" {
  project = var.project_id

  name    = "dev-l4ilb-tcp-forwarding-rule"
  region  = var.resource_region
  network = google_compute_network.dev_vpc01.id
  # The subnetwork that the load balanced IP should belong to for this Forwarding Rule. 
  # This field is only used for INTERNAL load balancing.
  subnetwork = google_compute_subnetwork.dev_vpc01_subnet01.id

  ip_protocol           = "TCP"
  ports                 = ["80"]
  load_balancing_scheme = "INTERNAL"
  # For regional forwarding rules, the address must live in the same region as the forwarding rule. 
  # If you don't specify a reserved IP address, an ephemeral IP address is assigned. 
  ip_address = google_compute_address.dev_l4ilb_iip.address
  # If true, clients can access ILB from all regions. Otherwise only allows from the local 
  # region the ILB is located at.
  allow_global_access = false

  backend_service = google_compute_region_backend_service.dev_l4ilb_backend_service.self_link
}

# Resource block to deploy regional backend service.
resource "google_compute_region_backend_service" "dev_l4ilb_backend_service" {
  project = var.project_id

  name     = "dev-l4ilb-backend-service"
  region   = var.resource_region
  protocol = "TCP"

  backend {
    group = resource.google_compute_instance_group.dev_umig.self_link
  }

  session_affinity = "NONE"
  health_checks    = [google_compute_health_check.dev_health_check_global.id]
}
