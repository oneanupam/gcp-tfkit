# Resource block to create Unmanaged Instance Group
resource "google_compute_instance_group" "dev_umig" {
  project = var.project_id

  name    = var.umig_name
  zone    = var.resource_zone
  network = google_compute_network.dev_vpc01.id

  instances = [resource.google_compute_instance.dev_gce01.self_link]

  named_port {
    name = "http"
    port = 80
  }
}