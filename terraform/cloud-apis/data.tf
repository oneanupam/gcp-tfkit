# Data block to get the existing project id and export the GCP project in env variable
# export GOOGLE_CLOUD_PROJECT=$(gcloud config get-value project)
data "google_project" "current_project" {
  # Passing nothing, it will get the value from GCP auth variables
}
