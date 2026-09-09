/*
# Resource block to create and associate an regional autoscaler with MIG
resource "google_compute_region_autoscaler" "dev_mig_autoscaler_regional" {
  name   = "${var.rmig_name}-autoscaler"
  region = var.resource_region
  target = google_compute_region_instance_group_manager.dev_mig_regional.id

  autoscaling_policy {
    mode            = "ON"
    max_replicas    = 3
    min_replicas    = 2
    cooldown_period = 60

    cpu_utilization {
      target = 0.7
    }
  }
}
*/
