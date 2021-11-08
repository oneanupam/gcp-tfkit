# Resource block to deploy Instance Template
resource "google_compute_instance_template" "dev_instance_template" {
  project = var.project_id

  name         = "${var.it_name}-${var.it_version}"
  region       = var.resource_region
  machine_type = var.gce_machine_type

  # Disk section configurations
  disk {
    type         = "PERSISTENT"
    disk_type    = "pd-standard"
    disk_size_gb = 50
    auto_delete  = true
    mode         = "READ_WRITE"
    boot         = true
    source_image = data.google_compute_image.dev_rhel_7.self_link
  }

  disk {
    type         = "PERSISTENT"
    disk_type    = "pd-standard"
    disk_size_gb = 50
    auto_delete  = true
    mode         = "READ_WRITE"
  }

  # Identity and API access configurations
  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = google_service_account.dev_vm_svcacc.email
    scopes = ["cloud-platform"]
  }

  # Management Section configurations
  labels                  = var.resource_labels
  metadata_startup_script = file("${path.module}/bin/startup.sh")
  #metadata                = var.metadata

  scheduling {
    preemptible         = false
    on_host_maintenance = "MIGRATE" # or TERMINATE
    automatic_restart   = false     # Automatic_restart must be false when preemptible is true.
  }

  # Security Section configurations
  # This feature can only be used with boot images with shielded vm support.
  shielded_instance_config {
    enable_secure_boot          = false
    enable_vtpm                 = false
    enable_integrity_monitoring = false
  }

  # Networking Section configurations
  # NIC Card(s) to be used with Virtual Machines
  network_interface {
    network            = google_compute_network.dev_vpc01.id
    subnetwork         = google_compute_subnetwork.dev_vpc01_subnet01.id
    subnetwork_project = var.project_id
    access_config {
      # nat_ip       = google_compute_address.dev_vm_01_eip.address
    }
  }  

  tags           = ["web", "linux"]
  can_ip_forward = false

  lifecycle {
    create_before_destroy = true
  }
}