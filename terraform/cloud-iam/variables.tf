# Variable definitions
variable "region" {
  type        = string
  description = "the region to house the infrastrcuture resources"
  default     = "europe-west2"
}

variable "zone" {
  type        = string
  description = "the zone to deploy the infrastructure resources"
  default     = "europe-west2-a"
}

variable "project_access" {
  type        = map(list(string))
  description = "the collection of role and members for access"
}
