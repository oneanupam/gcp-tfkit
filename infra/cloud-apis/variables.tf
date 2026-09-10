# Variables definition
variable "region" {
  type        = string
  description = "The region of the google cloud to deploy the resources"
  default     = "europe-west2"
}

variable "zone" {
  type        = string
  description = "The zone to deploy the gcp resources"
  default     = "europe-west2-a"
}
