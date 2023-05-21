output "cosmosdb_account_id" {
  value       = azurerm_cosmosdb_account.cosmosdb.id
  description = "The CosmosDB Account ID."
}

output "endpoint" {
  value       = azurerm_cosmosdb_account.cosmosdb.endpoint
  description = "The endpoint used to connect to the CosmosDB account."
}

output "read_endpoints" {
  value       = azurerm_cosmosdb_account.cosmosdb.read_endpoints
  description = "A list of read endpoints available for this CosmosDB account."
}

output "write_endpoints" {
  value       = azurerm_cosmosdb_account.cosmosdb.write_endpoints
  description = "A list of write endpoints available for this CosmosDB account."
}

output "primary_key" {
  value       = azurerm_cosmosdb_account.cosmosdb.primary_key
  description = "The Primary key for the CosmosDB Account."
}

output "secondary_key" {
  value       = azurerm_cosmosdb_account.cosmosdb.secondary_key
  description = "The Secondary key for the CosmosDB Account."
}

output "primary_readonly_key" {
  value       = azurerm_cosmosdb_account.cosmosdb.primary_readonly_key
  description = "The Primary read-only Key for the CosmosDB Account."
}

output "secondary_readonly_key" {
  value       = azurerm_cosmosdb_account.cosmosdb.secondary_readonly_key
  description = "The Secondary read-only key for the CosmosDB Account."
}

output "connection_strings" {
  value       = azurerm_cosmosdb_account.cosmosdb.connection_strings
  description = "A list of connection strings available for this CosmosDB account."
}
