#Reference to VIRTUAL MACHINE module
module "virtual_machine" {
  source              = "../../modules/module_windows-vm/vm_module"
  resource_group_name = var.resource_group_name
  location            = var.location
  resource_group_id   = var.resource_group_id

  virtual_machine_name  = var.virtual_machine_name
  network_interface_ids = var.network_interface_ids
  vm_size               = var.vm_size
  license_type          = var.license_type
  availability_set_id   = var.availability_set_id
  admin_username        = var.admin_username
  admin_password        = var.admin_password

  source_image_id               = var.source_image_id
  provision_vm_agent            = var.provision_vm_agent
  allow_extension_operations    = var.allow_extension_operations
  dedicated_host_id             = var.dedicated_host_id
  custom_data                   = var.custom_data
  enable_automatic_updates      = var.enable_automatic_updates
  enable_encryption_at_host     = var.enable_encryption_at_host
  proximity_placement_group_id  = var.proximity_placement_group_id
  patch_mode                    = var.patch_mode
  vm_availability_zone          = var.vm_availability_zone
  vm_time_zone                  = var.vm_time_zone
  capacity_reservation_group_id = var.capacity_reservation_group_id
  computer_name                 = var.computer_name
  dedicated_host_group_id       = var.dedicated_host_group_id
  edge_zone                     = var.edge_zone
  eviction_policy               = var.eviction_policy
  extensions_time_budget        = var.extensions_time_budget
  hotpatching_enabled           = var.hotpatching_enabled
  max_bid_price                 = var.max_bid_price
  priority                      = var.priority
  secure_boot_enabled           = var.secure_boot_enabled
  user_data                     = var.user_data
  virtual_machine_scale_set_id  = var.virtual_machine_scale_set_id
  vtpm_enabled                  = var.vtpm_enabled
  platform_fault_domain         = var.platform_fault_domain

  publisher                           = var.publisher
  offer                               = var.offer
  vm_sku                              = var.vm_sku
  latest_version                      = var.latest_version
  storage_os_disk                     = var.storage_os_disk
  caching                             = var.caching
  storage_account_type                = var.storage_account_type
  disk_size_gb                        = var.disk_size_gb
  enable_os_disk_write_accelerator    = var.enable_os_disk_write_accelerator
  security_encryption_type            = var.security_encryption_type
  enable_diff_disk_settings           = var.enable_diff_disk_settings
  diff_disk_settings_option           = var.diff_disk_settings_option
  diff_disk_settings_placement        = var.diff_disk_settings_placement
  plan_vm                             = var.plan_vm
  product_vm                          = var.product_vm
  publisher_vm                        = var.publisher_vm
  enable_secret_vm                    = var.enable_secret_vm
  secret_certificate_store            = var.secret_certificate_store
  secret_certificate_url              = var.secret_certificate_url
  key_vault_id                        = var.key_vault_id
  enable_termination_notification     = var.enable_termination_notification
  termination_notification_timeout    = var.termination_notification_timeout
  enable_ultra_ssd                    = var.enable_ultra_ssd
  winrm_protocol                      = var.winrm_protocol
  key_vault_certificate_secret_url    = var.key_vault_certificate_secret_url
  additional_unattend_content         = var.additional_unattend_content
  additional_unattend_content_setting = var.additional_unattend_content_setting
  enable_boot_diagnostics             = var.enable_boot_diagnostics
  str_primary_blob_endpoint           = var.str_primary_blob_endpoint
  storage_account_uri                 = var.storage_account_uri

  managed_identity_type = var.managed_identity_type
  managed_identity_ids  = var.managed_identity_ids
  tags                  = var.tags

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

  log_analytics_workspace_id            = var.log_analytics_workspace_id
  log_primary_shared_key                = var.log_primary_shared_key
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

  storage_account_name            = var.storage_account_name
  storage_primary_access_key      = var.storage_primary_access_key
  diag_name                       = var.diag_name
  diag_publisher                  = var.diag_publisher
  diag_type                       = var.diag_type
  diag_type_handler_version       = var.diag_type_handler_version
  diag_auto_upgrade_minor_version = var.diag_auto_upgrade_minor_version

  log_analytics_id          = var.log_analytics_id
  security_center_workspace = var.security_center_workspace

  recovery_service_vault_name = var.recovery_service_vault_name
  backup_policy_vm_name       = var.backup_policy_vm_name
  backup_frequency            = var.backup_frequency
  backup_time                 = var.backup_time
  retention_daily_count       = var.retention_daily_count

  enable_disk_encryption        = var.enable_disk_encryption
  keyvault_key_name             = var.keyvault_key_name
  keyvault_id                   = var.keyvault_id
  disk_encryption_name          = var.disk_encryption_name
  disk_encryption_identity_type = var.disk_encryption_identity_type

}

#Reference to ALERTS module
module "alert" {
  source                   = "../../modules/module_alert"
  action_group_name        = var.action_group_name
  resource_group_name      = var.resource_group_name
  resource_group_location  = var.location
  short_name               = var.short_name
  action_group_rule_name   = var.action_group_rule_name
  scope_type               = var.scope_type
  resource_id              = module.virtual_machine.vm_id
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