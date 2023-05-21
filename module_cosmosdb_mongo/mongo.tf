#-----------------------------------RESOURCE: COSMOS DB MONGO DB DATABASE---------------------------------#
resource "azurerm_cosmosdb_mongo_database" "mongodb" {
  name                = var.mongo_db_name
  resource_group_name = var.resource_group_name
  account_name        = var.cosmosdb_account_name
  throughput          = var.mongodb_throughput
  dynamic "autoscale_settings" { //Switching between autoscale and manual throughput is not supported via Terraform and must be completed via the Azure Portal and refreshed.
    for_each = var.db_max_throughput != null ? [1] : []
    content {
      max_throughput = var.mongodb_throughput == null ? var.db_max_throughput : null
    }
  }
}

#-----------------------------------RESOURCE: COSMOS DB MONGO DB COLLECTION-------------------------------#
resource "azurerm_cosmosdb_mongo_collection" "mdb_collection" {
  name                   = var.mongodb_collection_name
  resource_group_name    = var.resource_group_name
  account_name           = var.cosmosdb_account_name
  database_name          = azurerm_cosmosdb_mongo_database.mongodb.name
  shard_key              = var.shard_key
  analytical_storage_ttl = var.analytical_storage_ttl
  default_ttl_seconds    = var.default_ttl_seconds
  throughput             = var.throughput

  dynamic "index" {
    for_each = var.index != null ? var.index : []
    content {
      keys   = index.value.keys
      unique = index.value.unique
    }
  }

  dynamic "autoscale_settings" {
    for_each = var.mdc_max_throughput != null ? [1] : []
    content {
      max_throughput = var.throughput == null ? var.mdc_max_throughput : null
    }
  }
}
