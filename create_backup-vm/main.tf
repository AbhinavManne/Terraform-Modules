data "azurerm_resources" "example" {
  resource_group_name = var.resource_group
}

#Reference to VIRTUAL MACHINE module
module "backup_virtual_machine" {
  source         = "../../modules/module_backup-vm/vm_module"
  resource_group = var.resource_group

  virtual_network  = var.virtual_network
  address_space    = var.address_space
  subnet           = var.subnet
  address_prefixes = var.address_prefixes
  enforce_private_link_service_network_policies  = var.enforce_private_link_service_network_policies
  enforce_private_link_endpoint_network_policies = var.enforce_private_link_endpoint_network_policies

  network_interface             = var.network_interface
  interface_ip                  = var.interface_ip
  private_ip_address_allocation = var.private_ip_address_allocation

  storage_account          = var.storage_account
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type

  availability_set             = var.availability_set
  platform_update_domain_count = var.platform_update_domain_count
  platform_fault_domain_count  = var.platform_fault_domain_count

  public_ip            = var.public_ip
  public_ip_allocation = var.public_ip_allocation

  nsg_name                             = var.nsg_name
  security_rule_access                 = var.security_rule_access
  security_rule_direction              = var.security_rule_direction
  security_rule_name                   = var.security_rule_name
  security_rule_priority               = var.security_rule_priority
  security_rule_protocol               = var.security_rule_protocol
  security_rule_source_port_range      = var.security_rule_source_port_range
  security_rule_source_address_prefix  = var.security_rule_source_address_prefix
  security_rule_destination_port_range = var.security_rule_destination_port_range

  lb_name                       = var.lb_name
  lb_frontend_ip_config         = var.lb_frontend_ip_config
  lb_backend_address_pool       = var.lb_backend_address_pool
  lb_nat_rule                   = var.lb_nat_rule
  lb_nat_rule_protocol          = var.lb_nat_rule_protocol
  lb_nat_rule_frontend_port     = var.lb_nat_rule_frontend_port
  lb_nat_rule_backend_port      = var.lb_nat_rule_backend_port
  interface_address_association = var.interface_address_association
  application_security_group    = var.application_security_group

  virtual_machine                  = var.virtual_machine
  vm_size                          = var.vm_size
  delete_os_disk_on_termination    = var.delete_os_disk_on_termination
  delete_data_disks_on_termination = var.delete_data_disks_on_termination
  license_type                     = var.license_type
  publisher                        = var.publisher
  offer                            = var.offer
  sku                              = var.sku
  latest_version                   = var.latest_version
  storage_os_disk                  = var.storage_os_disk
  caching                          = var.caching
  create_option                    = var.create_option
  managed_disk_type                = var.managed_disk_type
  storage_data_disk                = var.storage_data_disk
  storage_data_disk_caching        = var.storage_data_disk_caching
  storage_data_disk_create_option  = var.storage_data_disk_create_option
  lun                              = var.lun
  disk_size_gb                     = var.disk_size_gb
  os_profile                       = var.os_profile
  admin_username                   = var.admin_username
  admin_password                   = var.admin_password
  provision_vm_agent               = var.provision_vm_agent
  boot_diagnostics_enabled         = var.boot_diagnostics_enabled
  identity_type                    = var.identity_type
  tags                             = var.tags

  vm_shutdown_schedule_enabled  = var.vm_shutdown_schedule_enabled
  daily_recurrence_time         = var.daily_recurrence_time
  timezone                      = var.timezone
  notification_settings_enabled = var.notification_settings_enabled

  log_analytics_workspace = var.log_analytics_workspace
  log_sku                 = var.log_sku
  retention_in_days       = var.retention_in_days

  vm_monitoring_agent_name              = var.vm_monitoring_agent_name
  monitoring_publisher                  = var.monitoring_publisher
  monitoring_type                       = var.monitoring_type
  monitoring_type_handler_version       = var.monitoring_type_handler_version
  monitoring_auto_upgrade_minor_version = var.monitoring_auto_upgrade_minor_version

  solution_name  = var.solution_name
  plan_publisher = var.plan_publisher
  plan_product   = var.plan_product

  vm_dependency_agent_name      = var.vm_dependency_agent_name
  dependency_agent_publisher    = var.dependency_agent_publisher
  dependency_agent_type         = var.dependency_agent_type
  dependency_agent_type_handler = var.dependency_agent_type_handler
  dependency_agent_auto_upgrade = var.dependency_agent_auto_upgrade

  diag_name                       = var.diag_name
  diag_publisher                  = var.diag_publisher
  diag_type                       = var.diag_type
  diag_type_handler_version       = var.diag_type_handler_version
  diag_auto_upgrade_minor_version = var.diag_auto_upgrade_minor_version

  security_center_subscription_pricing_tier = var.security_center_subscription_pricing_tier
  security_resource_type                    = var.security_resource_type

  security_center_email               = var.security_center_email
  security_center_phone               = var.security_center_phone
  security_center_alert_notifications = var.security_center_alert_notifications
  security_center_alerts_to_admins    = var.security_center_alerts_to_admins

  security_center_setting_name   = var.security_center_setting_name
  enable_security_center_setting = var.enable_security_center_setting

  enable_security_center_auto_provisioning = var.enable_security_center_auto_provisioning

  recovery_service_vault_name  = var.recovery_service_vault_name
  recovery_service_vault_sku   = var.recovery_service_vault_sku
  recovery_soft_delete_enabled = var.recovery_soft_delete_enabled
  #storage_mode_type = var.storage_mode_type
  #identity_type                                  = var.identity_type
  #tags                                           = var.tags

  backup_policy_vm_name = var.backup_policy_vm_name
  backup_frequency      = var.backup_frequency
  backup_time           = var.backup_time
  retention_daily_count = var.retention_daily_count


}

#Reference to module that provisions diagnostic settings of a particular resource
module "backup_vm_monitoring" {
  source                  = "../../modules/module_backup-vm/diag_setting"
  resource_id             = module.backup_virtual_machine.vault_id
  resource_group_name     = module.backup_virtual_machine.resource_group
  resource_group_id       = module.backup_virtual_machine.resource_group_id
  resource_group_location = module.backup_virtual_machine.resource_group_location
}

#Reference to module that provisions role assignment for each resource
module "module_resource-role-assignment" {
  #count = length(data.azurerm_resources.example.resources)
  #resource_group_name  = module.cosmosdb_mongodb_database_module.resource_group #data.azurerm_resource_group.rg.name  
  source               = "../../modules/module_backup-vm/rbac_module"
  scope                = module.backup_virtual_machine.vault_id
  role_definition_name = var.role_definition_name

}

#---------------------------------------------------------------------------------------------------------#