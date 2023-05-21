output "vm_id" {
  value       = azurerm_virtual_machine.vm1.id
  description = "ID of the MariaDB Server"
}

output "resource_group" {
  value       = data.azurerm_resource_group.rg.name
  description = "Name of resource group"
}

output "resource_group_id" {
  value       = data.azurerm_resource_group.rg.id
  description = "ID of the resource group"
}

output "resource_group_location" {
  value       = data.azurerm_resource_group.rg.location
  description = "Location of the resource group"
}

output "storage_account_id" {
  value       = azurerm_storage_account.example.id
  description = "ID of the resource group"
}
 