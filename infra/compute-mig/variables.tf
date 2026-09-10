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

variable "sa_permissions" {}

# Variable Declaration - IaaS (VPC Network, SubNetwork, Cloud VPN, GCE)
variable "vpc01_name" {}
variable "vpc01_subnets_name" {}
variable "vpc01_subnets_cidr" {}

variable "it_name" {}
variable "it_version" {}

variable "it2_name" {}
variable "it2_version" {}

variable "zmig_name" {}
variable "rmig_name" {}
