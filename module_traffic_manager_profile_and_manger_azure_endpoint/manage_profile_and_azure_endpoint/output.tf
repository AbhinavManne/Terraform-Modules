
output "profile_id" {
  value = azurerm_traffic_manager_profile.traffic_manager_profile.id
}

output "azure_end_point_id" {
  value = azurerm_traffic_manager_azure_endpoint.manager_azure_endpoint.id
}

