module "site-recovery-replicated-vm" {
  source = "../../modules/module_site-recovery-protection-container/protection container"

  resource_group_name1     = var.resource_group_name1
  resource_group_location1 = var.resource_group_location1

  resource_group_name2     = var.resource_group_name2
  resource_group_location2 = var.resource_group_location2

  tags = var.tags

  //Storage Group
  storage_account_name             = var.storage_account_name
  storage_account_tier             = var.storage_account_tier
  storage_account_replication_type = var.storage_account_replication_type

  #Virtual Network
  virtual_network = var.virtual_network
  address_space   = var.address_space
  #Subnet#
  enable_private_endpoint                        = var.enable_private_endpoint
  subnet_name                                    = var.subnet_name
  private_subnet_address_prefix                  = var.private_subnet_address_prefix
  enforce_private_link_endpoint_network_policies = var.enforce_private_link_endpoint_network_policies

  #Private Endpoint
  private_endpoint_name           = var.private_endpoint_name
  private_service_connection_name = var.private_service_connection_name
  is_manual_connection            = var.is_manual_connection
  subresource_names               = var.subresource_names

  recovery_services_vault_name = var.recovery_services_vault_name
  recovery_services_vault_sku  = var.recovery_services_vault_sku

  site_recovery_fabric_name1 = var.site_recovery_fabric_name1

  protection_container1 = var.protection_container1

}

#-------------------------------MODULE FOR ROLE ASSIGNMENT----------------------------------------------#

module "role_assignemt" {
  source                  = "../../modules/module_site-recovery-protection-container/rbac"
  resource_group_name     = module.site-recovery-replicated-vm.resource_group_name
  resource_group_id       = module.site-recovery-replicated-vm.resource_group_id
  resource_group_location = module.site-recovery-replicated-vm.resource_group_location
  scope                   = module.site-recovery-replicated-vm.resource_id
  role_definition_name    = var.role_definition

}

#--------------------------------MODULE FOR LOGGING AND MONITORING--------------------------------------#

module "diag_monitoring" {
  source                  = "../../modules/module_site-recovery-protection-container/logging_and_monitoring"
  resource_group_name     = module.site-recovery-replicated-vm.resource_group_name
  resource_group_id       = module.site-recovery-replicated-vm.resource_group_id
  resource_group_location = module.site-recovery-replicated-vm.resource_group_location
  storage_account_id      = module.site-recovery-replicated-vm.storage_id
  resource_id             = module.site-recovery-replicated-vm.resource_id
}