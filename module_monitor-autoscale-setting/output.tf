output "autoscale_setting_id" {
  value = azurerm_monitor_autoscale_setting.autoscale_setting_policy.id
  description = "Id of Autoscale Setting Policy"
}