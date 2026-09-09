# Resource block to deploy regional MIG
resource "google_compute_region_instance_group_manager" "dev_mig_regional" {
  project = var.project_id

  name                      = var.rmig_name
  region                    = var.resource_region
  distribution_policy_zones = [var.resource_zone, var.resource_zone_2]

  base_instance_name = "${var.rmig_name}-compute"

  version {
    name              = var.it_version
    instance_template = google_compute_instance_template.dev_instance_template.id
  }

  wait_for_instances = true
  target_size        = 2 # Don't set, If this resource is attached to an autoscaler.

  # target_pools = [google_compute_target_pool.appserver.id]
  named_port {
    name = "http"
    port = 80
  }

  update_policy {
    type                    = "PROACTIVE"
    minimal_action          = "REPLACE"
    max_surge_fixed         = 4
    max_surge_percent       = null
    max_unavailable_fixed   = 2
    max_unavailable_percent = null
    min_ready_sec           = 30
    replacement_method      = "SUBSTITUTE"
  }

  /*
  auto_healing_policies {
    health_check      = google_compute_health_check.dev_health_check_global.id
    initial_delay_sec = 300
  }
  */

  lifecycle {
    create_before_destroy = true
    ignore_changes        = [distribution_policy_zones]
  }

  timeouts {
    create = "15m"
    update = "15m"
    delete = "15m"
  }
}

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
