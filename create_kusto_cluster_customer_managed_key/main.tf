module "azurerm_kusto_cluster_customer_managed_key" {
  source = "../../modules/module_kusto_cluster_customer_managed_key"
  tags   = var.tags
  
  key_vault_id  = var.key_vault_id
  key_name      = var.key_name
  key_version   = var.key_version
  user_identity = var.user_identity
  kusto_cluster_id = var.kusto_cluster_id
}               
