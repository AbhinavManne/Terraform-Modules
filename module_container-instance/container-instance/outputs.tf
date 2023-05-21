output "resource_group_name" {
  description = "Resource group name"  
  value = data.azurerm_resource_group.rg.name
}

output "resource_group_location" {
  description = "Resource group name"
  value = data.azurerm_resource_group.rg.location
}

output "resource_group_id" {
  description = "Resource group name"
  value = data.azurerm_resource_group.rg.id
}

output "resource_id" {
  description = "Resource  id"
  value = azurerm_container_group.container_group.id
}