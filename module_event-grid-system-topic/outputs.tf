output "eventgrid_system_topic_id" {
  value       = azurerm_eventgrid_system_topic.systemtopic.id
  description = "The ID of the Event Grid System Topic"
}

output "eventgrid_system_topic_metric_arm_resource_id" {
  value       = azurerm_eventgrid_system_topic.systemtopic.metric_arm_resource_id
  description = "The Metric ARM Resource ID of the Event Grid System Topic"
}
