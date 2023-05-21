output "resource_group_name" {
  value = data.azurerm_resource_group.example.name
}
output "resource_group_id" {
  value = data.azurerm_resource_group.example.id
}
output "resource_group_location" {
  value = data.azurerm_resource_group.example.location
}
output "resource_id" {
  value = azurerm_virtual_desktop_workspace.wvd_workspace1.id
}
output "storage_id" {
  description = "Resource group id"
  value       = azurerm_storage_account.storage_account.id
}