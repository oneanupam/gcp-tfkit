# Resource block to deploy VPC Network
resource "google_compute_network" "dev_vpc01" {
  project = var.project_id

  name        = var.vpc01_name
  description = "Virtual Network: ${var.vpc01_name} | Purpose: Testing"

  routing_mode                    = "GLOBAL"
  auto_create_subnetworks         = false
  delete_default_routes_on_create = false
}

# Resource block to deploy SubNetworks
resource "google_compute_subnetwork" "dev_vpc01_subnet01" {
  name                     = var.vpc01_subnets_name[0]
  ip_cidr_range            = var.vpc01_subnets_cidr[0]
  region                   = var.resource_region
  private_ip_google_access = true

  network = google_compute_network.dev_vpc01.id
}

# Resource specific outputs | VPC01 Outputs
output "dev_vpc01_id" {
  value = google_compute_network.dev_vpc01.id
}
output "dev_vpc01_self_link" {
  value = google_compute_network.dev_vpc01.self_link
}

# Resource specific outputs | Subnet01 Outputs
output "dev_vpc01_subnet01_id" {
  value = google_compute_subnetwork.dev_vpc01_subnet01.id
}