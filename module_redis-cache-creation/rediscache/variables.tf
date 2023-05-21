
variable "resource_group_name" {
  type        = string
  description = "The name of the Resource Group in which the Redis Cache should be exist. Changing this forces a new resource to be created."
}

variable "location" {
  type        = string
  description = "The Azure location where the Redis Cache should exist. Changing this forces a new resource to be created."
}

variable "redis_cache_name" {
  type        = string
  description = "The name of the Redis instance. Changing this forces a new resource to be created."
}

variable "redis_cache_capacity" {
  type    = string
  default = " The size of the Redis cache to deploy. Valid values for a SKU family of C (Basic/Standard) are 0, 1, 2, 3, 4, 5, 6, and for P (Premium) family are 1, 2, 3, 4."
}

variable "redis_cache_family" {
  type        = string
  description = "The SKU family/pricing group to use. Valid values are C (for Basic/Standard SKU family) and P (for Premium)"
}

variable "redis_cache_sku_name" {
  type        = string
  description = "The SKU of Redis to use. Possible values are Basic, Standard and Premium."
}

variable "redis_cache_enable_non_ssl_port" {
  type        = bool
  description = "Enable the non-SSL port (6379) - disabled by default."
  default     = false
}

variable "managed_identity_type" {
  type        = string
  default     = null
  description = "Specifies the type of Managed Service Identity that should be configured on this Redis Cache. Possible values are SystemAssigned, UserAssigned, SystemAssigned, UserAssigned (to enable both)."
}

variable "managed_identity_ids" {
  type        = list(string)
  default     = null
  description = "Specifies a list of User Assigned Managed Identity IDs to be assigned to this Redis Cache."
}

variable "redis_cache_minimum_tls_version" {
  type        = string
  description = "he minimum TLS version. Defaults to 1.0."
  default     = "1.0"
}

variable "patch_schedule_day_of_week" {
  type        = string
  description = "the Weekday name - possible values include Monday, Tuesday, Wednesday etc."
  default     = null
}

variable "patch_schedule_maintenance_window" {
  type        = string
  description = "The ISO 8601 timespan which specifies the amount of time the Redis Cache can be updated."
  default     = "PT5H"
}

variable "patch_schedule_start_hour_utc" {
  type        = string
  description = " The Start Hour for maintenance in UTC - possible values range from 0 - 23."
  default     = null
}

variable "private_static_ip_address" {
  type        = string
  description = "The Static IP Address to assign to the Redis Cache when hosted inside the Virtual Network. Changing this forces a new resource to be created."
  default     = null
}

variable "public_network_access_enabled" {
  type        = bool
  description = "Whether or not public network access is allowed for this Redis Cache. true means this resource could be accessed by both public and private endpoint. false means only private endpoint access is allowed."
  default     = true
}

variable "aof_backup_enabled" {
  type        = bool
  description = "Enable or disable AOF persistence for this Redis Cache."
  default     = false
}

variable "aof_storage_connection_string_0" {
  type        = string
  description = "First Storage Account connection string for AOF persistence."
  default     = null
}

variable "aof_storage_connection_string_1" {
  type        = string
  description = "Second Storage Account connection string for AOF persistence."
  default     = null
}

variable "enable_authentication" {
  type        = bool
  description = "If set to false, the Redis instance will be accessible without authentication."
  default     = true
}

variable "maxmemory_reserved" {
  type        = string
  description = "Value in megabytes reserved for non-cache usage e.g. failover."
  default     = "2"
}

variable "maxmemory_delta" {
  type        = string
  description = "The max-memory delta for this Redis instance. "
  default     = "2"
}

variable "maxmemory_policy" {
  type        = string
  description = "How Redis will select what to remove when maxmemory is reached."
  default     = "volatile-lru"
}

variable "maxfragmentationmemory_reserved" {
  type        = string
  description = "Value in megabytes reserved to accommodate for memory fragmentation."
  default     = "2"
}

variable "rdb_backup_enabled" {
  type        = bool
  description = "Is Backup Enabled? Only supported on Premium SKUs."
  default     = false
}

variable "rdb_backup_frequency" {
  type        = string
  description = "The Backup Frequency in Minutes. Only supported on Premium SKUs. Possible values are: 15, 30, 60, 360, 720 and 1440."
  default     = null
}

variable "rdb_backup_max_snapshot_count" {
  type        = string
  description = "The maximum number of snapshots to create as a backup. Only supported for Premium SKUs."
  default     = null
}

variable "rdb_storage_connection_string" {
  type        = string
  description = "The Connection String to the Storage Account. Only supported for Premium SKUs."
  default     = null
}

variable "notify_keyspace_events" {
  type        = string
  description = "Keyspace notifications allows clients to subscribe to Pub/Sub channels in order to receive events affecting the Redis data set in some way."
  default     = null
}

variable "replicas_per_master" {
  type        = string
  description = "Amount of replicas to create per master for this Redis Cache."
  default     = null
}

variable "replicas_per_primary" {
  type        = string
  description = "Amount of replicas to create per primary for this Redis Cache. If both replicas_per_primary and replicas_per_master are set, they need to be equal."
  default     = null
}

variable "redis_version" {
  type        = string
  description = "Redis version. Only major version needed. Valid values: 4, 6."
  default     = "4"
}

variable "tenant_settings" {
  type        = map(string)
  description = "A mapping of tenant settings to assign to the resource."
  default     = null
}

variable "shard_count" {
  type        = string
  description = "Only available when using the Premium SKU The number of Shards to create on the Redis Cluster."
  default     = null
}

variable "subnet_ids" {
  type        = string
  description = "Only available when using the Premium SKU The ID of the Subnet within which the Redis Cache should be deployed. This Subnet must only contain Azure Cache for Redis instances without any other type of resources. Changing this forces a new resource to be created."
  default     = null
}

variable "tags" {
  type        = map(any)
  description = "A mapping of tags to assign to the resource."
}

variable "zones" {
  type        = list(string)
  description = "Specifies a list of Availability Zones in which this Redis Cache should be located. Changing this forces a new Redis Cache to be created."
  default     = null
}
