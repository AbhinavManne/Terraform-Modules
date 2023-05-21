output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}
output "resource_group_id" {
  value = azurerm_resource_group.rg.id
}
output "resource_group_location" {
  value = azurerm_resource_group.rg.location
}
output "resource_id" {
  value = azurerm_bastion_host.azurebastion.id
}
output "storage_id" {
  description = "Resource group id"
  value       = azurerm_storage_account.storage_account.id
}