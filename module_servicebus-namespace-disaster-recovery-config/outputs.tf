output "servicebus_namespace_disaster_recovery_config_id" {
  description = " The Service Bus Namespace Disaster Recovery Config ID."
  value       = azurerm_servicebus_namespace_disaster_recovery_config.servicebus_namespace_disaster_recovery_config.id
}

output "servicebus_namespace_disaster_recovery_config_default_primary_key" {
  description = " The primary access key for the authorization rule RootManageSharedAccessKey."
  value       = azurerm_servicebus_namespace_disaster_recovery_config.servicebus_namespace_disaster_recovery_config.default_primary_key
}

output "servicebus_namespace_disaster_recovery_config_default_secondary_key" {
  description = "The secondary access key for the authorization rule RootManageSharedAccessKey."
  value       = azurerm_servicebus_namespace_disaster_recovery_config.servicebus_namespace_disaster_recovery_config.default_secondary_key
}

output "servicebus_namespace_disaster_recovery_config_primary_connection_string_alias" {
  description = "The alias Primary Connection String for the ServiceBus Namespace."
  value       = azurerm_servicebus_namespace_disaster_recovery_config.servicebus_namespace_disaster_recovery_config.primary_connection_string_alias
}

output "servicebus_namespace_disaster_recovery_config_secondary_connection_string_alias" {
  description = "The alias Secondary Connection String for the ServiceBus Namespace"
  value       = azurerm_servicebus_namespace_disaster_recovery_config.servicebus_namespace_disaster_recovery_config.secondary_connection_string_alias
}

