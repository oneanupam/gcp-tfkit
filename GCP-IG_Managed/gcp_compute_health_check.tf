/*
Note:
1. Managed instance group auto-healing must use global health checks.
2. External HTTP(S) load balancers (HTTP/HTTPS - L7) must use global health checks.
3. Internal HTTP(S) load balancers (HTTP/HTTPS - L7) must use regional health checks.
4. Backend service-based network load balancers (TCP/UDP - L4) must use regional health checks.
5. Target pool-based network load balancers (TCP/UDP - L4) must use legacy HTTP health checks.
6. Internal TCP/UDP load balancers (TCP/UDP - L4) can use either regional or global health checks.
7. TCP proxy and SSL proxy load balancers must use global health checks.
*/

# Resource block to create Global Healthcheck
resource "google_compute_health_check" "dev_health_check_global" {
  name = "dev-http-health-check-global"

  timeout_sec         = 5
  check_interval_sec  = 10
  healthy_threshold   = 2
  unhealthy_threshold = 3

  http_health_check {
    port = "80"
  }
}

# Resource block to create Regional Healthcheck
resource "google_compute_region_health_check" "dev_health_check_regional" {
  name   = "dev-http-health-check-regional"
  region = var.resource_region

  timeout_sec         = 5
  check_interval_sec  = 10
  healthy_threshold   = 2
  unhealthy_threshold = 3

  http_health_check {
    port = "80"
  }
}