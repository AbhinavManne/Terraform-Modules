output "servicebus_namespace_network_rule_set_subnet_id" {
  description = "The subnet id to use for this module - passed as input"
  value       = data.azurerm_subnet.servicebus_namespace_network_rule_set_subnet.id
}

output "servicebus_namespace_network_rule_set_id" {
  description = "The ID of the ServiceBus Namespace Network Rule Set."
  value       = azurerm_servicebus_namespace_network_rule_set.servicebus_namespace_network_rule_set.id
}