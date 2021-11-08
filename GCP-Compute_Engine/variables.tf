# Variable Declaration - Project, Region, Zone, Labels
variable "project_id" {}
variable "resource_region" {}
variable "resource_zone" {}
variable "resource_zone_2" {}

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

variable "gce_name" {}
variable "gce_machine_type" {}

variable "compute_engine" {
  type = map(any)
}
variable "it_name" {}
variable "it_version" {}

variable "create_image" {
  type = bool
}
variable "dev_machine_image" {
  type = map(any)
}