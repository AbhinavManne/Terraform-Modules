variable "secret_name" {
  type        = string
  description = "Secret name in keyvault"
}

variable "keyvault_id" {
  type        = string
  description = "ID of Azure Keyvault"
}

variable "location" {
  type        = string
  description = "The location/region to keep all your resources. To get the list of all locations with table format from azure cli, run 'az account list-locations -o table'"
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name"
}

#--------------------------------------VARIABLES: RESOURCE: MARIA DB SERVER-----------------------------#
variable "mariadb_server_name" {
  type        = string
  description = "Name of the MariaDB Server"
}

variable "mariadb_server_sku_name" {
  type        = string
  description = "Specifies the SKU Name for this MariaDB Server. The name of the SKU, follows the tier + family + cores pattern (e.g. B_Gen4_1, GP_Gen5_8)."
}

variable "mariadb_server_version" {
  type        = string
  description = "Specifies the version of MariaDB to use. Possible values are 10.2 and 10.3. "
}

# variable "mariadb_server_administrator_login" {
#   type        = string
#   description = "The Administrator Login for the MariaDB Server"
# }

# variable "mariadb_server_administrator_login_password" {
#   type        = string
#   description = "The Password associated with the administrator_login for the MariaDB Server"
# }

variable "mariadb_server_auto_grow_enabled" {
  type        = bool
  description = "Enable/Disable auto-growing of the storage"
}

variable "mariadb_server_backup_retention_days" {
  type        = number
  description = "Backup retention days for the server, supported values are between 7 and 35 days"
}

variable "mariadb_server_create_mode" {
  type        = string
  description = "The creation mode. Can be used to restore or replicate existing servers. Possible values are Default, Replica, GeoRestore, and PointInTimeRestore. Defaults to Default."
}

variable "mariadb_server_creation_source_server_id" {
  type        = string
  description = "For creation modes other than Default, the source server ID to use."
}

variable "mariadb_server_geo_redundant_backup_enabled" {
  type        = bool
  description = "Turn Geo-redundant server backups on/off"
}

variable "mariadb_server_public_network_access_enabled" {
  type        = bool
  description = "Whether or not public network access is allowed for this server"
}

variable "mariadb_server_restore_point_in_time" {
  type        = string
  description = " When create_mode is PointInTimeRestore, specifies the point in time to restore from creation_source_server_id."
}

variable "mariadb_server_ssl_enforcement_enabled" {
  type        = bool
  description = "Specifies if SSL should be enforced on connections"
}

variable "mariadb_server_storage_mb" {
  type        = number
  description = "Max storage allowed for a server"
}

variable "tags" {
  type        = map(any)
  description = "Tags"
}

#--------------------------------------VARIABLES: RESOURCE: MARIA DB DATABASE--------------------------#
variable "mariadb_database_settings" {
  type        = map(any)
  description = "(Required) MariaDB Database details"
}

#--------------------------------------VARIABLES: RESOURCE: MARIA DB CONFIGURATION--------------------------#
variable "mariadb_configuration_settings" {
  type        = map(any)
  description = "(Required) MariaDB Server Configuration details"
}

#--------------------------------------VARIABLES: RESOURCE: MARIA DB FIREWALL RULES---------------------#
variable "mariadb_firewall_rules" {
  description = "Range of IP addresses to allow firewall connections."
  type = map(object({
    start_ip_address = string
    end_ip_address   = string
  }))
}

#--------------------------------------VARIABLES: RESOURCE: MARIA DB VNET RULE--------------------------#
variable "mariadb_virtual_network_rule" {
  type        = string
  description = "Name of the MariaDB Virtual Network Rule"
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID"
}


#------------------------Variables: Module:Private Endpoint -------------------------------------------#
variable "create_private-endpoint" {
  type        = bool
  description = "Wants to create private endpoint or not"
  default     = false
}

variable "private_dns_zone_group" {
  description = "block for dns zone group"
  type = object({
    name                 = string
    private_dns_zone_ids = list(string)
  })
  default = {
    name                 = "xyz"
    private_dns_zone_ids = ["null"]
  }
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

variable "private_connection_resource_alias" {
  type        = string
  description = "alias name"
  default     = null
}

/*
#--------------------------------VARIABLES:MODULE: ALERTS -----------------------------------------------#
variable "storage_account_id" {
  type        = string
  description = "Reading Storage account ID "
}

variable "action_group_name" {
  type        = string
  description = "The name of the Action Group. Changing this forces a new resource to be created. "
}

variable "short_name" {
  type        = string
  description = "The short name of the action group. "
}

variable "action_group_rule_name" {
  type        = string
  description = "Specifies the name of the Monitor Action Rule. Changing this forces a new resource to be created. "
}

variable "scope_type" {
  type        = string
  description = "Specifies the type of target scope. Possible values are ResourceGroup and Resource "
}

variable "activity_log_alert_name" {
  type        = string
  description = "The name of the activity log alert. Changing this forces a new resource to be created. "
}

variable "resource_group_id" {
  type        = string
  description = "Resource group ID "
}

variable "operation_name_log_alert" {
  type        = string
  description = "The Resource Manager Role-Based Access Control operation name. Supported operation should be of the form: <resourceProvider>/<resourceType>/<operation> "
}

variable "category_log_alert" {
  type        = string
  description = "The category of the operation. Possible values are Administrative, Autoscale, Policy, Recommendation, ResourceHealth, Security and ServiceHealth "
}

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


#--------------------------------VARIABLES:MODULE: DIAGNOSTIC -----------------------------------------------#
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
*/