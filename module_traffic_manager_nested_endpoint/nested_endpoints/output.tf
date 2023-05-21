output "nested_endpoint_id" {
  value = azurerm_traffic_manager_nested_endpoint.traffic_manager_nested_endpoint.id
}

output "parent_id" {
  value = azurerm_traffic_manager_profile.parent.id
}

output "nested_id" {
  value = azurerm_traffic_manager_profile.nested.id
}