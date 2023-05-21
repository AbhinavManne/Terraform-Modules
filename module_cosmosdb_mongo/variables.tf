#----MONGODB DATABASE----#
variable "mongo_db_name" {
  type        = string
  description = "Specifies the name of the Cosmos DB Mongo Database."
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name"
}

variable "cosmosdb_account_name" {
  type        = string
  description = "Specifies the name of the CosmosDB Account."
}

variable "mongodb_throughput" {
  type        = number
  description = "The throughput of the MongoDB database (RU/s). Must be set in increments of 100. The minimum value is 400. This must be set upon database creation otherwise it cannot be updated without a manual terraform destroy-apply."
}

variable "db_max_throughput" {
  type        = number
  description = "The maximum throughput of the MongoDB database (RU/s). Must be between 1,000 and 1,000,000. Must be set in increments of 1,000. Conflicts with throughput."
}

#----MONGODB COLLECTION----#
variable "mongodb_collection_name" {
  type        = string
  description = "Specifies the name of the Cosmos DB Mongo Collection. "
}

variable "shard_key" {
  type        = string
  description = "The name of the key to partition on for sharding. There must not be any other unique index keys."
}

variable "analytical_storage_ttl" {
  type        = string
  description = " The default time to live of Analytical Storage for this Mongo Collection. If present and the value is set to -1, it is equal to infinity, and items don’t expire by default. If present and the value is set to some number n – items will expire n seconds after their last modified time."
}

variable "default_ttl_seconds" {
  type        = string
  description = " The default Time To Live in seconds. If the value is -1 or 0, items are not automatically expired."
}

variable "throughput" {
  type        = number
  description = " The throughput of the MongoDB collection (RU/s). Must be set in increments of 100. The minimum value is 400. This must be set upon database creation otherwise it cannot be updated without a manual terraform destroy-apply."
}

variable "index" {
  type = list(object({
    keys   = list(string)
    unique = bool
  }))
  description = "keys - (Required) Specifies the list of user settable keys for each Cosmos DB Mongo Collection. unique - (Optional) Is the index unique or not? Defaults to false."
}

variable "mdc_max_throughput" {
  type        = number
  description = "The maximum throughput of the MongoDB collection (RU/s). Must be between 1,000 and 1,000,000. Must be set in increments of 1,000. Conflicts with throughput."
}
