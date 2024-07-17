locals {
  timestamp           = timestamp()
  timestamp_sanitized = replace("${local.timestamp}", "/[-| |T|Z|:]/", "")
}

resource "google_cloud_run_v2_service" "default" {
  count = length(var.location)
  #name              = var.app_name
  name     = "${var.app_name}-${var.location[count.index]}"
  location = var.location[count.index]
  ingress  = "INGRESS_TRAFFIC_ALL"
  project  = var.project_id

  template {
    containers {
      image = "${var.container}:latest"
      ports {
        name           = var.container_port_name
        container_port = var.container_port
      }
      resources {
        limits = {
          cpu    = "${var.resource_cpu}"
          memory = "${var.resource_memory}"
        }
      }
    }
    labels = {
      environment   = "${var.label_environment}"
      cost_center   = "${var.label_cost_center}"
      responsible   = "${var.label_responsible}"
      creator       = "${var.label_creator}"
      creation_date = "${local.timestamp_sanitized}"
    }
  }


  #traffic {
  #  type            = TRAFFIC_TARGET_ALLOCATION_TYPE_REVISION
  #  percent         = 100
  #}

  # Waits for the Cloud Run API to be enabled
  #depends_on = [google_project_service.run_api]

}