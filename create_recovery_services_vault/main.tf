#Reference to recovery services vault module
module "recovery_service_vault" {
  source                             = "../../modules/module_recovery_services_vault/recovery_service_module"
  resource_group_name                = var.resource_group_name
  location                           = var.location
  recovery_vault_name                = var.recovery_vault_name
  recovery_vault_sku                 = var.recovery_vault_sku
  recovery_vault_storage_mode_type   = var.recovery_vault_storage_mode_type
  cross_region_restore_enabled       = var.cross_region_restore_enabled
  recovery_vault_soft_delete_enabled = var.recovery_vault_soft_delete_enabled
  identity_type                      = var.identity_type
  encryption_key_id                  = var.encryption_key_id
  infrastructure_encryption_enabled  = var.infrastructure_encryption_enabled
  use_system_assigned_identity       = var.use_system_assigned_identity
  tags                               = var.tags

  enable_backup_policy_file_share      = var.enable_backup_policy_file_share
  backup_policy_file_share_name        = var.backup_policy_file_share_name
  backup_policy_file_share_timezone    = var.backup_policy_file_share_timezone
  backup_policy_file_share_frequency   = var.backup_policy_file_share_frequency
  backup_policy_file_share_time        = var.backup_policy_file_share_time
  backup_policy_file_share_count       = var.backup_policy_file_share_count
  fs_policy_retention_weekly_count     = var.fs_policy_retention_weekly_count
  fs_policy_retention_weekly_weekdays  = var.fs_policy_retention_weekly_weekdays
  fs_policy_retention_monthly_count    = var.fs_policy_retention_monthly_count
  fs_policy_retention_monthly_weekdays = var.fs_policy_retention_monthly_weekdays
  fs_policy_retention_monthly_weeks    = var.fs_policy_retention_monthly_weeks
  fs_policy_retention_yearly_count     = var.fs_policy_retention_yearly_count
  fs_policy_retention_yearly_weekdays  = var.fs_policy_retention_yearly_weekdays
  fs_policy_retention_yearly_weeks     = var.fs_policy_retention_yearly_weeks
  fs_policy_retention_yearly_months    = var.fs_policy_retention_yearly_months

  enable_backup_policy_vm                         = var.enable_backup_policy_vm
  backup_policy_vm_name                           = var.backup_policy_vm_name
  backup_policy_vm_type                           = var.backup_policy_vm_type
  backup_policy_vm_instant_restore_retention_days = var.backup_policy_vm_instant_restore_retention_days
  backup_policy_vm_timezone                       = var.backup_policy_vm_timezone
  backup_policy_vm_frequency                      = var.backup_policy_vm_frequency
  backup_policy_vm_time                           = var.backup_policy_vm_time
  backup_policy_vm_hour_interval                  = var.backup_policy_vm_hour_interval
  backup_policy_vm_hour_duration                  = var.backup_policy_vm_hour_duration
  backup_policy_vm_weekdays                       = var.backup_policy_vm_weekdays
  backup_policy_vm_count                          = var.backup_policy_vm_count
  vm_policy_retention_weekly_count                = var.vm_policy_retention_weekly_count
  vm_policy_retention_weekly_weekdays             = var.vm_policy_retention_weekly_weekdays
  vm_policy_retention_monthly_count               = var.vm_policy_retention_monthly_count
  vm_policy_retention_monthly_weekdays            = var.vm_policy_retention_monthly_weekdays
  vm_policy_retention_monthly_weeks               = var.vm_policy_retention_monthly_weeks
  vm_policy_retention_yearly_count                = var.vm_policy_retention_yearly_count
  vm_policy_retention_yearly_weekdays             = var.vm_policy_retention_yearly_weekdays
  vm_policy_retention_yearly_weeks                = var.vm_policy_retention_yearly_weeks
  vm_policy_retention_yearly_months               = var.vm_policy_retention_yearly_months

  enable_backup_policy_vm_workload              = var.enable_backup_policy_vm_workload
  backup_policy_vm_workload_name                = var.backup_policy_vm_workload_name
  backup_policy_vm_workload_type                = var.backup_policy_vm_workload_type
  backup_policy_vm_workload_timezone            = var.backup_policy_vm_workload_timezone
  backup_policy_vm_workload_compression_enabled = var.backup_policy_vm_workload_compression_enabled
  //vm_workload_simple_retention_count            = var.vm_workload_simple_retention_count
  backup_policy_vm_protection_policy            = var.backup_policy_vm_protection_policy

}

# System Managed Service Identity of Recovery Service Vault does not have enough permissions to create private 
#endpoint in resource group or join it to a subnet.
data "azurerm_role_definition" "contributor" {
  name = "Contributor"
}
resource "azurerm_role_assignment" "peprassign" {
  scope              = var.resource_group_id
  role_definition_id = data.azurerm_role_definition.contributor.id
  principal_id       = module.recovery_service_vault.identity_principal_id
}

#Reference to module that provisions private endpoint
// By default this module is optional
module "PrivateEndpointSql_module" {
  count                             = var.create_private-endpoint ? 1 : 0
  source                            = "../../modules/module_private_endpoint"
  resource_group_name               = var.resource_group_name
  location                          = var.location
  tags                              = var.tags
  private_endpoint_name             = var.private_endpoint_name
  private_service_connection_name   = var.private_service_connection_name
  subresource_names                 = var.subresource_names
  is_manual_connection              = var.is_manual_connection
  request_message                   = var.request_message
  private_connection_resource_id    = module.recovery_service_vault.recovery_vault_id
  subnet_id                         = var.subnet_id
  private_dns_zone_group            = var.private_dns_zone_group
  private_connection_resource_alias = var.private_connection_resource_alias
}
/*
#Reference to module that provisions alerts resources
module "alert" {
  source                   = "../../modules/module_alert"
  action_group_name        = var.action_group_name
  resource_group_name      = var.resource_group_name
  resource_group_location  = var.location
  short_name               = var.short_name
  action_group_rule_name   = var.action_group_rule_name
  scope_type               = var.scope_type
  resource_id              = module.recovery_service_vault.recovery_vault_id
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

#Reference to module that provisions diagnostic resources
module "diag_settings" {
  source                          = "../../modules/module_diagnostics_settings"
  enable_log_monitoring           = var.enable_log_monitoring
  diag_name                       = var.diag_name
  target_resource_id              = module.recovery_service_vault.recovery_vault_id
  log_analytics_workspace_id      = var.log_analytics_workspace_id
  log_analytics_destination_type  = var.log_analytics_destination_type
  storage_account_id              = var.storage_account_id
  eventhub_name                   = var.eventhub_name
  eventhub_authorization_rule_id  = var.eventhub_authorization_rule_id
  log_enabled                     = var.log_enabled
  log_retention_policy_enabled    = var.log_retention_policy_enabled
  log_retention_days              = var.log_retention_days
  metric_retention_policy_enabled = var.metric_retention_policy_enabled
  metric_retention_days           = var.metric_retention_days
}
*/