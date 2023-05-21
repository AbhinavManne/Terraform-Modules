module "bastion_host" {
  source                           = "../../modules/module_azure-bastion/bastion"
  resource_group_name              = var.resource_group_name
  resource_group_location          = var.resource_group_location
  public_ip_name                   = var.public_ip_name
  virtual_network_name             = var.virtual_network_name
  virtual_network_address_prefixes = var.virtual_network_address_prefixes
  subnet_address_prefixes          = var.subnet_address_prefixes
  bastion_name                     = var.bastion_name
  tags                             = var.tags
  storage_account_name             = var.storage_account_name
  storage_account_tier             = var.storage_account_tier
  storage_account_replication_type = var.storage_account_replication_type

}

#---------module for Role Assignemt--------#

module "role_assignemt" {
  source                  = "../../modules/module_azure-bastion/rbac"
  resource_group_name     = module.bastion_host.resource_group_name
  resource_group_id       = module.bastion_host.resource_group_id
  resource_group_location = module.bastion_host.resource_group_location
  scope                   = module.bastion_host.resource_id
  role_definition_name    = var.role_definition

}

#---------module for logging and monitoring--------#

module "diag_monitoring" {
  source                  = "../../modules/module_azure-bastion/logging_and_monitoring"
  resource_group_name     = module.bastion_host.resource_group_name
  resource_group_id       = module.bastion_host.resource_group_id
  resource_group_location = module.bastion_host.resource_group_location
  storage_account_id      = module.bastion_host.storage_id
  resource_id             = module.bastion_host.resource_id
}
