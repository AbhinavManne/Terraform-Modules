variable "resource_group_name" {
  type        = string
  description = "Resource group name"
}

variable "location" {
  type        = string
  description = "The location/region to keep all your resources. To get the list of all locations with table format from azure cli, run 'az account list-locations -o table'"
}

variable "cosmosdb_account_name" {
  type        = string
  description = "Specifies the name of the CosmosDB Account."
}

variable "cosmosdb_offer_type" {
  type        = string
  description = "Specifies the Offer Type to use for this CosmosDB Account - currently this can only be set to Standard"
}

variable "cosmosdb_kind" {
  type        = string
  description = "Specifies the Kind of CosmosDB to create - possible values are GlobalDocumentDB and MongoDB. Defaults to GlobalDocumentDB"
}

variable "cosmosdb_create_mode" {
  type        = string
  description = "The creation mode for the CosmosDB Account. Possible values are Default and Restore. "
}

variable "default_identity_type" {
  type        = string
  description = "The default identity for accessing Key Vault. Possible values are FirstPartyIdentity, SystemAssignedIdentity or start with UserAssignedIdentity. Defaults to FirstPartyIdentity."
}

variable "enable_automatic_failover" {
  type        = bool
  description = "Enable automatic fail over for this Cosmos DB account."
}

variable "ip_range_filter" {
  type        = string
  description = "CosmosDB Firewall Support: This value specifies the set of IP addresses or IP address ranges in CIDR form to be included as the allowed list of client IP's for a given database account. IP addresses/ranges must be comma separated and must not contain any spaces."
}

variable "enable_free_tier" {
  type        = bool
  description = "Enable Free Tier pricing option for this Cosmos DB account. Defaults to false"
}

variable "analytical_storage_enabled" {
  type        = bool
  description = "Enable Analytical Storage option for this Cosmos DB account. Defaults to false"
}

variable "enable_multiple_write_locations" {
  type        = bool
  description = "Enable multiple write locations for this Cosmos DB account."
}

variable "access_key_metadata_writes_enabled" {
  type        = string
  description = "Is write operations on metadata resources (databases, containers, throughput) via account keys enabled? Defaults to true."
}

variable "public_network_access_enabled" {
  type        = bool
  description = "Whether or not public network access is allowed for this CosmosDB account."
}

variable "is_virtual_network_filter_enabled" {
  type        = bool
  description = "Enables virtual network filtering for this Cosmos DB account."
}

variable "key_vault_key_id" {
  type        = string
  description = "Keyvault key ID"
}

variable "network_acl_bypass_for_azure_services" {
  type        = string
  description = " If azure services can bypass ACLs. Defaults to false."
}

variable "network_acl_bypass_ids" {
  type        = list(string)
  description = "The list of resource Ids for Network Acl Bypass for this Cosmos DB account."
}

variable "mongo_server_version" {
  type        = string
  description = "The Server Version of a MongoDB account. Possible values are 4.2, 4.0, 3.6, and 3.2."
}

variable "local_authentication_disabled" {
  type        = bool
  description = " Disable local authentication and ensure only MSI and AAD can be used exclusively for authentication. Defaults to false. Can be set only when using the SQL API."
}

variable "consistency_level" {
  type        = string
  description = "The Consistency Level to use for this CosmosDB Account - can be either BoundedStaleness, Eventual, Session, Strong or ConsistentPrefix"
}

variable "max_interval_in_seconds" {
  type        = number
  description = "When used with the Bounded Staleness consistency level, this value represents the time amount of staleness (in seconds) tolerated. Accepted range for this value is 5 - 86400 (1 day). Defaults to 5. Required when consistency_level is set to BoundedStaleness."
}

variable "max_staleness_prefix" {
  type        = number
  description = "When used with the Bounded Staleness consistency level, this value represents the number of stale requests tolerated. Accepted range for this value is 10 – 2147483647. Defaults to 100. Required when consistency_level is set to BoundedStaleness."
}

variable "failover_location" {
  type        = string
  description = "The name of the Azure region to host replicated data."
}

variable "failover_priority" {
  type        = string
  description = "The failover priority of the region. A failover priority of 0 indicates a write region. The maximum value for a failover priority = (total number of regions - 1). Failover priority values must be unique for each of the regions in which the database account exists."
}

variable "zone_redundant" {
  type        = bool
  description = "Should zone redundancy be enabled for this region? Defaults to false."
}

variable "capabilities_name" {
  type        = string
  description = " The capability to enable - Possible values are AllowSelfServeUpgradeToMongo36, DisableRateLimitingResponses, EnableAggregationPipeline, EnableCassandra, EnableGremlin, EnableMongo, EnableTable, EnableServerless, MongoDBv3.4 and mongoEnableDocLevelTTL."
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID"
}

variable "ignore_missing_vnet_service_endpoint" {
  type        = string
  description = "If set to true, the specified subnet will be added as a virtual network rule even if its CosmosDB service endpoint is not active. Defaults to false"
}

variable "schema_type" {
  type        = string
  description = "The schema type of the Analytical Storage for this Cosmos DB account. Possible values are FullFidelity and WellDefined."
}

variable "total_throughput_limit" {
  type        = string
  description = " The total throughput limit imposed on this Cosmos DB account (RU/s). Possible values are at least -1. -1 means no limit."
}

variable "backup_type" {
  type        = string
  description = "The type of the backup. Possible values are Continuous and Periodic. Defaults to Periodic. Migration of Periodic to Continuous is one-way, changing Continuous to Periodic forces a new resource to be created."
}

variable "backup_interval_in_minutes" {
  type        = number
  description = "The interval in minutes between two backups. This is configurable only when type is Periodic. Possible values are between 60 and 1440."
}

variable "backup_retention_in_hours" {
  type        = number
  description = "The time in hours that each backup is retained. This is configurable only when type is Periodic. Possible values are between 8 and 720."
}

variable "backup_storage_redundancy" {
  type        = string
  description = " The storage redundancy which is used to indicate type of backup residency. This is configurable only when type is Periodic. Possible values are Geo, Local and Zone."
}

variable "cors_rule" {
  type = object({
    allowed_headers    = string
    allowed_methods    = string
    allowed_origins    = string
    exposed_headers    = string
    max_age_in_seconds = string
  })
  description = "allowed_headers -A list of headers that are allowed to be a part of the cross-origin request. allowed_methods -A list of HTTP headers that are allowed to be executed by the origin. Valid options are DELETE, GET, HEAD, MERGE, POST, OPTIONS, PUT or PATCH. allowed_origins -A list of origin domains that will be allowed by CORS. exposed_headers -A list of response headers that are exposed to CORS clients. max_age_in_seconds - (Required) The number of seconds the client should cache a preflight response."
}

variable "identity_type" {
  type        = string
  description = "Specifies the type of Managed Service Identity that should be configured on this Cosmos Account. Possible value is only SystemAssigned."
}

variable "identity_ids" {
  type        = list(string)
  description = " Specifies a list of User Assigned Managed Identity IDs to be assigned to this Cosmos Account."
}

variable "source_cosmosdb_account_id" {
  type        = string
  description = "The resource ID of the restorable database account from which the restore has to be initiated. The example is /subscriptions/{subscriptionId}/providers/Microsoft.DocumentDB/locations/{location}/restorableDatabaseAccounts/{restorableDatabaseAccountName}."
}

variable "restore_timestamp_in_utc" {
  type        = string
  description = "The creation time of the database or the collection (Datetime Format RFC 3339)."
}

variable "database_name" {
  type        = string
  description = "The database name for the restore request. Changing this forces a new resource to be created."
}

variable "database_collection_names" {
  type        = string
  description = "A list of the collection names for the restore request. Changing this forces a new resource to be created."
}

variable "tags" {
  type        = map(any)
  description = "Tags"
}
