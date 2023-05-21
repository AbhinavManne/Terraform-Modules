#----------------------------------------------Locals---------------------------------------------#
locals {
  resource_group_id = element(coalescelist(data.azurerm_resource_group.rgrp.*.id, azurerm_resource_group.rg.*.id, [""]), 0)
}

output "resource_group_name" {
  description = "Resource group name"
  value       = local.resource_group_name
}

output "resource_group_location" {
  description = "Resource group location"
  value       = local.location
}

output "resource_group_id" {
  description = "Resource group ID"
  value       = local.resource_group_id
}

