resource "google_cloud_run_v2_service" "default" {
  name     = "checkov"
  location = "us-central1"
  ingress  = "INGRESS_TRAFFIC_ALL"
  project  = "toolbox-sandbox-388523"

  template {
    containers {
      image = "toolboxplayground/nodejs-jenkins:latest"
      ports {
        name           = "http1"
        container_port = "8080"
      }
    }
  }
}