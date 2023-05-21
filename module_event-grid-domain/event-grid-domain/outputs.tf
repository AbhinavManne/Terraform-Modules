
output "eventgrid_domain_id" {
  value       = azurerm_eventgrid_domain.eventgrid.id
  description = "The ID of the EventGrid Domain"
}

output "eventgrid_domain_endpoint" {
  value       = azurerm_eventgrid_domain.eventgrid.endpoint
  description = "The Endpoint associated with the EventGrid Domain."
}

output "eventgrid_domain_primary_access_key" {
  value       = azurerm_eventgrid_domain.eventgrid.primary_access_key
  description = "The Primary Shared Access Key associated with the EventGrid Domain."
}

output "eventgrid_domain_secondary_access_key" {
  value       = azurerm_eventgrid_domain.eventgrid.secondary_access_key
  description = "The Secondary Shared Access Key associated with the EventGrid Domain"
}

output "eventgrid_domain_topic_id" {
  value       = azurerm_eventgrid_domain_topic.domaintopic.id
  description = "The ID of the EventGrid Domain topic"
}