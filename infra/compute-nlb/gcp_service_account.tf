# Resource block to deploy Service Account
resource "google_service_account" "dev_vm01_svcacc" {
  display_name = "dev-vm01-service-account"
  account_id   = "dev-vm01-service-account"
  description  = "A service account that only dev-vm01 can use."

}

resource "google_project_iam_member" "dev_vm01_role" {
  project = var.project_id
  role    = "roles/secretmanager.viewer"
  member  = "serviceAccount:${google_service_account.dev_vm01_svcacc.email}"
}
