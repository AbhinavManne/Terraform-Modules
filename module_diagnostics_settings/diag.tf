data "azurerm_monitor_diagnostic_categories" "diag_categories" {
  resource_id = var.target_resource_id 
}

resource "azurerm_monitor_diagnostic_setting" "diag_settings" {
  count                      = var.enable_log_monitoring == true ? 1 : 0
  name                       = var.diag_name
  target_resource_id         = var.target_resource_id
  log_analytics_workspace_id = var.log_analytics_workspace_id != null ? var.log_analytics_workspace_id : null
  log_analytics_destination_type = var.log_analytics_destination_type != null ? var.log_analytics_destination_type : null
  storage_account_id             = var.storage_account_id != null ? var.storage_account_id : null
  eventhub_name                  = var.eventhub_name != null ? var.eventhub_name : null
  eventhub_authorization_rule_id = var.eventhub_authorization_rule_id != null ? var.eventhub_authorization_rule_id : null

  dynamic log {
    for_each = data.azurerm_monitor_diagnostic_categories.diag_categories.logs
    content {
      category = log.value
      enabled  = var.log_enabled

      retention_policy {
        enabled = var.log_retention_policy_enabled
        days    = var.log_retention_days
      }
    }    
  }

  dynamic "metric" {
    for_each = data.azurerm_monitor_diagnostic_categories.diag_categories.metrics
    content {
      category = metric.value

      retention_policy {
        enabled = var.metric_retention_policy_enabled
        days    = var.metric_retention_days
      }
    }
  }
}
