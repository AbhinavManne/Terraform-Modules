output "eventhub_namespace_disaster_recovery_config_id" {
  description = "Specifies the eventhub namespace disaster recovery config id"
  value       = var.create_disaster_recovery_configuration == true ? azurerm_eventhub_namespace_disaster_recovery_config.event_hub_namespace_disaster_recovery_config[0].id : null
}