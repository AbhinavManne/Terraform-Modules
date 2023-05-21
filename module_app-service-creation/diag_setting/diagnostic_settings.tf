
#######################################################################################

resource "azurerm_monitor_diagnostic_setting" "example" {
  name               = var.diag_setting_name #"example"
  target_resource_id = var.resource_id
  storage_account_id = var.storage_account_id

  metric {
    category = var.metric_category #"AllMetrics"

    retention_policy {
      enabled = var.enabled_retention_metric #true
      days    = var.days_retention_metric    #7
    }
  }
}


###################################################################################
resource "azurerm_monitor_action_group" "example" {
  name                = var.action_group_name #"example-action-group"
  resource_group_name = var.resource_group_name
  short_name          = var.short_name #"actiongroup"
}

###################################################################################
resource "azurerm_monitor_action_rule_action_group" "example" {
  name                = var.action_group_rule_name #"example-aabya"
  resource_group_name = var.resource_group_name
  action_group_id     = azurerm_monitor_action_group.example.id

  scope {
    type         = var.scope_type #"Resource"
    resource_ids = [var.resource_id]
  }

  tags = {
    foo = "bar"
  }
}


###################################################################################
resource "azurerm_monitor_activity_log_alert" "main" {
  name                = var.activity_log_alert_name #"example-activitylogalert"
  resource_group_name = var.resource_group_name
  scopes              = [var.resource_group_id]
  description         = "This alert will monitor a specific resource updates."

  criteria {
    resource_id    = var.resource_id              #to_monitor
    operation_name = var.operation_name_log_alert #change --- #"Microsoft.Storage/storageAccounts/write"
    category       = var.category_log_alert       #change--- #"Recommendation"
  }

  action {
    action_group_id = azurerm_monitor_action_group.example.id

    webhook_properties = {
      from = "terraform"
    }
  }
}


#############################################################################################
resource "azurerm_monitor_metric_alert" "example" {
  name                = var.metric_alert_name #"example-metricalert"
  resource_group_name = var.resource_group_name
  scopes              = [var.storage_account_id]
  description         = "Action will be triggered when Transactions count is greater than 50."

  criteria {
    metric_namespace = var.metric_namespace #"Microsoft.Storage/storageAccounts"
    metric_name      = var.metric_name      #"Transactions"
    aggregation      = var.aggregation      #"Total"
    operator         = var.operator         #"GreaterThan"
    threshold        = var.threshold        #50

    dimension {
      name     = var.dimension_name     #"ApiName"
      operator = var.dimension_operator #"Include"
      values   = var.values             #["*"]
    }
  }

  action {
    action_group_id = azurerm_monitor_action_group.example.id
  }
}


##################################################################################################

