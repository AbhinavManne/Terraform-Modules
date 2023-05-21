
output "resource_id" {
  value = azurerm_application_insights.service-application-insights.id
}

output "resource_group_name" {
  value = data.azurerm_resource_group.example.name
}

output "resource_group_id" {
  value = data.azurerm_resource_group.example.id #Use data source if creating resources in existing RG-> data.azurerm_resource_group.rg.0.id
}

output "resource_group_location" {
  value = data.azurerm_resource_group.example.location
}