output "resource_group_name" {
  value = data.azurerm_resource_group.rg.name
}
output "resource_group_id" {
  value = data.azurerm_resource_group.rg.id
}
output "resource_group_location" {
  value = data.azurerm_resource_group.rg.location
}
output "resource_id" {
  value = azurerm_logic_app_workflow.logic_app.id
}
output "storage_id" {
  description = "Resource group id"
  value       = azurerm_storage_account.storage_account.id
}