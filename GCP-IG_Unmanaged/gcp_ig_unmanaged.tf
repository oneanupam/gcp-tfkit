# Resource block to create Unmanaged Instance Group
resource "google_compute_instance_group" "dev_umig" {
  project = var.project_id

  name    = var.umig_name
  zone    = var.resource_zone

  instances = [
    resource.google_compute_instance.dev_gce[0].self_link,
    resource.google_compute_instance.dev_gce[1].self_link,
  ]

  named_port {
    name = "port01"
    port = 80
  }
  named_port {
    name = "port02"
    port = 81
  }
}