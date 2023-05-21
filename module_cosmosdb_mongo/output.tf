output "mongodb_id" {
  value       = azurerm_cosmosdb_mongo_database.mongodb.id
  description = "The ID of the Cosmos DB Mongo Database."
}

output "mongodb_collection_id" {
  value       = azurerm_cosmosdb_mongo_collection.mdb_collection.id
  description = "The ID of the Cosmos DB Mongo Collection."
}

