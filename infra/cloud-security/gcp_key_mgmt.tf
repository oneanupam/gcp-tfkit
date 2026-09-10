/*
A full list of valid locations can be found by running >> gcloud kms locations list
*/

# Resource block to deploy Key Ring
resource "google_kms_key_ring" "dev_keyring01" {
  project  = var.project_id

  name     = var.keyring_name
  location = var.keyring_location
}

# Resource block to create a key
resource "google_kms_crypto_key" "dev_keyring01_key01" {
  name            = var.key_name
  key_ring        = google_kms_key_ring.dev_keyring01.id
  rotation_period = "100000s"

  version_template {
    algorithm        = "GOOGLE_SYMMETRIC_ENCRYPTION"
    protection_level = "SOFTWARE"
  }

  labels = var.resource_labels

  # Lifecycle hooks to prevent accidental destruction.
  lifecycle {
    prevent_destroy = true
  }
}
