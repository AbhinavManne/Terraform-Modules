#Reference to recovery services vault module
module "recoveryservicesvault_module" {
  source              = "../../modules/module_backuppolicy/recovery_service_module"
  resource_group      = var.resource_group
  recovery_vault_name = var.recovery_vault_name
  sku                 = var.sku
  soft_delete_enabled = var.soft_delete_enabled
  #storage_mode_type = var.storage_mode_type
  identity_type                                  = var.identity_type
  tags                                           = var.tags

  backup_policy_vm_name                          = var.backup_policy_vm_name

  virtual_network                                = var.virtual_network
  address_space                                  = var.address_space
  subnet                                         = var.subnet
  address_prefixes                               = var.address_prefixes
  enforce_private_link_service_network_policies  = var.enforce_private_link_service_network_policies
  enforce_private_link_endpoint_network_policies = var.enforce_private_link_endpoint_network_policies

  private_endpoint                               = var.private_endpoint
  private_service_connection_name                = var.private_service_connection_name
  is_manual_connection                           = var.is_manual_connection
  subresources_names                             = var.subresources_names
}

#Reference to module that provisions role assignment for each resource
module "module_resource-role-assignment" {
  source = "../../modules/module_backuppolicy/rbac"
  scope                = module.recoveryservicesvault_module.vault_id
  role_definition_name = var.role_definition_name

}

#Reference to module that provisions diagnostic settings of a particular resource
module "rsv_monitoring" {
  source                  = "../../modules/module_backuppolicy/diag_setting"
  resource_id             = module.recoveryservicesvault_module.vault_id
  resource_group_name     = module.recoveryservicesvault_module.resource_group
  resource_group_id       = module.recoveryservicesvault_module.resource_group_id
  resource_group_location = module.recoveryservicesvault_module.resource_group_location
}