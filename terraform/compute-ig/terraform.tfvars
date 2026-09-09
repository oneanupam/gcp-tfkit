# Variable Definition - Project, Location, Labels
project_id      = "our-pursuit-321814"
resource_region = "us-central1"
resource_zone   = "us-central1-a"
resource_zone_2 = "us-central1-b"

# Variable Definition - IaaS Resources
vpc01_name         = "fdn-dev-vpc01"
vpc01_subnets_name = ["fdn-dev-vpc01-snet01", "fdn-dev-vpc01-snet02"]
vpc01_subnets_cidr = ["10.0.1.0/24", "10.0.5.0/24"]

gce_name         = "fdn-dev-vm"
gce_machine_type = "n1-standard-1"
umig_name        = "fdn-dev-umig"