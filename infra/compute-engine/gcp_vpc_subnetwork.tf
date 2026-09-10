# Resource block to deploy SubNetworks
resource "google_compute_subnetwork" "dev_vpc01_subnet01" {
  name                     = var.vpc01_subnets_name[0]
  ip_cidr_range            = var.vpc01_subnets_cidr[0]
  region                   = var.resource_region
  private_ip_google_access = true

  network = google_compute_network.dev_vpc01.id
}

# Resource specific outputs | Subnet01 Outputs
output "dev_vpc01_subnet01_id" {
  value = google_compute_subnetwork.dev_vpc01_subnet01.id
}
