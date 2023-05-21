output "kusto_database_id" {
  value       = azurerm_kusto_database.kusto_database.id
  description = "ID of the created kusto database"
}