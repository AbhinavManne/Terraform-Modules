##-----------keyvault secret -----------------------##
variable "key_vault_secret_name_primary" {
  type=string
  description = "key vault secret name"
}

variable "key_vault_id" {
  type= string
  description ="ID of keyvault"
}
#----------------------------------
variable "create_resource_group" {
  description = "Whether to create resource group and use it for all networking resources"
}


variable "resource_group_name" {
  type        = string
  description = "A container that holds related resources for an Azure solution"
}

variable "location" {
  type        = string
  description = "The location/region to keep all your network resources. To get the list of all locations with table format from azure cli, run 'az account list-locations -o table'"
}

variable "admin_username" {
  type        = string
  description = "The Administrator login for the MySQL Server. Required when create_mode is Default"
  default     = null
}

# variable "admin_password" {
#   type        = string
#   description = "The password associated with the admin_username user"
#   default     = null
# }

variable "auto_grow_enabled" {
  type        = bool
  description = "Enable/Disable auto-growing of the storage"
  default     = true
}

variable "ad_admin_login_name" {
  description = "The login name of the principal to set as the server administrator"
}

variable "backup_retention_days" {
  type        = number
  description = "Backup retention days for the server, supported values are between 7 and 35 days."
  default     = null
}


variable "create_mode" {
  type        = string
  description = "The creation mode. Can be used to restore or replicate existing servers. Possible values are `Default`, `Replica`, `GeoRestore`, and `PointInTimeRestore`. Defaults to `Default`"
  default     = "Default"
}

variable "creation_source_server_id" {
  type        = string
  description = "For creation modes other than Default, the source server ID to use."
  default     = null
}

variable "firewall_rules" {
  description = "Range of IP addresses to allow firewall connections."
  type = map(object({
    start_ip_address = string
    end_ip_address   = string
  }))
}

variable "geo_redundant_backup_enabled" {
  type        = bool
  description = "Turn Geo-redundant server backups on/off"
  default     = false
}

variable "infrastructure_encryption_enabled" {
  type        = bool
  description = "Whether or not infrastructure is encrypted for this server"
  default     = false
}


variable "identity" {
  type        = string
  description = "Specifies the type of Managed Service Identity that should be configured on this MySQL Server. The only possible value is SystemAssigned."
  default     = "SystemAssigned"
}

variable "mysqlserver_name" {
  type        = string
  description = "MySQL server Name"
}

variable "mysql_version" {
  type        = string
  description = "version of mysql"
}

variable "mysql_database" {
  type        = map(any)
  description = "MYSQL database "
  default     = null
}

variable "mysql_configuration" {
  description = "Sets a MySQL Configuration value on a MySQL Server"
  type        = map(string)
  default     = null
}

variable "object_id" {
  type        = string
  description = "The ID of the principal to set as the server administrator. For a managed identity this should be the Client ID of the identity."
  default     = null
}

variable "tenant_id" {
  type        = string
  description = "The Azure Tenant ID"
  default     = null
}

variable "key_vault_key_id" {
  type        = string
  description = "The URL to a Key Vault Key"
  default     = null
}


variable "public_network_access_enabled" {
  type        = bool
  description = "Whether or not public network access is allowed for this server"
  default     = true
}

variable "restore_point_in_time" {
  type        = string
  description = "When create_mode is PointInTimeRestore, specifies the point in time to restore from creation_source_server_id."
  default     = null
}

variable "ssl_enforcement_enabled" {
  type        = bool
  description = "Specifies if SSL should be enforced on connections"
  default     = false
}

variable "ssl_minimal_tls_version_enforced" {
  type        = string
  description = "The minimum TLS version to support on the sever."
  default     = "TLS1_2"
}


variable "sku_name" {
  type        = string
  description = "sku name"
}

variable "storage_mb" {
  type        = number
  description = "stoarge for mysql"
  default     = null
}

variable "subnet_id" {
  type        = string
  description = "id of subnet"
}

variable "threat_detection_policy" {
  type = object({
    enabled                    = bool
    disabled_alerts            = list(string)
    email_account_admins       = bool
    email_addresses            = list(string)
    retention_days             = number
    storage_account_access_key = string
    storage_endpoint           = string
  })
  description = "Threat detection policy configuration, known in the API as Server Security Alerts Policy."
  default     = null
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
}

#------------------------Private Endpoint -------------------------------------------#
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


#########------------------ logging and monitoring -----------------------
#--------------------------------Diagnostic settings varaiable---------------------------------

variable "create_diagnostic_settings" {
  type        = bool
  description = "wants to create diagnostic or not"
  default     = true
}

variable "enable_log_monitoring" {
  type        = bool
  description = "enable log monitoring"
  default     = false
}

variable "diag_name" {
  type        = string
  description = "Specifies the name of the Diagnostic Setting."
}


variable "log_analytics_workspace_id" {
  description = "ID of log anaytics workspace"
  default     = null
}

variable "log_analytics_destination_type" {
  type        = string
  description = "log_analytics_destination_type"
  default     = "Dedicated"
}

variable "storage_account_id" {
  description = "ID of target resource"
  default     = null
}

variable "eventhub_name" {
  description = "eventhub_name"
  default     = null
}

variable "eventhub_authorization_rule_id" {
  description = "eventhub_authorization_rule_id"
  default     = null
}

# variable "extaudit_diag_logs" {
#   type        = list(string)
#   description = "Database Monitoring Category details for Azure Diagnostic setting"
#   default     = ["SQLSecurityAuditEvents", "SQLInsights", "AutomaticTuning", "QueryStoreRuntimeStatistics", "QueryStoreWaitStatistics", "Errors", "DatabaseWaitStatistics", "Timeouts", "Blocks", "Deadlocks"]
# }

variable "log_enabled" {
  type        = bool
  description = "log_enabled"
  default     = false
}

variable "log_retention_policy_enabled" {
  type        = bool
  description = "log_retention_policy_enabled"
  default     = false
}

variable "log_retention_days" {
  type        = number
  description = "log_retention_days"
  default     = 1
}

# variable "metrics_category" {
#   type        = string
#   description = "metrics_category"
#   default     = "AllMetrics"
# }

variable "metric_retention_policy_enabled" {
  type        = bool
  description = "metric_retention_policy_enabled"
  default     = false
}

variable "metric_retention_days" {
  type        = number
  description = "log_retention_days"
  default     = 1
}

#-------------------------Alerts----------------------------------------------------
# variable "resource_group_id" {
#   type        = string
#   description = "Reading Resource group ID from other module "
# }

variable "create_alert" {
  type        = bool
  description = "wants to create alert or not"
  default     = false
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
  default     = "null"
}

#---------------------------------------------VARIABLES: ACTIVITY LOG ALERT---------------------------#

variable "activity_log_alert_name" {
  type        = string
  description = "The name of the activity log alert. Changing this forces a new resource to be created. "
}

variable "operation_name_log_alert" {
  type        = string
  description = "The Resource Manager Role-Based Access Control operation name. Supported operation should be of the form: <resourceProvider>/<resourceType>/<operation> "
}

variable "category_log_alert" {
  type        = string
  description = "The category of the operation. Possible values are Administrative, Autoscale, Policy, Recommendation, ResourceHealth, Security and ServiceHealth "
  default     = "Security"
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


#---------------------------------------------------------------------------------------------------#


