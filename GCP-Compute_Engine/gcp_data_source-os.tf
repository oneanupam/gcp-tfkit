/*
List available images using - gcloud compute images list
*/

# Data block to get the OS Image self link | Custom Machine Image
/*
data "google_compute_image" "dev_custom_rhel_7" {
  # family  =  "fdn-dev-vm-family" # "rhel-7"
  name    = google_compute_image.dev_machineimage01[0].name    # "rhel-7-v20200403" # "fdn-dev-mi-01"
  project = google_compute_image.dev_machineimage01[0].project # "rhel-cloud"      # "agile-antler-321814"

  # depends_on = [google_compute_image.dev_machineimage01]
}
*/

/*
# Data block to get the OS Image self link | Public Images
data "google_compute_image" "dev_windows_server_2019_core" {
  family  = "windows-2019-core"
  project = "windows-cloud"
}

data "google_compute_image" "dev_centos_7" {
  family  = "centos-7"
  project = "centos-cloud"
}
*/

data "google_compute_image" "dev_rhel_7" {
  family  = "rhel-7"
  project = "rhel-cloud"
}