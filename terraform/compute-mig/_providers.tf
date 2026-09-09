# Provider block to configure GCP Provider
provider "google" {
  project = var.project_id
  region  = var.resource_region

  credentials = file("${path.module}/credentials/tf-svc-account-key.json")
}

provider "google-beta" {
  project = var.project_id
  region  = var.resource_region

  credentials = file("${path.module}/credentials/tf-svc-account-key.json")
}
