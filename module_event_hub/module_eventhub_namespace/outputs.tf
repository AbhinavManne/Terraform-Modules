output "eventhub_namespace_id" {
  description = "Specifies the eventhub namespace id"
  value       = azurerm_eventhub_namespace.event_hub_namespace.id
}