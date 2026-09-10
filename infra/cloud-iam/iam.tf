# resource blocks to deploy the infrastructure resources
resource "google_project_iam_member" "project_access" {
  for_each = local.project_access
  # In Terraform, a map key's value can be accessed using both dot notation (map.key) and bracket notation (map["key"]). Dot notation has some limitations.
  project = local.project_id
  role    = each.value.role
  member  = each.value["member"]
}
