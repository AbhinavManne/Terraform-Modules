
output "storage_account_id" {
  value = azurerm_storage_account.example.id
}

output "resource_id" {
  value =  azurerm_hpc_cache.example.id
  }

output "resource_group_name" {
  value = local.resource_group_name
}

output "resource_group_id" {
  value = azurerm_resource_group.rg.0.id
}

output "resource_group_location" {
  value = local.location
  }