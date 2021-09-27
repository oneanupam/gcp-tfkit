# Resource block to reserve regional External IP Address for Network Load Balancer
resource "google_compute_address" "dev_l4elb_eip" {
  project = var.project_id

  name   = join("", ["l4elb", "-eip"])
  region = var.resource_region

  address_type = "EXTERNAL"
  network_tier = "PREMIUM"
}

# Resource block to reserve static Internal IP Address for Internal Load Balancer
resource "google_compute_address" "dev_l4ilb_iip" {
  project = var.project_id

  name   = join("", ["l4ilb", "-iip"])
  region = var.resource_region

  address_type = "INTERNAL"
  address      = "10.0.1.10"
  subnetwork   = google_compute_subnetwork.dev_vpc01_subnet01.id
}