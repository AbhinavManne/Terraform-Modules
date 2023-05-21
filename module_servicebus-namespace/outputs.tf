output "servicebus_namespace_id" {
  description = "The ServiceBus Namespace ID."
  value       = azurerm_servicebus_namespace.servicebus_namespace.id
}

output "servicebus_namespace_identity_principal_id" {
  value       = azurerm_servicebus_namespace.servicebus_namespace.identity.0.principal_id #block
  description = "The Principal ID for the Service Principal associated with the Managed Service Identity of this ServiceBus Namespace."
}

output "servicebus_namespace_identity_tenant_id" {
  value       = azurerm_servicebus_namespace.servicebus_namespace.identity.0.tenant_id #block
  description = "The Tenant ID for the Service Principal associated with the Managed Service Identity of this ServiceBus Namespace."
}
