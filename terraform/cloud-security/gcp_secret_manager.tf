# Resource block to create secret in Secret Manager
resource "google_secret_manager_secret" "dev_sql_secret" {
  project   = var.project_id
  secret_id = "fdv-dev-sql01-secret"

  replication {
    automatic = true
  }
}

# Resource block to store secret value in Secret Manager
resource "google_secret_manager_secret_version" "dev_sql_secret_version" {
  secret      = google_secret_manager_secret.dev_sql_secret.id
  secret_data = random_string.dev_sql_instance_pwd.result
  enabled     = true
}
