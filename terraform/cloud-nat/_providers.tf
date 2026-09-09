# Provider block to configure GCP Provider
provider "google" {
  project = var.project_id
  region  = var.resource_region # If another region/zone is specified in a resource configuration, that will take precedence.

  credentials = file("tf-svc-account-key.json")
  #credentials = "path_to_file/keyfile.json"  #Use for local testing on Linux/Mac
  #credentials = file("path_to_file/keyfile.json") #Use for local testing on Windows
}

/*
To use the google-beta provider, simply set the provider field on each resource where you want to
use google-beta. If the provider field is omitted, Terraform will implicitly use the google provider
by default even if you have only defined a google-beta provider block.
Terraform recommends that you set provider = google even though it is the default, for clarity.
*/

provider "google-beta" {
  project = var.project_id
  region  = var.resource_region # If another region/zone is specified in a resource configuration, that will take precedence.

  credentials = file("tf-svc-account-key.json")
  #credentials = "path_to_file/keyfile.json"  #Use for local testing on Linux/Mac
  #credentials = file("path_to_file/keyfile.json") #Use for local testing on Windows
}
