# Resource block to create Global Public IP Address for L7-ELB
resource "google_compute_global_address" "dev_l7elb_eip" {
  project = var.project_id

  name         = "dev-l7elb-eip"
  ip_version   = "IPV4"
  address_type = "EXTERNAL"
}

# Resource block to reserve static Internal IP Address for Internal HTTP Balancer
resource "google_compute_address" "dev_l7ilb_iip" {
  project = var.project_id

  name   = join("", ["l7ilb", "-iip"])
  region = var.resource_region

  address_type = "INTERNAL"
  address      = "10.0.1.10"
  subnetwork   = google_compute_subnetwork.dev_vpc01_subnet01.id
}
