variable "datadog_api_key" {
  description = "The API key for Datadog."
  type        = string
}

variable "datadog_app_key" {
  description = "The application key for Datadog."
  type        = string
}

variable "team_info" {
  description = "Information about the team using Datadog."
  type        = map(string)
}

variable "thresholds" {
  description = "Thresholds for alerts in Datadog."
  type        = map(number)
}

variable "enabled_modules" {
  description = "List of enabled modules in Datadog."
  type        = list(string)
}