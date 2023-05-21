
output "storage_account_id" {
  value = azurerm_storage_account.example.id
}

output "resource_id" {
  value = azurerm_storage_account.example.id
}

output "resource_group_name" {
  value = data.azurerm_resource_group.rgrp.name
}

output "resource_group_id" {
  value = data.azurerm_resource_group.rgrp.id
}

output "resource_group_location" {
  value = data.azurerm_resource_group.rgrp.location
}