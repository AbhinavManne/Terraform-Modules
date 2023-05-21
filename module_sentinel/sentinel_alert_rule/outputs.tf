output "sentinel_fusion_alert_rule_id" {
  value       = azurerm_sentinel_alert_rule_fusion.alert_rule_fusion.id
  description = " The ID of the Sentinel Fusion Alert Rule."
}

output "sentinel_machine_learning_behavior_analytics_alert_rule_id" {
  value       = azurerm_sentinel_alert_rule_machine_learning_behavior_analytics.alert_rule_machine_learning_behavior_analytics.id
  description = "The ID of the Sentinel Machine Learning Behavior Analytics Alert Rule."
}

output "sentinel_ms_security_incident_alert_rule_id" {
  value       = azurerm_sentinel_alert_rule_ms_security_incident.alert_rule_ms_security_incident.id
  description = "The ID of the Sentinel MS Security Incident Alert Rule."
}

output "sentinel_nrt_alert_rule_id" {
  value       = azurerm_sentinel_alert_rule_nrt.alert_rule_nrt.id
  description = "The ID of the Sentinel NRT Alert Rule."
}

output "sentinel_scheduled_alert_rule_id" {
  value       = azurerm_sentinel_alert_rule_scheduled.alert_rule_scheduled.id
  description = "The ID of the Sentinel Scheduled Alert Rule."
}
