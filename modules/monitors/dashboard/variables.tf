variable "team_name" {
  description = "Name of the team"
  type        = string
}

variable "service_name" {
  description = "Name of the service"
  type        = string
}

variable "environment" {
  description = "Environment the service is running in"
  type        = string
}

variable "slo_id" {
  description = "Service Level Objective ID"
  type        = string
}