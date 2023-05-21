resource "azurerm_sentinel_automation_rule" "automation_rule" {
  name                       = var.automation_rule_config.name
  log_analytics_workspace_id = var.automation_rule_config.log_analytics_workspace_id
  display_name               = var.automation_rule_config.display_name
  order                      = var.automation_rule_config.order
  dynamic "action_incident" {
    for_each = var.automation_rule_config.action_incident.order != null ? [1] : []
    content {
      order                  = var.automation_rule_config.action_incident.order
      status                 = var.automation_rule_config.action_incident.status
      classification         = var.automation_rule_config.action_incident.classification
      classification_comment = var.automation_rule_config.action_incident.classification_comment
      labels                 = var.automation_rule_config.action_incident.labels
      owner_id               = var.automation_rule_config.action_incident.owner_id
      severity               = var.automation_rule_config.action_incident.severity
    }
  }
  dynamic "action_playbook" {
    for_each = var.automation_rule_config.action_playbook.logic_app_id != null && var.automation_rule_config.action_playbook.order != null ? [1] : []
    content {
      logic_app_id = var.automation_rule_config.action_playbook.logic_app_id
      order        = var.automation_rule_config.action_playbook.order
      tenant_id    = var.automation_rule_config.action_playbook.tenant_id
    }
  }
  dynamic "condition" {
    for_each = var.automation_rule_config.condition.operator != null && var.automation_rule_config.condition.property != null && var.automation_rule_config.condition.values != null ? [1] : []
    content {
      operator = var.automation_rule_config.condition.operator
      property = var.automation_rule_config.condition.property
      values   = var.automation_rule_config.condition.values
    }
  }
  enabled    = var.automation_rule_config.enabled
  expiration = var.automation_rule_config.expiration
}
