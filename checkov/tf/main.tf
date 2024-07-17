resource "google_storage_bucket" "my_bucket" {
  name     = "my-bucket"
  location = "us-central1"
  project  = "toolbox-playground"
  logging {
    log_bucket = "my-logs-bucket"
  }

  versioning {
    enabled = true
  }

  uniform_bucket_level_access = true

  public_access_prevention = "enforced"

}