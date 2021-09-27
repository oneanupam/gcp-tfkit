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

  /*
  # Use another version, to achieve canary deployment
  version {
    name = var.it2_version
    instance_template = google_compute_instance_template.dev_instance_template2.id
    target_size {
      fixed = 1
    }
  }
  */

  wait_for_instances = true
  target_size        = 2 # Don't set, If this resource is attached to an autoscaler.

  # target_pools = [google_compute_target_pool.appserver.id]
  named_port {
    name = "http"
    port = 80
  }

  update_policy {
    type               = "PROACTIVE"  # Use "OPPORTUNISTIC" to apply updates, when new ones are created.
    minimal_action     = "REPLACE"    # Use "RESTART" to more control the disruption level.
    replacement_method = "SUBSTITUTE" # Use "RECREATE" to preserve the instance names.

    max_surge_fixed         = 2 # No of instances that should be temporarily added to support the update.
    max_surge_percent       = null
    max_unavailable_fixed   = 2 # No of instances that shoule be taken offline at a time.
    max_unavailable_percent = null
    min_ready_sec           = 30 # Time to wait for after a newly created instance becomes available.
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