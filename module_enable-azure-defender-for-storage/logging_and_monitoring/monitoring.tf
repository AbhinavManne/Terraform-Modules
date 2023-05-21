
###################################################################################
#Action group
##################################################################################
resource "azurerm_monitor_action_group" "example" {
  name                = var.action_group_name
  resource_group_name = var.resource_group_name
  short_name          = var.short_name
}

###################################################################################
#Activity log alert
###################################################################################
resource "azurerm_monitor_activity_log_alert" "main" {
  name                = var.activity_log_alert_name
  resource_group_name = var.resource_group_name
  scopes              = [var.resource_id]
  description         = "This alert will monitor a specific resource updates."

  criteria {
    resource_id    = var.resource_id
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


#############################################################################################
#metric alerts
#############################################################################################
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


#---------------------------------------------------------------------------------------------
