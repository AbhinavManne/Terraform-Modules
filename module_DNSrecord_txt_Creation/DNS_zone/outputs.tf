#OUTPUT VALUES TO BE USED BY OTHER MODULES

output "resource_id" {
  value = azurerm_dns_zone.eg_public.id #public_dns_zone_id
}

output "resource_group" {
  value = local.resource_group_name#azurerm_resource_group.rg.name
}

output "resource_group_id" {
  value = azurerm_resource_group.rg.0.id
}

output "resource_group_location" {
  value = local.location#azurerm_resource_group.rg.location
}
#------------------------------------------------------------------------------------------------------#