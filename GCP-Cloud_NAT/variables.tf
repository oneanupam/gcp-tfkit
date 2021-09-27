# Variable Declaration - Project, Region, Zone, Labels
variable "project_id" {}
variable "resource_region" {}
variable "resource_zone" {}
variable "resource_zone_2" {}
variable "resource_region2" {}
variable "resource_region2_zone1" {}
variable "resource_region2_zone2" {}

variable "resource_labels" {
  description = "Resource Labels"
  default = {
    "env"     = "dev"
    "project" = "foundation"
  }
}

# Variable Declaration - IaaS (VPC Network, SubNetwork, Cloud VPN, GCE)
variable "vpc01_name" {}
variable "vpc01_subnets_name" {}
variable "vpc01_subnets_cidr" {}

variable "vpc02_name" {}
variable "vpc02_subnets_name" {}
variable "vpc02_subnets_cidr" {}

variable "gce_name" {}
variable "gce_machine_type" {}

variable "gcs_bucket_name" {}

variable "it_name" {}
variable "it_version" {}

variable "zmig_name" {}
variable "rmig_name" {}
variable "umig_name" {}
