output "vault_id" {
  value = azurerm_recovery_services_vault.vault.id
}

output "resource_group" {
  value = data.azurerm_resource_group.rg.name
}

output "resource_group_id" {
  value = data.azurerm_resource_group.rg.id
}

output "resource_group_location" {
  value = data.azurerm_resource_group.rg.location
}
