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

# Variable Declaration - Security Resources
variable "keyring_name" {}
variable "keyring_location" {}
variable "key_name" {}
