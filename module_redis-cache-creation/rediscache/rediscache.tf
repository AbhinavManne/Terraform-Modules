# NOTE: the Name used for Redis needs to be globally unique
resource "azurerm_redis_cache" "redis_cache" {
  name                = var.redis_cache_name
  location            = var.location
  resource_group_name = var.resource_group_name
  capacity            = var.redis_cache_capacity
  family              = var.redis_cache_family
  sku_name            = var.redis_cache_sku_name
  enable_non_ssl_port = var.redis_cache_enable_non_ssl_port

  dynamic "identity" {
    for_each = var.managed_identity_type != null ? [1] : []
    content {
      type         = var.managed_identity_type
      identity_ids = var.managed_identity_type == "UserAssigned" || var.managed_identity_type == "SystemAssigned, UserAssigned" ? var.managed_identity_ids : null
    }
  }

  minimum_tls_version = var.redis_cache_minimum_tls_version

  dynamic "patch_schedule" {
    for_each = var.patch_schedule_day_of_week != null ? [1] : []
    content {
      day_of_week        = var.patch_schedule_day_of_week
      maintenance_window = var.patch_schedule_maintenance_window
      start_hour_utc     = var.patch_schedule_start_hour_utc
    }
  }

  private_static_ip_address     = var.private_static_ip_address
  public_network_access_enabled = var.public_network_access_enabled

  redis_configuration {
    aof_backup_enabled              = var.aof_backup_enabled
    aof_storage_connection_string_0 = var.aof_storage_connection_string_0
    aof_storage_connection_string_1 = var.aof_storage_connection_string_1
    enable_authentication           = var.enable_authentication
    maxmemory_reserved              = var.maxmemory_reserved
    maxmemory_delta                 = var.maxmemory_delta
    maxmemory_policy                = var.maxmemory_policy
    maxfragmentationmemory_reserved = var.maxfragmentationmemory_reserved
    rdb_backup_enabled              = var.redis_cache_sku_name == "Premium" && var.rdb_storage_connection_string != null ? var.rdb_backup_enabled : false
    rdb_backup_frequency            = var.rdb_backup_frequency
    rdb_backup_max_snapshot_count   = var.redis_cache_sku_name == "Premium" ? var.rdb_backup_max_snapshot_count : null
    rdb_storage_connection_string   = var.redis_cache_sku_name == "Premium" ? var.rdb_storage_connection_string : null
    notify_keyspace_events          = var.notify_keyspace_events
  }

  replicas_per_master  = var.replicas_per_master
  replicas_per_primary = var.replicas_per_primary
  redis_version        = var.redis_version

  tenant_settings = var.tenant_settings
  shard_count     = var.redis_cache_sku_name == "Premium" ? var.shard_count : null

  subnet_id = var.redis_cache_sku_name == "Premium" ? var.subnet_ids : null
  tags      = var.tags
  zones     = var.zones

}
