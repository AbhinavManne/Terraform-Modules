output "traffic_manager_external_endpoint_id" {
  value = azurerm_traffic_manager_external_endpoint.external_endpoint.id
}

output "traffic_manager_external_endpoint_name" {
  value = azurerm_traffic_manager_external_endpoint.external_endpoint.name
}

output "profile_id" {
  value = azurerm_traffic_manager_profile.manager_profile.id
}