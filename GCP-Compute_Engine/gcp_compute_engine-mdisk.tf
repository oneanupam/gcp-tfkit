# Resoure block to deploy Google Compute Engine
resource "google_compute_instance_from_template" "dev_vm" {
  for_each = var.compute_engine
  project  = var.project_id

  name = each.value.gce_name
  zone = each.value.gce_zone

  source_instance_template = google_compute_instance_template.dev_instance_template.id
}

