# Provider block for provider configuration
provider "google" {
  region = var.region
}

provider "google-beta" {
  region = var.region
}
