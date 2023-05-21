output "resource_group_name" {
  value = local.resource_group_name
}
output "resource_group_id" {
  value = azurerm_resource_group.rg.0.id
}
output "resource_group_location" {
  value = local.location
}
output "resource_id" {
  value = azurerm_cdn_profile.cdn.id
}
output "storage_id" {
  description = "Resource group id"
  value       = azurerm_storage_account.stor.id
}