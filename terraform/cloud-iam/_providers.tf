# provider configuration for google providers
provider "google" {
  region = var.region
  zone   = var.zone
  # merge takes an arbitrary number of maps or objects, and returns a single map or object that contains a merged set of elements from all arguments.
  default_labels = merge(local.labels,
    {
      cost_center = "10101"
  })
}

provider "google-beta" {
  region = var.region
  zone   = var.zone
}
