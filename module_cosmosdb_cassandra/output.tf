output "cass_keyspace_id" {
  value       = azurerm_cosmosdb_cassandra_keyspace.ckeyspace.id
  description = "the ID of the CosmosDB Cassandra KeySpace."
}

output "cass_table_id" {
  value       = azurerm_cosmosdb_cassandra_table.ctable.id
  description = "the ID of the CosmosDB Cassandra Table."
}
