output "diag_id" {
  value       = azurerm_monitor_diagnostic_setting.diag_settings.0.id
  description = "ID of the diagnostic settings resource"
}