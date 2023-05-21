output "resource_group_name" {
  value = azurerm_resource_group.secondary.name
}
output "resource_group_id" {
  value = azurerm_resource_group.secondary.id
}
output "resource_group_location" {
  value = azurerm_resource_group.secondary.location
}
output "resource_id" {
  value = azurerm_recovery_services_vault.vault.id
}
output "storage_id" {
  description = "Resource group id"
  value       = azurerm_storage_account.stor.id
}