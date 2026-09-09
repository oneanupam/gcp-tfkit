# Terraform block to setup tf and provider version requirements
terraform {
  required_version = "~> 1.15.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 8.2.0"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "~> 8.2.0"
    }
  }
}
