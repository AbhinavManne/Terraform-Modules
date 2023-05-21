output "servicebus_namespace_id" {
  description = "The ServiceBus Topic ID."
  value       = azurerm_servicebus_namespace_authorization_rule.servicebus_namespace_authorization.id
}

output "servicebus_namespace_primary_key" {
  description = "The Primary Key for the ServiceBus Namespace authorization Rule."
  value       = azurerm_servicebus_namespace_authorization_rule.servicebus_namespace_authorization.primary_key
}

output "servicebus_namespace_primary_connection_string" {
  description = "The Primary Connection String for the ServiceBus Namespace authorization Rule."
  value       = azurerm_servicebus_namespace_authorization_rule.servicebus_namespace_authorization.primary_connection_string
}

output "servicebus_namespace_secondary_key" {
  description = "The Secondary Key for the ServiceBus Namespace authorization Rule."
  value       = azurerm_servicebus_namespace_authorization_rule.servicebus_namespace_authorization.secondary_key
}

output "servicebus_namespace_secondary_connection_string" {
  description = "The Secondary Connection String for the ServiceBus Namespace authorization Rule."
  value       = azurerm_servicebus_namespace_authorization_rule.servicebus_namespace_authorization.secondary_connection_string
}

output "servicebus_namespace_primary_connection_string_alias" {
  description = "The alias Primary Connection String for the ServiceBus Namespace, if the namespace is Geo DR paired."
  value       = azurerm_servicebus_namespace_authorization_rule.servicebus_namespace_authorization.primary_connection_string_alias
}

output "servicebus_namespace_secondary_connection_string_alias" {
  description = "The alias Secondary Connection String for the ServiceBus Namespace."
  value       = azurerm_servicebus_namespace_authorization_rule.servicebus_namespace_authorization.secondary_connection_string_alias
}

