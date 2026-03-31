# Terraform for Datadog Infra

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "datadog-monitoring-poc"
  location = "West Europe"
}

resource "azurerm_monitor_diagnostic_setting" "example" {
  name               = "example"
  target_resource_id = azurerm_resource_group.example.id
  logs {
    category = "Azure Activity"
    enabled  = true
  }
}