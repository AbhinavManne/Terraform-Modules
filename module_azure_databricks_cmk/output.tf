#output "key_vault_access_policy_id" {
  #value = azurerm_key_vault_access_policy.keyvap.id
#}

output "databricks_workspace_customer_managed_key_id" {
  value = azurerm_databricks_workspace_customer_managed_key.dwcmk.id
}