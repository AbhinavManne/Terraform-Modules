resource "azurerm_databricks_workspace_customer_managed_key" "dwcmk" {
  

  workspace_id     = var.workspace_id
  key_vault_key_id = var.keyvault_id
}
