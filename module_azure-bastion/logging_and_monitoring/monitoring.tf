###################################################################################
#Diagnostic Setting
##################################################################################
resource "azurerm_monitor_diagnostic_setting" "example" {
  name               = var.diag_setting_name
  target_resource_id = var.resource_id
  storage_account_id = var.storage_account_id

  log {
    category = var.log_category
    enabled  = var.enabled_log

    retention_policy {
      enabled = var.enabled_retention_log
      days    = var.days_retention_log
    }
  }
  metric {
    category = var.metric_category
    retention_policy {
      enabled = var.enabled_retention_metric
      days    = var.days_retention_metric
    }
  }
}

