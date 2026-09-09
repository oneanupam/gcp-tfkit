# Enable required apis in google project
resource "google_project_service" "enable_api" {
  for_each = toset(local.api_list)

  project                    = local.project_id
  service                    = each.value
  disable_on_destroy         = true
  disable_dependent_services = true
}

resource "google_project_service_identity" "dataplex_service_agent" {
  provider = google-beta

  project = local.project_id
  service = "dataplex.googleapis.com"
}
