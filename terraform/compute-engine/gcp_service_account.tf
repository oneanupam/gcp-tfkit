# Resource block to deploy Service Account
resource "google_service_account" "dev_vm_svcacc" {
  display_name = "${var.gce_name}-service-account"
  account_id   = "${var.gce_name}-service-account"
  description  = "A service account that only ${var.gce_name} can use."
}

resource "google_project_iam_member" "dev_vm_roles" {
  project  = var.project_id
  for_each = var.sa_permissions
  role     = each.value
  member   = "serviceAccount:${google_service_account.dev_vm_svcacc.email}"
}

/*
resource "google_project_iam_member" "dev_vm01_role01" {
  project = var.project_id
  role    = "roles/logging.logWriter"
  member  = "serviceAccount:${google_service_account.dev_vm_svcacc.email}"
}

resource "google_project_iam_member" "dev_vm01_role02" {
  project = var.project_id
  role    = "roles/monitoring.metricWriter"
  member  = "serviceAccount:${google_service_account.dev_vm_svcacc.email}"
}

resource "google_project_iam_member" "dev_vm01_role03" {
  project = var.project_id
  role    = "roles/compute.admin"
  member  = "serviceAccount:${google_service_account.dev_vm_svcacc.email}"
}
*/