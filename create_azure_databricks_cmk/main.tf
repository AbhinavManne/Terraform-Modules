module "databricks_workspace" {
  source                           = "../../modules/module_azure_databricks_cmk"
  keyvault_id = var.keyvault_id
 # tenant_id    = var.tenant_id
  

  #key_permissions = var.key_permissions
  workspace_id     = var.workspace_id
  
}