#Reference to monitor diagnostic settings creation module
module "module_create_monitor_diagnostic_setting" {
  source                  = "../../modules/module_monitor-diagnostic-settings"
  resource_group_name     = var.resource_group_name
  storage_account_name    = var.storage_account_name
  key_vault_name          = var.key_vault_name
  diagnostic_setting_name = var.diagnostic_setting_name
  log_category            = var.log_category
  metric_category         = var.metric_category
  enabled                 = var.enabled
}