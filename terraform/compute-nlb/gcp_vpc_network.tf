# Resource block to deploy VPC Network
resource "google_compute_network" "dev_vpc01" {
  project = var.project_id

  name        = var.vpc01_name
  description = "Virtual Network: ${var.vpc01_name} | Purpose: Testing"

  routing_mode                    = "GLOBAL"
  auto_create_subnetworks         = false
  delete_default_routes_on_create = false
}

# Resource specific outputs | VPC01 Outputs
output "dev_vpc01_id" {
  value = google_compute_network.dev_vpc01.id
}