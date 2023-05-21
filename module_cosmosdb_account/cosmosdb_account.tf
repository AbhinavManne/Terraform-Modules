resource "azurerm_cosmosdb_account" "cosmosdb" {
  name                                  = var.cosmosdb_account_name
  location                              = var.location
  resource_group_name                   = var.resource_group_name
  offer_type                            = var.cosmosdb_offer_type
  kind                                  = var.cosmosdb_kind
  create_mode                           = var.backup_type == "Continuous" ? var.cosmosdb_create_mode : null
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

  consistency_policy {
    consistency_level       = var.consistency_level
    max_interval_in_seconds = var.consistency_level == "BoundedStaleness" ? var.max_interval_in_seconds : null
    max_staleness_prefix    = var.consistency_level == "BoundedStaleness" ? var.max_staleness_prefix : null
  }

  geo_location {
    location          = var.failover_location
    failover_priority = var.failover_priority
    zone_redundant    = var.zone_redundant
  }

  dynamic "capabilities" {
    for_each = var.capabilities_name != null ? [1] : []
    content {
      name = var.capabilities_name
    }
  }

  dynamic "virtual_network_rule" {
    for_each = var.subnet_id != null ? [1] : []
    content {
      id                                   = var.subnet_id
      ignore_missing_vnet_service_endpoint = var.ignore_missing_vnet_service_endpoint
    }
  }

  dynamic "analytical_storage" {
    for_each = var.schema_type != null ? [1] : []
    content {
      schema_type = var.schema_type
    }
  }

  dynamic "capacity" {
    for_each = var.total_throughput_limit != null ? [1] : []
    content {
      total_throughput_limit = var.total_throughput_limit
    }
  }

  dynamic "backup" {
    for_each = var.backup_type != null ? [1] : []
    content {
      type                = var.backup_type
      interval_in_minutes = var.backup_interval_in_minutes
      retention_in_hours  = var.backup_retention_in_hours
      storage_redundancy  = var.backup_type == "Periodic" ? var.backup_storage_redundancy : null
    }
  }

  dynamic "cors_rule" {
    for_each = var.cors_rule != null ? var.cors_rule : {}
    content {
      allowed_headers    = cors_rule.value.allowed_headers
      allowed_methods    = cors_rule.value.allowed_methods
      allowed_origins    = cors_rule.value.allowed_origins
      exposed_headers    = cors_rule.value.exposed_headers
      max_age_in_seconds = cors_rule.value.max_age_in_seconds
    }
  }

  dynamic "identity" {
    for_each = var.identity_type != null ? [1] : []
    content {
      type         = var.identity_type
      identity_ids = var.identity_type == "UserAssigned" || var.identity_type == "SystemAssigned, UserAssigned" ? var.identity_ids : null
    }
  }

  dynamic "restore" {
    for_each = var.source_cosmosdb_account_id != null && var.restore_timestamp_in_utc != null ? [1] : []
    content {
      source_cosmosdb_account_id = var.source_cosmosdb_account_id
      restore_timestamp_in_utc   = var.restore_timestamp_in_utc
      dynamic "database" {
        for_each = var.database_name != null ? [1] : []
        content {
          name             = var.database_name
          collection_names = var.database_collection_names
        }
      }
    }
  }
  tags = var.tags
}
