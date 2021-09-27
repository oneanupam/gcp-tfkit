# Data block to get the OS Image self link
# List available images using - gcloud compute images list
data "google_compute_image" "dev_windows_server_2019_core" {
  family  = "windows-2019-core"
  project = "windows-cloud"
}

data "google_compute_image" "dev_centos_7" {
  family  = "centos-7"
  project = "centos-cloud"
}

data "google_compute_image" "dev_rhel_7" {
  family  = "rhel-7"
  project = "rhel-cloud"
}