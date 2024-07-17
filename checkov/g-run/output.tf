# Display the service URL
output "service_url" {
  value       = google_cloud_run_v2_service.default[*].traffic_statuses[*].uri
  description = "The URL on which the deployed service is available"
}

output "locations" {
  value       = google_cloud_run_v2_service.default[*].location
  description = "Cloud Run Name"
}