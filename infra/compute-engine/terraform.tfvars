# Variable Definition - Project, Location, Labels
project_id      = "our-pursuit-321814"
resource_region = "us-central1"
resource_zone   = "us-central1-a"
resource_zone_2 = "us-central1-b"
sa_permissions = {
  "compute_role"    = "roles/compute.admin"
  "storage_role"    = "roles/storage.admin"
  "network_role"    = "roles/compute.networkUser"
  "monitoring_role" = "roles/monitoring.metricWriter"
  "logging_role"    = "roles/logging.logWriter"
}

# Variable Definition - IaaS Resources
vpc01_name         = "fdn-dev-vpc01"
vpc01_subnets_name = ["fdn-dev-vpc01-snet01", "fdn-dev-vpc01-snet02"]
vpc01_subnets_cidr = ["10.0.1.0/24", "10.0.5.0/24"]

gce_name         = "fdn-dev-vm"
gce_machine_type = "n1-standard-1"

compute_engine = {
  vm_01 = {
    gce_name = "fdn-dev-vm-01"
    gce_zone = "us-central1-a"
  }
  vm_02 = {
    gce_name = "fdn-dev-vm-02"
    gce_zone = "us-central1-b"
  }
}

it_name    = "fdn-dev-it"
it_version = "v100"

create_image = true
dev_machine_image = {
  name        = "fdn-dev-mi-01"
  family      = "fdn-dev-vm-family"
  source_disk = "https://www.googleapis.com/compute/v1/projects/agile-antler-321814/zones/asia-east1-a/disks/golden-vm-01"
}
