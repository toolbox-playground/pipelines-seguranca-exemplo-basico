## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14 |
| <a name="requirement_google"></a> [google](#requirement\_google) | 4.55.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 4.55.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_cloud_run_v2_service.default](https://registry.terraform.io/providers/hashicorp/google/4.55.0/docs/resources/cloud_run_v2_service) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_name"></a> [app\_name](#input\_app\_name) | Cloud Run name. | `string` | n/a | yes |
| <a name="input_backend_bkt_name"></a> [backend\_bkt\_name](#input\_backend\_bkt\_name) | n/a | `string` | n/a | yes |
| <a name="input_container"></a> [container](#input\_container) | Container image to be deployed. | `string` | n/a | yes |
| <a name="input_container_port"></a> [container\_port](#input\_container\_port) | n/a | `number` | `8080` | no |
| <a name="input_container_port_name"></a> [container\_port\_name](#input\_container\_port\_name) | n/a | `string` | `"h2c"` | no |
| <a name="input_label_cost_center"></a> [label\_cost\_center](#input\_label\_cost\_center) | n/a | `string` | `"devops"` | no |
| <a name="input_label_creation_date"></a> [label\_creation\_date](#input\_label\_creation\_date) | n/a | `string` | `"auto-avaliar"` | no |
| <a name="input_label_creator"></a> [label\_creator](#input\_label\_creator) | n/a | `string` | `"pipeline"` | no |
| <a name="input_label_environment"></a> [label\_environment](#input\_label\_environment) | n/a | `string` | `"dev"` | no |
| <a name="input_label_responsible"></a> [label\_responsible](#input\_label\_responsible) | n/a | `string` | `"auto-avaliar"` | no |
| <a name="input_location"></a> [location](#input\_location) | Location to be deployed. | `list(string)` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | Project ID from Google Cloud. | `string` | n/a | yes |
| <a name="input_resource_cpu"></a> [resource\_cpu](#input\_resource\_cpu) | n/a | `string` | `"1000m"` | no |
| <a name="input_resource_memory"></a> [resource\_memory](#input\_resource\_memory) | n/a | `string` | `"512Mi"` | no |
| <a name="input_timout_time"></a> [timout\_time](#input\_timout\_time) | n/a | `number` | `300` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_locations"></a> [locations](#output\_locations) | Cloud Run Name |
| <a name="output_service_url"></a> [service\_url](#output\_service\_url) | The URL on which the deployed service is available |
