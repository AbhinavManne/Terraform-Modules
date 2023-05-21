#DIAGNOSTIC_SETTINGS_MODULE

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
    resource_ids = [var.resource_id]
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
#-------------------------------------------------------------------------------------------------------#
