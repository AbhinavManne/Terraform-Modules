#----RESOURCE: DIAGNOSTIC SETTING FOR LOG ANALYTICS----#
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
#----RESOURCE: ACTION GROUP----#
resource "azurerm_monitor_action_group" "example" {
  name                = var.action_group_name
  resource_group_name = var.resource_group_name
  short_name          = var.short_name
}

#----RESOURCE: ACTION RULE----#
resource "azurerm_monitor_action_rule_action_group" "example" {
  name                = var.action_group_rule_name
  resource_group_name = var.resource_group_name
  action_group_id     = azurerm_monitor_action_group.example.id

  scope {
    type         = var.scope_type
    resource_ids = [var.resource_group_id]
  }

  tags = {
    foo = "bar"
  }
}

#----RESOURCE: ACTIVITY LOG ALERT----#
resource "azurerm_monitor_activity_log_alert" "main" {
  name                = var.activity_log_alert_name
  resource_group_name = var.resource_group_name
  scopes              = [var.resource_group_id]
  description         = "This alert will monitor a specific resource updates."

  criteria {
    resource_id    = var.resource_id #to_monitor
    operation_name = var.operation_name_log_alert
    category       = var.category_log_alert
  }

  action {
    action_group_id = azurerm_monitor_action_group.example.id

    webhook_properties = {
      from = "terraform"
    }
  }
}

#----RESOURCE: METRIC ALERT----#
resource "azurerm_monitor_metric_alert" "example" {
  name                = var.metric_alert_name
  resource_group_name = var.resource_group_name
  scopes              = [var.storage_account_id]
  description         = "Action will be triggered when Transactions count is greater than 50."

  criteria {
    metric_namespace = var.metric_namespace
    metric_name      = var.metric_name
    aggregation      = var.aggregation
    operator         = var.operator
    threshold        = var.threshold

    dimension {
      name     = var.dimension_name
      operator = var.dimension_operator
      values   = var.values
    }
  }

  action {
    action_group_id = azurerm_monitor_action_group.example.id
  }
}

