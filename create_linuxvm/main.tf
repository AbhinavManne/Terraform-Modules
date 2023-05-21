data "azurerm_client_config" "current" {}

#Reference to LINUX VIRTUAL MACHINE module
module "linux_virtual_machine" {
  source                           = "../../modules/module_linux-vm"
  resource_group_name              = var.resource_group_name
  location                         = var.location
  resource_group_id                = var.resource_group_id
  generate_admin_ssh_key           = var.generate_admin_ssh_key
  virtual_machine_name             = var.virtual_machine_name
  vm_size                          = var.vm_size
  admin_username                   = var.admin_username
  admin_password                   = var.admin_password
  allow_extension_operations       = var.allow_extension_operations
  availability_set_id              = var.availability_set_id
  provision_vm_agent               = var.provision_vm_agent
  network_interface_ids            = var.network_interface_ids
  license_type                     = var.license_type
  capacity_reservation_group_id    = var.capacity_reservation_group_id
  computer_name                    = var.computer_name
  custom_data                      = var.custom_data
  dedicated_host_id                = var.dedicated_host_id
  dedicated_host_group_id          = var.dedicated_host_group_id
  disable_password_authentication  = var.disable_password_authentication
  edge_zone                        = var.edge_zone
  encryption_at_host_enabled       = var.encryption_at_host_enabled
  eviction_policy                  = var.eviction_policy
  extensions_time_budget           = var.extensions_time_budget
  patch_mode                       = var.patch_mode
  max_bid_price                    = var.max_bid_price
  platform_fault_domain            = var.platform_fault_domain
  priority                         = var.priority
  proximity_placement_group_id     = var.proximity_placement_group_id
  //secure_boot_enabled              = var.secure_boot_enabled
  source_image_id                  = var.source_image_id
  user_data                        = var.user_data
  //vtpm_enabled                     = var.vtpm_enabled
  virtual_machine_scale_set_id     = var.virtual_machine_scale_set_id
  vm_availability_zone             = var.vm_availability_zone
  enable_ultra_ssd                 = var.enable_ultra_ssd
  admin_ssh_key_public_key         = var.admin_ssh_key_public_key
  admin_ssh_key_username           = var.admin_ssh_key_username
  enable_boot_diagnostics          = var.enable_boot_diagnostics
  storage_account_name             = var.storage_account_name
  str_primary_blob_endpoint        = var.str_primary_blob_endpoint
  storage_account_uri              = var.storage_account_uri
  enable_secret_vm                 = var.enable_secret_vm
  secret_certificate_store         = var.secret_certificate_store
  secret_certificate_url           = var.secret_certificate_url
  key_vault_id                     = var.key_vault_id
  storage_os_disk                  = var.storage_os_disk
  caching                          = var.caching
  storage_account_type             = var.storage_account_type
  disk_size_gb                     = var.disk_size_gb
  enable_os_disk_write_accelerator = var.enable_os_disk_write_accelerator
  security_encryption_type         = var.security_encryption_type
  enable_diff_disk_settings        = var.enable_diff_disk_settings
  diff_disk_settings_option        = var.diff_disk_settings_option
  diff_disk_settings_placement     = var.diff_disk_settings_placement
  publisher                        = var.publisher
  offer                            = var.offer
  sku                              = var.sku
  latest_version                   = var.latest_version
  plan_name                        = var.plan_name
  plan_product                     = var.plan_product
  plan_publisher                   = var.plan_publisher
  enable_termination_notification  = var.enable_termination_notification
  termination_notification_timeout = var.termination_notification_timeout
  managed_identity_type            = var.managed_identity_type
  managed_identity_ids             = var.managed_identity_ids
  tags                             = var.tags

  no_of_managed_disks            = var.no_of_managed_disks
  managed_disk_name              = var.managed_disk_name
  data_disk_storage_account_type = var.data_disk_storage_account_type
  data_disk_create_option        = var.data_disk_create_option
  data_disk_disk_size_gb         = var.data_disk_disk_size_gb
  data_disk_attachment_caching   = var.data_disk_attachment_caching

  policy_name          = var.policy_name
  policy_definition_id = var.policy_definition_id

  vm_shutdown_schedule_enabled  = var.vm_shutdown_schedule_enabled
  daily_recurrence_time         = var.daily_recurrence_time
  timezone                      = var.timezone
  notification_settings_enabled = var.notification_settings_enabled
  email                         = var.email
  before_shutdown_time_in_minutes= var.before_shutdown_time_in_minutes
  webhook_url                    = var.webhook_url
  
  vm_monitoring_agent_name              = var.vm_monitoring_agent_name
  monitoring_publisher                  = var.monitoring_publisher
  monitoring_type                       = var.monitoring_type
  monitoring_type_handler_version       = var.monitoring_type_handler_version
  monitoring_auto_upgrade_minor_version = var.monitoring_auto_upgrade_minor_version
  log_analytics_workspace_id            = var.log_analytics_workspace_id
  log_primary_shared_key                = var.log_primary_shared_key

  vm_dependency_agent_name                 = var.vm_dependency_agent_name
  vm_dependency_agent_publisher            = var.vm_dependency_agent_publisher
  vm_dependency_agent_type                 = var.vm_dependency_agent_type
  vm_dependency_agent_type_handler_version = var.vm_dependency_agent_type_handler_version
  vm_dependency_auto_upgrade_minor_version = var.vm_dependency_auto_upgrade_minor_version

  storage_account_primary_connection_string = var.storage_account_primary_connection_string
  ex_diag                                   = var.ex_diag
  diag_publisher                            = var.diag_publisher
  diag_type                                 = var.diag_type
  diag_type_handler_version                 = var.diag_type_handler_version

  security_center_subscription_pricing_tier          = var.security_center_subscription_pricing_tier
  security_center_subscription_pricing_resource_type = var.security_center_subscription_pricing_resource_type

  backup_policy_vm_name       = var.backup_policy_vm_name
  recovery_service_vault_name = var.recovery_service_vault_name
  backup_frequency            = var.backup_frequency
  backup_time                 = var.backup_time
  retention_daily_count       = var.retention_daily_count

  enable_disk_encryption        = var.enable_disk_encryption
  keyvault_key_name             = var.keyvault_key_name
  keyvault_id                   = var.keyvault_id
  principal_id                  = data.azurerm_client_config.current.object_id
  disk_encryption_name          = var.disk_encryption_name
  disk_encryption_identity_type = var.disk_encryption_identity_type

}

#Reference to ALERTS module
module "alert" {
  source = "../../modules/module_alert"
  action_group_name        = var.action_group_name
  resource_group_name      = var.resource_group_name
  resource_group_location  = var.location
  short_name               = var.short_name
  action_group_rule_name   = var.action_group_rule_name
  scope_type               = var.scope_type
  resource_id              = module.linux_virtual_machine.vm_id
  activity_log_alert_name  = var.activity_log_alert_name
  resource_group_id        = var.resource_group_id
  operation_name_log_alert = var.operation_name_log_alert
  category_log_alert       = var.category_log_alert
  metric_alert_name        = var.metric_alert_name
  storage_account_id       = var.storage_account_id
  metric_namespace         = var.metric_namespace
  metric_name              = var.metric_name
  aggregation              = var.aggregation
  operator                 = var.operator
  threshold                = var.threshold
  dimension_name           = var.dimension_name
  dimension_operator       = var.dimension_operator
  values                   = var.values
}
#---------------------------------------------------------------------------------------------------------#