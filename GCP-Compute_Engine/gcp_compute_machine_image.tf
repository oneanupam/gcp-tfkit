# Resource block to create machine image
resource "google_compute_image" "dev_machineimage01" {
  project = "agile-antler-321814"

  count       = var.create_image == true ? 1 : 0
  name        = var.dev_machine_image["name"]
  family      = var.dev_machine_image["family"]
  source_disk = var.dev_machine_image["source_disk"]
  labels      = var.resource_labels
}

/*
locals {
  custdate = formatdate("YYYYMMDDhhmmss", timestamp())
}

resource "google_compute_image" "dev_machineimage01" {
  project = "agile-antler-321814"

  count       = var.create_image == true ? 1 : 0
  name        = "fdn-dev-mi-${local.custdate}"
  family      = var.dev_machine_image["family"]
  source_disk = var.dev_machine_image["source_disk"]

  lifecycle {
    ignore_changes = [name]
  }
}

resource "google_compute_machine_image" "dev_machineimage01" {
  provider        = google-beta

  name            = "fdn-dev-mi-01"
  source_instance = google_compute_instance.dev_vm01.self_link
}
*/
