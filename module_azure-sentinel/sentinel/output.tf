output "resource_id" {
  value = data.azurerm_log_analytics_workspace.example.id
}

output "resource_group" {
  value = data.azurerm_resource_group.example.name
}

output "resource_group_id" {
  value = data.azurerm_resource_group.example.id
}

output "resource_group_location" {
  value = data.azurerm_resource_group.example.location
}