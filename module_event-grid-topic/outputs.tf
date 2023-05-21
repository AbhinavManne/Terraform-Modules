output "eventgrid_topic_id" {
  value       = azurerm_eventgrid_topic.egt.id
  description = "The ID of the EventGrid topic"
}

output "eventgrid_topic_endpoint" {
  value       = azurerm_eventgrid_topic.egt.endpoint
  description = "The Endpoint associated with the EventGrid Topic."
}

output "eventgrid_topic_primary_access_key" {
  value       = azurerm_eventgrid_topic.egt.primary_access_key
  description = "The Primary Shared Access Key associated with the EventGrid Topic"
}

output "eventgrid_topic_secondary_access_key" {
  value       = azurerm_eventgrid_topic.egt.secondary_access_key
  description = " The Secondary Shared Access Key associated with the EventGrid Topic"
}

