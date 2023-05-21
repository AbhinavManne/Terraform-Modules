
output "analysis_server_id" {
  value = azurerm_analysis_services_server.analysis_server.id
  description = "ID of the analysis services server"
}

output "analysis_server_name" {
  value = azurerm_analysis_services_server.analysis_server.name
  description = "Name of the analysis services server"
}