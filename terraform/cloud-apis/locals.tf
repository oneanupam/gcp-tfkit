# Locals block to configure the resubale values
locals {
  project_id = data.google_project.current_project.project_id
  api_list = [
    "dataplex.googleapis.com"
  ]
}
