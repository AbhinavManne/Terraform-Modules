
output "mysql_server_id" {
  description = "The resource ID of the MySQL Server"
  value       = azurerm_mysql_server.mysql.id
}

output "mysql_server_fqdn" {
  description = "The FQDN of the MySQL Server"
  value       = azurerm_mysql_server.mysql.fqdn
}

output "mysql_database_id" {
  description = "The resource ID of the MySQL Database"
  value       = [for k in azurerm_mysql_database.mysql_database : k.id]
}

