variable "project_id" {
  description = "Project ID from Google Cloud."
  type        = string
}

variable "app_name" {
  description = "Cloud Run name."
  type        = string
}


variable "location" {
  description = "Location to be deployed."
  type        = list(string)
}

variable "container" {
  description = "Container image to be deployed."
  type        = string
}

variable "backend_bkt_name" {
  type = string
}

variable "container_port_name" {
  default = "h2c"
}

variable "container_port" {
  default = 8080
}

variable "timout_time" {
  default = 300
}

variable "resource_cpu" {
  default = "1000m"
}

variable "resource_memory" {
  default = "512Mi"
}

variable "label_environment" {
  type    = string
  default = "dev"
}

variable "label_cost_center" {
  type    = string
  default = "devops"
}

variable "label_responsible" {
  type    = string
  default = "auto-avaliar"
}

variable "label_creator" {
  type    = string
  default = "pipeline"
}

variable "label_creation_date" {
  type    = string
  default = "auto-avaliar"
}
