variable "team_name" {
  description = "The name of the team that manages the monitoring"
  type        = string
}

variable "service_name" {
  description = "The name of the service being monitored"
  type        = string
}

variable "environment" {
  description = "The environment for which the monitoring is configured"
  type        = string
}