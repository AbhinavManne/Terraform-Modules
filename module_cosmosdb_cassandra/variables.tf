#---- CASSANDRA KEYSPACE----#
variable "cass_keyspace_name" {
  type        = string
  description = "Specifies the name of the Cosmos DB Cassandra KeySpace. Changing this forces a new resource to be created."
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name"
}

variable "cosmosdb_account_name" {
  type        = string
  description = "Specifies the name of the CosmosDB Account."
}

variable "keyspace_throughput" {
  type        = number
  description = "The throughput of Cassandra KeySpace (RU/s). Must be set in increments of 100. The minimum value is 400. This must be set upon database creation otherwise it cannot be updated without a manual terraform destroy-apply."
}

variable "keyspace_max_throughput" {
  type        = number
  description = "The maximum throughput of the Cassandra KeySpace (RU/s). Must be between 1,000 and 1,000,000. Must be set in increments of 1,000. Conflicts with throughput."
}

#----CASSANDRA TABLE----#
variable "cass_table_name" {
  type        = string
  description = "Specifies the name of the Cosmos DB Cassandra Table. Changing this forces a new resource to be created."
}

variable "ctable_throughput" {
  type        = number
  description = "The throughput of Cassandra KeySpace (RU/s). Must be set in increments of 100. The minimum value is 400. This must be set upon database creation otherwise it cannot be updated without a manual terraform destroy-apply."
}

variable "default_ttl" {
  type        = number
  description = "Time to live of the Cosmos DB Cassandra table. Possible values are at least -1. -1 means the Cassandra table never expires."
}

variable "analytical_storage_ttl" {
  type        = number
  description = " Time to live of the Analytical Storage. Possible values are between -1 and 2147483647 except 0. -1 means the Analytical Storage never expires. Changing this forces a new resource to be created."
}

variable "schema" {
  type = object({
    column = list(object({
      name = string
      type = string
    }))
    partition_key = list(object({
      name = string
    }))
    cluster_key = list(object({
      name     = string
      order_by = string
    }))
  })
  description = "schema block of cassandra table"
}

variable "ctable_max_throughput" {
  type        = number
  description = "The maximum throughput of the Cassandra Table (RU/s). Must be between 1,000 and 1,000,000. Must be set in increments of 1,000. Conflicts with throughput."
}
