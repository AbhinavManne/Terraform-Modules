output "data_factory_integration_runtime_id" {
  description = "Azure Data factory integration runtime id"
  value       = azurerm_data_factory_integration_runtime_self_hosted.integration_runtime.id
}