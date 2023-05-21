output "resource_group_name" {
  value = azurerm_resource_group.example.name
}
output "resource_group_id" {
  value = azurerm_resource_group.example.id
}
output "resource_group_location" {
  value = azurerm_resource_group.example.location
}
output "resource_id" {
  value = azurerm_api_management.example.id
}
output "storage_id" {
  description = "Resource group id"
  value       = azurerm_storage_account.stor.id
}