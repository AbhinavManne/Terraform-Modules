output "eventhub_ids" {
  description = "Specifies the ids for the eventhub created in the parent eventhub namespace"
  value       = [for eventhub in azurerm_eventhub.event_hub : eventhub.id]
}