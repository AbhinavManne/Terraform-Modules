//Keyvault
output "keyvault_id" {
  value = azurerm_key_vault.keyvault.id
  description = "The ID of the Key Vault."
}

output "keyvault_uri" {
  value = azurerm_key_vault.keyvault.vault_uri
  description = "The URI of the Key Vault, used for performing operations on keys and secrets."
}

//Keyvault Access Policy
output "keyvault_access_policy" {
  value = azurerm_key_vault.keyvault.access_policy
  description = "keyvault_access_policy"
}
