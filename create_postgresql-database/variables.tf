#-----------------------------------Resource Group---------------------------------------------------
variable "create_resource_group" {
  type        = bool
  description = "Whether to create resource group?"
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name"
}
variable "location" {
  type        = string
  description = "Resource group location"
}

#---------------------------------Postgre SQL Server--------------------------------------------------
variable "postgresqlserver_name" {
  description = "MySQL server Name"
}

variable "admin_username" {
  description = "The administrator login name for the new SQL Server"
}

variable "admin_password" {
  type        = string
  description = "The password associated with the admin_username user"
}

variable "sku_name" {
  description = "sku name"
}

variable "storage_mb" {
  description = "stoarge for mysql"
}

variable "postgresql_version" {
  description = "version of mysql"
}

variable "auto_grow_enabled" {
  description = "Enable/Disable auto-growing of the storage"
}

variable "backup_retention_days" {
  description = "Backup retention days for the server, supported values are between 7 and 35 days."
}

variable "geo_redundant_backup_enabled" {
  description = "Turn Geo-redundant server backups on/off"
}

variable "infrastructure_encryption_enabled" {
  description = "Whether or not infrastructure is encrypted for this server"
}

variable "public_network_access_enabled" {
  description = "Whether or not public network access is allowed for this server"
}

variable "ssl_enforcement_enabled" {
  description = "Specifies if SSL should be enforced on connections"
}

variable "ssl_minimal_tls_version_enforced" {
  description = "The minimum TLS version to support on the sever."
}

variable "create_mode" {
  description = "The creation mode. Can be used to restore or replicate existing servers. Possible values are `Default`, `Replica`, `GeoRestore`, and `PointInTimeRestore`. Defaults to `Default`"
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
}
###################################### Identity

variable "managed_identity_type" {
  description = "type of identity"
  type        = string
  default     = null
}

###################################### Threat protection policy

variable "enable_threat_detection_policy" {
  description = "Threat detection policy configuration, known in the API as Server Security Alerts Policy"
}

variable "disabled_alerts" {
  description = "Specifies an array of alerts that are disabled. Allowed values are: Sql_Injection, Sql_Injection_Vulnerability, Access_Anomaly, Data_Exfiltration, Unsafe_Action."
  type        = list(any)
}

variable "email_addresses_for_alerts" {
  description = "A list of email addresses which alerts should be sent to."
  type        = list(any)

}

variable "log_retention_days" {

}

variable "storage_account_access_key" {
  description = "access key of the storage account"
  type        = string
  default     = null
}
variable "storage_endpoint" {
  description = "storage endpoint"
  type        = string
  default     = null
}

#-------------------------------------- Postgre sql Database ---------------------------------------

variable "charset" {
  description = "Specifies the Charset for the Database, which needs to be a valid Charset"
}

variable "collation" {
  description = "Specifies the Collation for the Database, which needs to be a valid Collation. "
}

#--------------------------------------  Postgresql Configuration --------------------------

variable "postgresql_configuration" {
  description = "Sets a MySQL Configuration value on a MySQL Server"
  type        = map(string)
}

#-------------------------------------- Postgresql Firewall rule ---------------------------

variable "firewall_rules" {
  description = "Range of IP addresses to allow firewall connections."
  type = map(object({
    start_ip_address = string
    end_ip_address   = string
  }))
}

#-------------------------------- postgresql active directory administrator ----------------
variable "ad_admin_login_name" {
  description = "The login name of the principal to set as the server administrator"
}

#-------------------------------- postgresql server key -----------------------

variable "key_vault_key_id" {
  description = "The URL to a Key Vault Key"
  type        = string
}

#-----------------------postgresql_virtual_network_rule -------------------------

variable "subnet_id" {
  description = "subnet ID"
  type        = string
}

#----------------------------- Alerts -------------------------------

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

variable "operation_name_log_alert" {
  type        = string
  description = "The Resource Manager Role-Based Access Control operation name. Supported operation should be of the form: <resourceProvider>/<resourceType>/<operation> "
}

variable "category_log_alert" {
  type        = string
  description = "The category of the operation. Possible values are Administrative, Autoscale, Policy, Recommendation, ResourceHealth, Security and ServiceHealth "
}

#------------------VARIABLES: METRIC ALERT-------------------------------#

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

#--------------Private Endpoint----------------------------

variable "create_private-endpoint" {
  type        = string
  description = "pvt endpoint count"
}

variable "storage_account_id" {
  type = string

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
}

variable "private_dns_zone_group" {

  type = object({
    name                 = string
    private_dns_zone_ids = list(string)
  })
  default = null
}

#----------------------------------------------------------------
variable "private_connection_resource_alias" {
  type        = string
  description = "alias name"
}

#------------------------------ diag settings ----------------------
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


variable "metric_retention_policy_enabled" {
  type        = bool
  description = "metric_retention_policy_enabled"
}

variable "metric_retention_days" {
  type        = number
  description = "log_retention_days"
}