data "azurerm_resources" "example" {
  resource_group_name = var.resource_group
}

#Reference to VIRTUAL MACHINE module
module "sql_server_virtual_machine" {
  source         = "../../modules/module_enable-windowsvm-insights/vm_module"
  resource_group = var.resource_group

  virtual_network  = var.virtual_network
  address_space    = var.address_space
  subnet           = var.subnet
  address_prefixes = var.address_prefixes

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

  virtual_machine      = var.virtual_machine
  vm_size              = var.vm_size
  license_type         = var.license_type
  publisher            = var.publisher
  offer                = var.offer
  sku                  = var.sku
  latest_version       = var.latest_version
  storage_os_disk      = var.storage_os_disk
  caching              = var.caching
  storage_account_type = var.storage_account_type
  admin_username       = var.admin_username
  admin_password       = var.admin_password
  identity_type        = var.identity_type
  tags                 = var.tags
  policy_name          = var.policy_name
  policy_definition_id = var.policy_definition_id

  vm_shutdown_schedule_enabled  = var.vm_shutdown_schedule_enabled
  daily_recurrence_time         = var.daily_recurrence_time
  timezone                      = var.timezone
  notification_settings_enabled = var.notification_settings_enabled

  log_analytics_workspace = var.log_analytics_workspace
  log_sku                 = var.log_sku
  retention_in_days       = var.retention_in_days
  data_source_type        = var.data_source_type
  log_storage_insights_name = var.log_storage_insights_name
  log_data_export_name      = var.log_data_export_name
  log_data_export_table_names = var.log_data_export_table_names
  log_data_export_enabled     = var.log_data_export_enabled
  log_saved_search            = var.log_saved_search
  log_saved_search_category   = var.log_saved_search_category
  log_saved_search_display_name = var.log_saved_search_display_name
  log_saved_search_query        = var.log_saved_search_query
  automation_account            = var.automation_account
  automation_account_sku_name   = var.automation_account_sku_name
  datasource_windows_event_name = var.datasource_windows_event_name
  datasource_windows_event_log_name = var.datasource_windows_event_log_name
  datasource_windows_event_types = var.datasource_windows_event_types
  datasource_windows_performance_name = var.datasource_windows_performance_name
  datasource_windows_performance_object_name = var.datasource_windows_performance_object_name
  datasource_windows_performance_instance_name = var.datasource_windows_performance_instance_name
  datasource_windows_performance_counter_name = var.datasource_windows_performance_counter_name
  datasource_windows_performance_interval = var.datasource_windows_performance_interval
  solution_name  = var.solution_name
  plan_publisher = var.plan_publisher
  plan_product   = var.plan_product

  vm_monitoring_agent_name              = var.vm_monitoring_agent_name
  monitoring_publisher                  = var.monitoring_publisher
  monitoring_type                       = var.monitoring_type
  monitoring_type_handler_version       = var.monitoring_type_handler_version
  monitoring_auto_upgrade_minor_version = var.monitoring_auto_upgrade_minor_version

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

  backup_policy_vm_name = var.backup_policy_vm_name
  backup_frequency      = var.backup_frequency
  backup_time           = var.backup_time
  retention_daily_count = var.retention_daily_count

  keyvault_name                        = var.keyvault_name
  keyvault_sku_name                    = var.keyvault_sku_name
  keyvault_enabled_for_disk_encryption = var.keyvault_enabled_for_disk_encryption
  #keyvault_soft_delete_enabled = var.keyvault_soft_delete_enabled
  purge_protection_enabled = var.purge_protection_enabled

  keyvault_key_name = var.keyvault_key_name
  key_type          = var.key_type
  key_size          = var.key_size

  disk_encryption_name          = var.disk_encryption_name
  disk_encryption_identity_type = var.disk_encryption_identity_type

}

#Reference to module that provisions diagnostic settings of a particular resource
module "vm_monitoring" {
  source                  = "../../modules/module_enable-windowsvm-insights/diag_setting"
  resource_id             = module.sql_server_virtual_machine.resource_id
  storage_account_id      = module.sql_server_virtual_machine.storage_account_id
  resource_group_name     = module.sql_server_virtual_machine.resource_group
  resource_group_id       = module.sql_server_virtual_machine.resource_group_id
  resource_group_location = module.sql_server_virtual_machine.resource_group_location
}

#Reference to module that provisions role assignment for each resource
module "module_resource-role-assignment" {
  #count = length(data.azurerm_resources.example.resources)
  #resource_group_name  = module.cosmosdb_mongodb_database_module.resource_group #data.azurerm_resource_group.rg.name  
  source               = "../../modules/module_enable-windowsvm-insights/rbac_module"
  scope                = module.sql_server_virtual_machine.resource_id
  role_definition_name = var.role_definition_name

}

#---------------------------------------------------------------------------------------------------------#