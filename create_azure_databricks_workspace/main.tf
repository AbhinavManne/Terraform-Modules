module "databricks_workspace" {
  source                                               = "../../modules/module_azure_databricks_workspace/databricks"
  rg                                                   = var.rg
  location                                             = var.location
  workspace                                            = var.workspace
  sku                                                  = var.sku
  tags                                                 = var.tags
  load_balancer_backend_address_pool_id                = var.load_balancer_backend_address_pool_id
  managed_services_cmk_key_vault_key_id                = var.managed_services_cmk_key_vault_key_id
  mrg                                                  = var.mrg
  customer_managed_key_enabled                         = var.customer_managed_key_enabled
  infrastructure_encryption_enabled                    = var.infrastructure_encryption_enabled
  public_network_access_enabled                        = var.public_network_access_enabled
  network_security_group_rules_required                = var.network_security_group_rules_required
  machine_learning_workspace_id                        = var.machine_learning_workspace_id
  nat_gateway_name                                     = var.nat_gateway_name
  no_public_ip                                         = var.no_public_ip
  public_subnet_name                                   = var.public_subnet_name
  public_subnet_network_security_group_association_id  = var.public_subnet_network_security_group_association_id
  private_subnet_name                                  = var.private_subnet_name
  private_subnet_network_security_group_association_id = var.private_subnet_network_security_group_association_id
  storage_account_name                                 = var.storage_account_name
  storage_account_sku_name                             = var.storage_account_sku_name
  virtual_network_id                                   = var.virtual_network_id
  vnet_address_prefix                                  = var.vnet_address_prefix
  custom_parameters                                    = var.custom_parameters

}

