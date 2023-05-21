
output "sql_database_id" {
  description = "The SQL Database ID"
  value       = azurerm_mssql_database.database.id
}

output "primary_sql_server_id" {
  description = "The primary Microsoft SQL Server ID"
  value       = azurerm_mssql_server.primary.id
}

output "primarysql_server_name" {
  description = "The name of the storage account"
  value       = azurerm_mssql_server.primary.name
}

output "secondary_sql_server_id" {
  description = "The secondary Microsoft SQL Server ID"
  value       = azurerm_mssql_server.secondary.*.id
}

output "sql_server_admin_user" {
  description = "SQL database administrator login id"
  value       = azurerm_mssql_server.primary.administrator_login
  sensitive   = true
}

output "sql_server_admin_password" {
  description = "SQL database administrator login password"
  value       = azurerm_mssql_server.primary.administrator_login_password
  sensitive   = true
}

output "sql_database_name" {
  description = "The SQL Database Name"
  value       = azurerm_mssql_database.database.*.name
}

output "sql_failover_group_id" {
  description = "A failover group of databases on a collection of Azure SQL servers."
  value       = azurerm_mssql_failover_group.failover_group.*.id 
}

