<!-- BEGIN_TF_DOCS -->
###### Last Updated[DD/MM/YYYY]: 05/09/2022
# <u> Introduction </u>
* This module provision the Redis Cache. In this module we have included all  possiable argument for Redis Cache.

## File Structure 
This particular module is having the following configuration files.
- rediscache.tf : This file is having the terraform code to provision the resources as per requirements.
- variables.tf : This file consist of all the variable definitions needed for the terraform code mentioned in vmss.tf
- output.tf : This file is having all the resource output details generated.
## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | =3.20.0 |

## Resources

| Name | Type |
|------|------|
| [azurerm_redis_cache.redis_cache](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/redis_cache) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aof_backup_enabled"></a> [aof\_backup\_enabled](#input\_aof\_backup\_enabled) | Enable or disable AOF persistence for this Redis Cache. | `bool` | `false` | no |
| <a name="input_aof_storage_connection_string_0"></a> [aof\_storage\_connection\_string\_0](#input\_aof\_storage\_connection\_string\_0) | First Storage Account connection string for AOF persistence. | `string` | `null` | no |
| <a name="input_aof_storage_connection_string_1"></a> [aof\_storage\_connection\_string\_1](#input\_aof\_storage\_connection\_string\_1) | Second Storage Account connection string for AOF persistence. | `string` | `null` | no |
| <a name="input_enable_authentication"></a> [enable\_authentication](#input\_enable\_authentication) | If set to false, the Redis instance will be accessible without authentication. | `bool` | `true` | no |
| <a name="input_location"></a> [location](#input\_location) | The Azure location where the Redis Cache should exist. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_managed_identity_ids"></a> [managed\_identity\_ids](#input\_managed\_identity\_ids) | Specifies a list of User Assigned Managed Identity IDs to be assigned to this Redis Cache. | `list(string)` | `null` | no |
| <a name="input_managed_identity_type"></a> [managed\_identity\_type](#input\_managed\_identity\_type) | Specifies the type of Managed Service Identity that should be configured on this Redis Cache. Possible values are SystemAssigned, UserAssigned, SystemAssigned, UserAssigned (to enable both). | `string` | `null` | no |
| <a name="input_maxfragmentationmemory_reserved"></a> [maxfragmentationmemory\_reserved](#input\_maxfragmentationmemory\_reserved) | Value in megabytes reserved to accommodate for memory fragmentation. | `string` | `"2"` | no |
| <a name="input_maxmemory_delta"></a> [maxmemory\_delta](#input\_maxmemory\_delta) | The max-memory delta for this Redis instance. | `string` | `"2"` | no |
| <a name="input_maxmemory_policy"></a> [maxmemory\_policy](#input\_maxmemory\_policy) | How Redis will select what to remove when maxmemory is reached. | `string` | `"volatile-lru"` | no |
| <a name="input_maxmemory_reserved"></a> [maxmemory\_reserved](#input\_maxmemory\_reserved) | Value in megabytes reserved for non-cache usage e.g. failover. | `string` | `"2"` | no |
| <a name="input_notify_keyspace_events"></a> [notify\_keyspace\_events](#input\_notify\_keyspace\_events) | Keyspace notifications allows clients to subscribe to Pub/Sub channels in order to receive events affecting the Redis data set in some way. | `string` | `null` | no |
| <a name="input_patch_schedule_day_of_week"></a> [patch\_schedule\_day\_of\_week](#input\_patch\_schedule\_day\_of\_week) | the Weekday name - possible values include Monday, Tuesday, Wednesday etc. | `string` | `null` | no |
| <a name="input_patch_schedule_maintenance_window"></a> [patch\_schedule\_maintenance\_window](#input\_patch\_schedule\_maintenance\_window) | The ISO 8601 timespan which specifies the amount of time the Redis Cache can be updated. | `string` | `"PT5H"` | no |
| <a name="input_patch_schedule_start_hour_utc"></a> [patch\_schedule\_start\_hour\_utc](#input\_patch\_schedule\_start\_hour\_utc) | The Start Hour for maintenance in UTC - possible values range from 0 - 23. | `string` | `null` | no |
| <a name="input_private_static_ip_address"></a> [private\_static\_ip\_address](#input\_private\_static\_ip\_address) | The Static IP Address to assign to the Redis Cache when hosted inside the Virtual Network. Changing this forces a new resource to be created. | `string` | `null` | no |
| <a name="input_public_network_access_enabled"></a> [public\_network\_access\_enabled](#input\_public\_network\_access\_enabled) | Whether or not public network access is allowed for this Redis Cache. true means this resource could be accessed by both public and private endpoint. false means only private endpoint access is allowed. | `bool` | `true` | no |
| <a name="input_rdb_backup_enabled"></a> [rdb\_backup\_enabled](#input\_rdb\_backup\_enabled) | Is Backup Enabled? Only supported on Premium SKUs. | `bool` | `false` | no |
| <a name="input_rdb_backup_frequency"></a> [rdb\_backup\_frequency](#input\_rdb\_backup\_frequency) | The Backup Frequency in Minutes. Only supported on Premium SKUs. Possible values are: 15, 30, 60, 360, 720 and 1440. | `string` | `null` | no |
| <a name="input_rdb_backup_max_snapshot_count"></a> [rdb\_backup\_max\_snapshot\_count](#input\_rdb\_backup\_max\_snapshot\_count) | The maximum number of snapshots to create as a backup. Only supported for Premium SKUs. | `string` | `null` | no |
| <a name="input_rdb_storage_connection_string"></a> [rdb\_storage\_connection\_string](#input\_rdb\_storage\_connection\_string) | The Connection String to the Storage Account. Only supported for Premium SKUs. | `string` | `null` | no |
| <a name="input_redis_cache_capacity"></a> [redis\_cache\_capacity](#input\_redis\_cache\_capacity) | The size of the Redis cache to deploy. Valid values for a SKU family of C (Basic/Standard) are 0, 1, 2, 3, 4, 5, 6, and for P (Premium) family are 1, 2, 3, 4. | `string` | n/a | no |
| <a name="input_redis_cache_enable_non_ssl_port"></a> [redis\_cache\_enable\_non\_ssl\_port](#input\_redis\_cache\_enable\_non\_ssl\_port) | Enable the non-SSL port (6379) - disabled by default. | `bool` | `false` | no |
| <a name="input_redis_cache_family"></a> [redis\_cache\_family](#input\_redis\_cache\_family) | The SKU family/pricing group to use. Valid values are C (for Basic/Standard SKU family) and P (for Premium) | `string` | n/a | yes |
| <a name="input_redis_cache_minimum_tls_version"></a> [redis\_cache\_minimum\_tls\_version](#input\_redis\_cache\_minimum\_tls\_version) | he minimum TLS version. Defaults to 1.0. | `string` | `"1.0"` | no |
| <a name="input_redis_cache_name"></a> [redis\_cache\_name](#input\_redis\_cache\_name) | The name of the Redis instance. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_redis_cache_sku_name"></a> [redis\_cache\_sku\_name](#input\_redis\_cache\_sku\_name) | The SKU of Redis to use. Possible values are Basic, Standard and Premium. | `string` | n/a | yes |
| <a name="input_redis_version"></a> [redis\_version](#input\_redis\_version) | Redis version. Only major version needed. Valid values: 4, 6. | `string` | `"4"` | no |
| <a name="input_replicas_per_master"></a> [replicas\_per\_master](#input\_replicas\_per\_master) | Amount of replicas to create per master for this Redis Cache. | `string` | `null` | no |
| <a name="input_replicas_per_primary"></a> [replicas\_per\_primary](#input\_replicas\_per\_primary) | Amount of replicas to create per primary for this Redis Cache. If both replicas\_per\_primary and replicas\_per\_master are set, they need to be equal. | `string` | `null` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the Resource Group in which the Redis Cache should be exist. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_shard_count"></a> [shard\_count](#input\_shard\_count) | Only available when using the Premium SKU The number of Shards to create on the Redis Cluster. | `string` | `null` | no |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | Only available when using the Premium SKU The ID of the Subnet within which the Redis Cache should be deployed. This Subnet must only contain Azure Cache for Redis instances without any other type of resources. Changing this forces a new resource to be created. | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the resource. | `map(any)` | n/a | yes |
| <a name="input_tenant_settings"></a> [tenant\_settings](#input\_tenant\_settings) | A mapping of tenant settings to assign to the resource. | `map(string)` | `null` | no |
| <a name="input_zones"></a> [zones](#input\_zones) | Specifies a list of Availability Zones in which this Redis Cache should be located. Changing this forces a new Redis Cache to be created. | `list(string)` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_redis_cache_id"></a> [redis\_cache\_id](#output\_redis\_cache\_id) | ID of Redis Cache |

## Module Usage 
* You can call the specified Redis Cache in any script where you want to integrate it.
```
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
```

<!-- END_TF_DOCS -->