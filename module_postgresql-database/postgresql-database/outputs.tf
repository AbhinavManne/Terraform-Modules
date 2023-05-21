
output "postgresql_server_id" {
  description = "The resource ID of the MySQL Server"
  value       = azurerm_postgresql_server.main.id
}

output "postgresql_server_fqdn" {
  description = "The FQDN of the MySQL Server"
  value       = azurerm_postgresql_server.main.fqdn
}

output "postgresql_database_id" {
  description = "The resource ID of the MySQL Database"
  value       = azurerm_postgresql_database.main.id
}

