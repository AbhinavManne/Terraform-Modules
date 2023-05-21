output "resource_group_name" {
  value = azurerm_resource_group.test.name
}
output "resource_group_id" {
  value = azurerm_resource_group.test.id
}
output "resource_group_location" {
  value = azurerm_resource_group.test.location
}
output "resource_id" {
  value = azurerm_traffic_manager_profile.example.id
}
output "storage_id" {
  description = "Resource group id"
  value       = azurerm_storage_account.stor.id
}