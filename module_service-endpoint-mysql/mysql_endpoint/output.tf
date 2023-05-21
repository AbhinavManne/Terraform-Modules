output "resource_id" {
  value       = azurerm_virtual_network.vnet.id
  description = "ID of vnet"
}

output "resource_group" {
  value       = local.resource_group_name
  description = "Name of resource group"
}

output "resource_group_id" {
  value = data.azurerm_resource_group.rgrp.0.id #azurerm_resource_group.rg.0.id  #use data source id if create_resource value in tfvars is false
}

output "resource_group_location" {
  value       = local.location
  description = "Location of the resource group"
}


 