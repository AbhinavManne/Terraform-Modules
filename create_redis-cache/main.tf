module "create_resource_group" {
  source                = "../../modules/module_resource-group-creation/resource_group"
  create_resource_group = var.create_resource_group
  resource_group_name   = var.resource_group_name
  location              = var.location
  tags                  = var.tags

}

module "redis" {
  source                            = "../../modules/module_redis-cache-creation/rediscache"
  resource_group_name               = var.resource_group_name
  location                          = var.location
  redis_cache_name                  = var.redis_cache_name
  redis_cache_capacity              = var.redis_cache_capacity
  redis_cache_family                = var.redis_cache_family
  redis_cache_sku_name              = var.redis_cache_sku_name
  redis_cache_enable_non_ssl_port   = var.redis_cache_enable_non_ssl_port
  managed_identity_type             = var.managed_identity_type
  managed_identity_ids              = var.managed_identity_ids
  redis_cache_minimum_tls_version   = var.redis_cache_minimum_tls_version
  patch_schedule_day_of_week        = var.patch_schedule_day_of_week
  patch_schedule_maintenance_window = var.patch_schedule_maintenance_window
  patch_schedule_start_hour_utc     = var.patch_schedule_start_hour_utc
  private_static_ip_address         = var.private_static_ip_address
  public_network_access_enabled     = var.public_network_access_enabled
  aof_backup_enabled                = var.aof_backup_enabled
  aof_storage_connection_string_0   = var.aof_storage_connection_string_0
  aof_storage_connection_string_1   = var.aof_storage_connection_string_1
  enable_authentication             = var.enable_authentication
  maxmemory_reserved                = var.maxmemory_reserved
  maxmemory_delta                   = var.maxmemory_delta
  maxmemory_policy                  = var.maxmemory_policy
  maxfragmentationmemory_reserved   = var.maxfragmentationmemory_reserved
  rdb_backup_enabled                = var.rdb_backup_enabled
  rdb_backup_frequency              = var.rdb_backup_frequency
  rdb_backup_max_snapshot_count     = var.rdb_backup_max_snapshot_count
  rdb_storage_connection_string     = var.rdb_storage_connection_string
  notify_keyspace_events            = var.notify_keyspace_events
  replicas_per_master               = var.replicas_per_master
  replicas_per_primary              = var.replicas_per_primary
  redis_version                     = var.redis_version
  tenant_settings                   = var.tenant_settings
  shard_count                       = var.shard_count
  subnet_ids                        = var.subnet_ids
  zones                             = var.zones
  tags                              = var.tags
}

module "alert" {
  source                   = "../../modules/module_alert"
  action_group_name        = var.action_group_name
  resource_group_name      = var.resource_group_name
  resource_group_location  = var.location
  short_name               = var.short_name
  action_group_rule_name   = var.action_group_rule_name
  scope_type               = var.scope_type
  resource_id              = module.redis.redis_cache_id
  activity_log_alert_name  = var.activity_log_alert_name
  resource_group_id        = module.create_resource_group.resource_group_id
  operation_name_log_alert = var.operation_name_log_alert
  category_log_alert       = var.category_log_alert
  metric_alert_name        = var.metric_alert_name
  storage_account_id       = var.storage_account_id
  metric_namespace         = var.metric_namespace
  metric_name              = var.metric_name
  aggregation              = var.aggregation
  operator                 = var.operator
  threshold                = var.threshold
  dimension_name           = var.dimension_name
  dimension_operator       = var.dimension_operator
  values                   = var.values
}

module "diag_settings" {
  source                          = "../../modules/module_diagnostics_settings"
  enable_log_monitoring           = var.enable_log_monitoring
  diag_name                       = var.diag_name
  target_resource_id              = module.redis.redis_cache_id
  log_analytics_workspace_id      = var.log_analytics_workspace_id
  log_analytics_destination_type  = var.log_analytics_destination_type
  storage_account_id              = var.storage_account_id
  eventhub_name                   = var.eventhub_name
  eventhub_authorization_rule_id  = var.eventhub_authorization_rule_id
  log_enabled                     = var.log_enabled
  log_retention_policy_enabled    = var.log_retention_policy_enabled
  log_retention_days              = var.log_retention_days
  metric_retention_policy_enabled = var.metric_retention_policy_enabled
  metric_retention_days           = var.metric_retention_days
}

module "PrivateEndpointSql_module" {
  source                            = "../../modules/module_private_endpoint"
  resource_group_name               = var.resource_group_name
  location                          = var.location
  subnet_id                         = var.subnet_id
  tags                              = var.tags
  private_endpoint_name             = var.private_endpoint_name
  private_service_connection_name   = var.private_service_connection_name
  subresource_names                 = var.subresource_names
  is_manual_connection              = var.is_manual_connection
  request_message                   = var.request_message
  private_dns_zone_group            = var.private_dns_zone_group
  private_connection_resource_alias = var.private_connection_resource_alias
  private_connection_resource_id    = module.redis.redis_cache_id
}