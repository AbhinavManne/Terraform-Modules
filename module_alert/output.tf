output "action_group_id" {
  value       = azurerm_monitor_action_group.mactiong.id
  description = "Monitor action group ID"
}

output "action_rule_id" {
  value       = azurerm_monitor_action_rule_action_group.mactionrg.id
  description = "Monitor action rule ID"
}

output "log_alert_id" {
  value       = azurerm_monitor_activity_log_alert.log_alert.id
  description = "Monitor log alert ID"
}

output "metric_alert_id" {
  value       = azurerm_monitor_metric_alert.metric_alert.id
  description = "Monitor metric alert ID"
}
