#Reference to cosmosdb mongodb module
module "cosmosdb_mongodb" {
  depends_on = [
    module.cosmosdb_account
  ]
  source                  = "../../modules/module_cosmosdb_mongo"
  mongo_db_name           = var.mongo_db_name
  resource_group_name     = var.resource_group_name
  cosmosdb_account_name   = var.cosmosdb_account_name
  mongodb_throughput      = var.mongodb_throughput
  db_max_throughput       = var.db_max_throughput
  mongodb_collection_name = var.mongodb_collection_name
  shard_key               = var.shard_key
  analytical_storage_ttl  = var.analytical_storage_ttl
  default_ttl_seconds     = var.default_ttl_seconds
  throughput              = var.throughput
  index                   = var.index
  mdc_max_throughput      = var.mdc_max_throughput
}

#Reference to cosmosdb account module
module "cosmosdb_account" {
  source                                = "../../modules/module_cosmosdb_account"
  cosmosdb_account_name                 = var.cosmosdb_account_name
  location                              = var.location
  resource_group_name                   = var.resource_group_name
  cosmosdb_offer_type                   = var.cosmosdb_offer_type
  cosmosdb_kind                         = var.cosmosdb_kind
  cosmosdb_create_mode                  = var.cosmosdb_create_mode
  default_identity_type                 = var.default_identity_type
  enable_automatic_failover             = var.enable_automatic_failover
  ip_range_filter                       = var.ip_range_filter
  enable_free_tier                      = var.enable_free_tier
  analytical_storage_enabled            = var.analytical_storage_enabled
  enable_multiple_write_locations       = var.enable_multiple_write_locations
  access_key_metadata_writes_enabled    = var.access_key_metadata_writes_enabled
  public_network_access_enabled         = var.public_network_access_enabled
  is_virtual_network_filter_enabled     = var.is_virtual_network_filter_enabled
  key_vault_key_id                      = var.key_vault_key_id
  network_acl_bypass_for_azure_services = var.network_acl_bypass_for_azure_services
  network_acl_bypass_ids                = var.network_acl_bypass_ids
  mongo_server_version                  = var.mongo_server_version
  local_authentication_disabled         = var.local_authentication_disabled
  consistency_level                     = var.consistency_level
  max_interval_in_seconds               = var.max_interval_in_seconds
  max_staleness_prefix                  = var.max_staleness_prefix
  failover_location                     = var.failover_location
  failover_priority                     = var.failover_priority
  zone_redundant                        = var.zone_redundant
  capabilities_name                     = var.capabilities_name
  subnet_id                             = var.subnet_id
  ignore_missing_vnet_service_endpoint  = var.ignore_missing_vnet_service_endpoint
  schema_type                           = var.schema_type
  total_throughput_limit                = var.total_throughput_limit
  backup_type                           = var.backup_type
  backup_interval_in_minutes            = var.backup_interval_in_minutes
  backup_retention_in_hours             = var.backup_retention_in_hours
  backup_storage_redundancy             = var.backup_storage_redundancy
  cors_rule                             = var.cors_rule
  identity_type                         = var.identity_type
  identity_ids                          = var.identity_ids
  source_cosmosdb_account_id            = var.source_cosmosdb_account_id
  restore_timestamp_in_utc              = var.restore_timestamp_in_utc
  database_name                         = var.database_name
  database_collection_names             = var.database_collection_names
  tags                                  = var.tags
}
