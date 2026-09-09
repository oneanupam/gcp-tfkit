# Resource block to deploy Service Account
resource "google_service_account" "dev_vm_svcacc" {
  display_name = "dev-vm-service-account"
  account_id   = "dev-vm-service-account"
  description  = "A service account that only dev-vm can use."

}

resource "google_project_iam_member" "dev_vm_role" {
  project = var.project_id
  role    = "roles/secretmanager.viewer"
  member  = "serviceAccount:${google_service_account.dev_vm_svcacc.email}"
}