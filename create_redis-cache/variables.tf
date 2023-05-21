
variable "create_resource_group" {
  type        = bool
  description = "Whether to create resource group and use it for all networking resources"
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name"
}

variable "location" {
  type        = string
  description = "The location/region to keep all your resources. To get the list of all locations with table format from azure cli, run 'az account list-locations -o table'"
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
}

variable "managed_identity_type" {
  type        = string
  description = "Specifies the type of Managed Service Identity that should be configured on this Redis Cache. Possible values are SystemAssigned, UserAssigned, SystemAssigned, UserAssigned (to enable both)."
}

variable "managed_identity_ids" {
  type        = list(string)
  description = "Specifies a list of User Assigned Managed Identity IDs to be assigned to this Redis Cache."
}

variable "redis_cache_minimum_tls_version" {
  type        = string
  description = "he minimum TLS version. Defaults to 1.0."
}

variable "patch_schedule_day_of_week" {
  type        = string
  description = "the Weekday name - possible values include Monday, Tuesday, Wednesday etc."
}

variable "patch_schedule_maintenance_window" {
  type        = string
  description = "The ISO 8601 timespan which specifies the amount of time the Redis Cache can be updated."
}

variable "patch_schedule_start_hour_utc" {
  type        = string
  description = " The Start Hour for maintenance in UTC - possible values range from 0 - 23."
}

variable "private_static_ip_address" {
  type        = string
  description = "The Static IP Address to assign to the Redis Cache when hosted inside the Virtual Network. Changing this forces a new resource to be created."
}

variable "public_network_access_enabled" {
  type        = bool
  description = "Whether or not public network access is allowed for this Redis Cache. true means this resource could be accessed by both public and private endpoint. false means only private endpoint access is allowed."
}

variable "aof_backup_enabled" {
  type        = bool
  description = "Enable or disable AOF persistence for this Redis Cache."
}

variable "aof_storage_connection_string_0" {
  type        = string
  description = "First Storage Account connection string for AOF persistence."
}

variable "aof_storage_connection_string_1" {
  type        = string
  description = "Second Storage Account connection string for AOF persistence."
}

variable "enable_authentication" {
  type        = bool
  description = "If set to false, the Redis instance will be accessible without authentication."
}

variable "maxmemory_reserved" {
  type        = string
  description = "Value in megabytes reserved for non-cache usage e.g. failover."
}

variable "maxmemory_delta" {
  type        = string
  description = "The max-memory delta for this Redis instance. "
}

variable "maxmemory_policy" {
  type        = string
  description = "How Redis will select what to remove when maxmemory is reached."
}

variable "maxfragmentationmemory_reserved" {
  type        = string
  description = "Value in megabytes reserved to accommodate for memory fragmentation."
}

variable "rdb_backup_enabled" {
  type        = bool
  description = "Is Backup Enabled? Only supported on Premium SKUs."
}

variable "rdb_backup_frequency" {
  type        = string
  description = "The Backup Frequency in Minutes. Only supported on Premium SKUs. Possible values are: 15, 30, 60, 360, 720 and 1440."
}

variable "rdb_backup_max_snapshot_count" {
  type        = string
  description = "The maximum number of snapshots to create as a backup. Only supported for Premium SKUs."
}

variable "rdb_storage_connection_string" {
  type        = string
  description = "The Connection String to the Storage Account. Only supported for Premium SKUs."
}

variable "notify_keyspace_events" {
  type        = string
  description = "Keyspace notifications allows clients to subscribe to Pub/Sub channels in order to receive events affecting the Redis data set in some way."
}

variable "replicas_per_master" {
  type        = string
  description = "Amount of replicas to create per master for this Redis Cache."
}

variable "replicas_per_primary" {
  type        = string
  description = "Amount of replicas to create per primary for this Redis Cache. If both replicas_per_primary and replicas_per_master are set, they need to be equal."
}

variable "redis_version" {
  type        = string
  description = "Redis version. Only major version needed. Valid values: 4, 6."
}

variable "tenant_settings" {
  type        = map(string)
  description = "A mapping of tenant settings to assign to the resource."
}

variable "shard_count" {
  type        = string
  description = "Only available when using the Premium SKU The number of Shards to create on the Redis Cluster."
}

variable "subnet_ids" {
  type        = string
  description = "Only available when using the Premium SKU The ID of the Subnet within which the Redis Cache should be deployed. This Subnet must only contain Azure Cache for Redis instances without any other type of resources. Changing this forces a new resource to be created."
}

variable "tags" {
  type        = map(any)
  description = "A mapping of tags to assign to the resource."
}

variable "zones" {
  type        = list(string)
  description = "Specifies a list of Availability Zones in which this Redis Cache should be located. Changing this forces a new Redis Cache to be created."
}

#-----------------------------------------VARIABLES: ACTION GROUP----------------------------------#

variable "action_group_name" {
  type        = string
  description = "The name of the Action Group. Changing this forces a new resource to be created. "
}

variable "short_name" {
  type        = string
  description = "The short name of the action group. "
}

#-------------------------------------------VARIABLES: ACTION GROUP RULE----------------------------#

variable "action_group_rule_name" {
  type        = string
  description = "Specifies the name of the Monitor Action Rule. Changing this forces a new resource to be created. "
}

variable "scope_type" {
  type        = string
  description = "Specifies the type of target scope. Possible values are ResourceGroup and Resource "
}

#---------------------------------------------VARIABLES: ACTIVITY LOG ALERT---------------------------#

variable "activity_log_alert_name" {
  type        = string
  description = "The name of the activity log alert. Changing this forces a new resource to be created. "
}
variable "storage_account_id" {
  description = "ID of target resource"
}
variable "operation_name_log_alert" {
  type        = string
  description = "The Resource Manager Role-Based Access Control operation name. Supported operation should be of the form: <resourceProvider>/<resourceType>/<operation> "
}

variable "category_log_alert" {
  type        = string
  description = "The category of the operation. Possible values are Administrative, Autoscale, Policy, Recommendation, ResourceHealth, Security and ServiceHealth "
}

#----------------------------------------------VARIABLES: METRIC ALERT-------------------------------#

variable "metric_alert_name" {
  type        = string
  description = "The name of the Metric Alert. Changing this forces a new resource to be created "
}

variable "metric_namespace" {
  type        = string
  description = "One of the metric namespaces to be monitored. "
}

variable "metric_name" {
  type        = string
  description = "One of the metric names to be monitored. "
}

variable "aggregation" {
  type        = string
  description = "The statistic that runs over the metric values. Possible values are Average, Count, Minimum, Maximum and Total. "
}

variable "operator" {
  type        = string
  description = "The criteria operator. Possible values are Equals, NotEquals, GreaterThan, GreaterThanOrEqual, LessThan and LessThanOrEqual. "
}

variable "threshold" {
  type        = number
  description = "The criteria threshold value that activates the alert "
}

variable "dimension_name" {
  type        = string
  description = "One of the dimension names "
}

variable "dimension_operator" {
  type        = string
  description = "The dimension operator. Possible values are Include, Exclude and StartsWith. "
}

variable "values" {
  type        = list(string)
  description = "The list of dimension values. "
}

variable "enable_log_monitoring" {
  type        = bool
  description = "enable log monitoring"
}

variable "diag_name" {
  type        = string
  description = "Specifies the name of the Diagnostic Setting."
}

variable "log_analytics_workspace_id" {
  description = "ID of log anaytics workspace"
}

variable "log_analytics_destination_type" {
  type        = string
  description = "log_analytics_destination_type"
}

variable "eventhub_name" {
  description = "eventhub_name"
}

variable "eventhub_authorization_rule_id" {
  description = "eventhub_authorization_rule_id"
}

variable "log_enabled" {
  type        = bool
  description = "log_enabled"
}

variable "log_retention_policy_enabled" {
  type        = bool
  description = "log_retention_policy_enabled"
}

variable "log_retention_days" {
  type        = number
  description = "log_retention_days"
}

variable "metric_retention_policy_enabled" {
  type        = bool
  description = "metric_retention_policy_enabled"
}

variable "metric_retention_days" {
  type        = number
  description = "log_retention_days"
}

# #---------------END POINT----------------#
variable "private_dns_zone_group" {

  type = object({
    name                 = string
    private_dns_zone_ids = list(string)
  })

}


variable "private_endpoint_name" {
  type        = string
  description = "pvt endpoint name in Azure"

}

variable "private_service_connection_name" {
  type        = string
  description = "service connection name in Azure"

}

variable "subresource_names" {
  type        = list(string)
  description = "sub resources names in Azure"

}

variable "is_manual_connection" {
  type        = string
  description = "Status of manual connection "

}

variable "request_message" {
  type        = string
  description = "request msg"
  default     = "PL"
}


variable "private_connection_resource_id" {
  description = "ID of resource to be associated"
  default     = null
}

variable "subnet_id" {
  description = "Id of subnet"
}

variable "private_connection_resource_alias" {
  type        = string
  description = "alias name"
  default     = null
}