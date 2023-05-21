module "site-recovery-replicated-vm" {
  source = "../../modules/module_site-recovery-replicated-vm/replicated vm"

  resource_group_name1     = var.resource_group_name1
  resource_group_location1 = var.resource_group_location1

  resource_group_name2     = var.resource_group_name2
  resource_group_location2 = var.resource_group_location2

  tags = var.tags

  //Storage Group
  storage_account_name             = var.storage_account_name
  storage_account_tier             = var.storage_account_tier
  storage_account_replication_type = var.storage_account_replication_type

  # #Virtual Network
  # virtual_network = var.virtual_network
  # address_space   = var.address_space
  # #Subnet#
  # enable_private_endpoint                        = var.enable_private_endpoint
  # subnet_name                                    = var.subnet_name
  # private_subnet_address_prefix                  = var.private_subnet_address_prefix
  # enforce_private_link_endpoint_network_policies = var.enforce_private_link_endpoint_network_policies

  # #Private Endpoint
  # private_endpoint_name           = var.private_endpoint_name
  # private_service_connection_name = var.private_service_connection_name
  # is_manual_connection            = var.is_manual_connection
  # subresource_names               = var.subresource_names

  virtual_machine_name            = var.virtual_machine_name
  virtual_machine_location        = var.virtual_machine_location
  vm_size                         = var.vm_size
  publisher                       = var.publisher
  offer                           = var.offer
  vm_sku                          = var.vm_sku
  latest_version                  = var.latest_version
  storage_os_disk                 = var.storage_os_disk
  caching                         = var.caching
  create_option                   = var.create_option
  managed_disk_type               = var.managed_disk_type
  os_profile                      = var.os_profile
  admin_username                  = var.admin_username
  admin_password                  = var.admin_password
  disable_password_authentication = var.disable_password_authentication

  recovery_services_vault_name = var.recovery_services_vault_name
  recovery_services_vault_sku  = var.recovery_services_vault_sku

  site_recovery_fabric_name1 = var.site_recovery_fabric_name1

  site_recovery_fabric_name2 = var.site_recovery_fabric_name2

  protection_container1 = var.protection_container1

  protection_container2 = var.protection_container2

  site_recovery_replication_policy_name = var.site_recovery_replication_policy_name

  site_recovery_protection_container_mapping_name = var.site_recovery_protection_container_mapping_name

  azurerm_storage_account_name = var.azurerm_storage_account_name
  account_tier                 = var.account_tier
  account_replication_type     = var.account_replication_type

  virtual_network_name1          = var.virtual_network_name1
  virtual_network_address_space1 = var.virtual_network_address_space1

  virtual_network_name2          = var.virtual_network_name2
  virtual_network_address_space2 = var.virtual_network_address_space2

  subnet_name1             = var.subnet_name1
  subnet_address_prefixes1 = var.subnet_address_prefixes1

  subnet_name2             = var.subnet_name2
  subnet_address_prefixes2 = var.subnet_address_prefixes2

  public_ip_name1    = var.public_ip_name1
  allocation_method1 = var.allocation_method1
  public_ip_sku1     = var.public_ip_sku1

  public_ip_name2    = var.public_ip_name2
  allocation_method2 = var.allocation_method2
  public_ip_sku2     = var.public_ip_sku2

  network_interface_name                                    = var.network_interface_name
  network_interface_ip_config_name                          = var.network_interface_ip_config_name
  network_interface_ip_config_private_ip_address_allocation = var.network_interface_ip_config_private_ip_address_allocation

  recovery_network_mapping_name = var.recovery_network_mapping_name

  site_recovery_replicated_vm_name                     = var.site_recovery_replicated_vm_name
  site_recovery_replicated_vm_target_disk_type         = var.site_recovery_replicated_vm_target_disk_type
  site_recovery_replicated_vm_target_replica_disk_type = var.site_recovery_replicated_vm_target_replica_disk_type


}


#-------------------------------MODULE FOR ROLE ASSIGNMENT----------------------------------------------#

module "role_assignemt" {
  source                  = "../../modules/module_site-recovery-replicated-vm/rbac"
  resource_group_name     = module.site-recovery-replicated-vm.resource_group_name
  resource_group_id       = module.site-recovery-replicated-vm.resource_group_id
  resource_group_location = module.site-recovery-replicated-vm.resource_group_location
  scope                   = module.site-recovery-replicated-vm.resource_id
  role_definition_name    = var.role_definition

}

#--------------------------------MODULE FOR LOGGING AND MONITORING--------------------------------------#

module "diag_monitoring" {
  source                  = "../../modules/module_site-recovery-replicated-vm/logging_and_monitoring"
  resource_group_name     = module.site-recovery-replicated-vm.resource_group_name
  resource_group_id       = module.site-recovery-replicated-vm.resource_group_id
  resource_group_location = module.site-recovery-replicated-vm.resource_group_location
  storage_account_id      = module.site-recovery-replicated-vm.storage_id
  resource_id             = module.site-recovery-replicated-vm.resource_id
}
