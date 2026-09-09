# Variable Definition - Project, Location, Labels
project_id      = "our-pursuit-321814"
resource_region = "us-central1"
resource_zone   = "us-central1-a"
resource_zone_2 = "us-central1-b"

resource_region2       = "us-east1"
resource_region2_zone1 = "us-east1-b"
resource_region2_zone2 = "us-east1-c"

# Variable Definition - IaaS Resources
vpc01_name         = "fdn-dev-vpc01"
vpc01_subnets_name = ["fdn-dev-vpc01-snet01", "fdn-dev-vpc01-snet02"]
vpc01_subnets_cidr = ["10.0.1.0/24", "10.0.5.0/24"]

vpc02_name         = "fdn-dev-vpc02"
vpc02_subnets_name = ["fdn-dev-vpc02-snet01", "fdn-dev-vpc02-snet02"]
vpc02_subnets_cidr = ["10.0.10.0/24", "10.0.15.0/24"]

gce_name         = "fdn-dev-vm"
gce_machine_type = "n1-standard-1"

it_name    = "fdn-dev-it"
it_version = "v1-0-1"

zmig_name = "fdn-dev-zmig"
rmig_name = "fdn-dev-rmig"
umig_name = "fdn-dev-umig"