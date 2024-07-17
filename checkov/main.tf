module "checkov" {
  source              = "./g-run"
  project_id          = "toolbox-sandbox-388523"
  app_name            = "checkov"
  location            = ["us-central1"]
  container           = "toolboxplayground/nodejs-jenkins"
  backend_bkt_name    = "checkov-tf-state"
  label_environment   = "test"
  label_responsible   = "toolbox-playground"
  label_creator       = "toolbox-playground-pipeline"
  container_port      = "8080"
  container_port_name = "http1"
}