output "resource_group_name" {
  description = "The name of the resource group in which resources are created"
  value       = data.azurerm_resource_group.rg.name
}

output "resource_group_id" {
  description = "The location of the resource group in which resources are created"
  value       = data.azurerm_resource_group.rg.id
}

output "resource_group_location" {
  description = "The location of the resource group in which resources are created"
  value       = data.azurerm_resource_group.rg.location
}

output "resource_id" {
  description = "The resource ID of the MySQL Server"
  value       = azurerm_network_watcher.example.id
}