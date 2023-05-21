variable "create_resource_group" {
  description = "Whether to create resource group and use it for all networking resources"
  default     = false
}


variable "primary_sqlmi" {
  type        = string
  description = "The name of the SQL Managed Instance. This needs to be globally unique within Azure."
}

variable "resource_group_name" {
  description = "Name of the resource group to be imported."
  type        = string
  default     = "rg"
}


variable "location" {
  description = "The location/region to keep all your network resources. To get the list of all locations with table format from azure cli, run 'az account list-locations -o table'"
  default     = "East US"
}

variable "secondary_location" {
  description = "The location/region to keep all your network resources. To get the list of all locations with table format from azure cli, run 'az account list-locations -o table'"
  default     = "East US 2"
}

variable "administrator_login" {
  type        = string
  description = "The administrator login name for the new server"

}

variable "license_type" {
  type        = string
  description = "What type of license the Managed Instance will use"

}
variable "sku_name" {
  type        = string
  description = "Specifies the SKU Name for the SQL Managed Instance."

}

variable "vcores" {
  type        = string
  description = "Number of cores that should be assigned to your instance"

}

variable "storage_size_in_gb" {
  type        = number
  description = "Maximum storage space for your instance"

}

variable "public_data_endpoint_enabled" {
  type        = bool
  description = "Is the public data endpoint enabled?"
  default     = false

}

variable "collation" {
  type        = string
  description = "Specifies how the SQL Managed Instance will be collated"
  default     = "SQL_Latin1_General_CP1_CI_AS"
}


variable "minimum_tls_version" {
  type        = string
  description = "The Minimum TLS Version"
  default     = "1.2"
}

variable "proxy_override" {
  type        = string
  description = "Specifies how the SQL Managed Instance will be accessed"
  default     = "Default"
}

variable "subnet_id" {
  type        = string
  description = "(required)The subnet resource id that the SQL Managed Instance will be associated with."

}

variable "timezone_id" {
  type        = string
  description = "The TimeZone ID that the SQL Managed Instance will be operating in."
  default     = "UTC"
}

variable "dns_zone_partner_id" {
  type        = string
  description = "The ID of the SQL Managed Instance which will share the DNS zone."
  default     = null
}

variable "storage_account_type" {
  type        = string
  description = "Specifies the storage account type used to store backups for this database"
  default     = "GRS"
}

variable "identity_type" {
  type        = string
  description = "identity block "
  default     = null
}

variable "maintenance_configuration_name" {
  type        = string
  description = " The name of the Public Maintenance Configuration window to apply to the SQL Managed Instance."
  default     = "SQL_Default"
}

variable "secondary_sqlmi" {
  description = "The Secondary (Failover) SQL MI instance details"
  type        = map(any)
  default     = null
}

variable "database_name" {
  type        = map(any)
  description = "name of db"
}

variable "failover_group_name" {
  type        = map(any)
  description = "name of failover group"
}


variable "mode" {
  type        = string
  description = "The failover mode"
}

variable "grace_minutes" {
  type        = string
  description = "The grace period in minutes before failover with data loss is attempted."
  default     = null
}



variable "login_username" {
  type        = string
  description = "The login name of the principal to set as the Managed Instance Administrator"

}

variable "object_id" {
  type        = string
  description = "The Object ID of the principal to set as the Managed Instance Administrator"
}

variable "tenant_id" {
  type        = string
  description = "The Azure Active Directory Tenant ID"
}

variable "azuread_authentication_only" {
  type        = bool
  description = "When true, only permit logins from AAD users and administrators. When false, also allow local database users."
  default     = false

}

variable "storage_container_path" {
  type        = string
  description = " A blob storage container path to hold the scan results"

}

variable "storage_account_access_key" {
  type        = string
  description = " Specifies the identifier key of the storage account for vulnerability assessment scan results."
  default     = null
}

variable "storage_container_sas_key" {
  type        = string
  description = "A shared access signature (SAS Key) that has write access to the blob container specified in storage_container_path parameter. If storage_account_access_key isn't specified, storage_container_sas_key is required."
}

variable "recurring_scans" {
  type        = map(any)
  description = "The recurring scans settings"
  default     = null
}



variable "create_aad" {
  type        = bool
  description = "want to create aad or not"
  default     = false
}



variable "create_vulnerability_assessment" {
  type        = bool
  description = "wants to create vulnerability assessment"
  default     = false
}

variable "create_managed_db" {
  type        = bool
  description = "wants to create database or not"
  default     = false
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

variable "key_vault_secret_name" {
  type        = string
  description = "key vault secret name"
}

variable "key_vault_id" {
  type        = string
  description = "ID of keyvault"
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

#---------------------------------------------------------------------------------------------------#
variable "enable_log_monitoring" {
  type        = bool
  description = "enable log monitoring"
}

variable "diag_name" {
  type        = string
  description = "Specifies the name of the Diagnostic Setting."
}

variable "target_resource_id" {
  description = "ID of target resource"
}

variable "log_analytics_workspace_id" {
  description = "ID of log anaytics workspace"
}

variable "log_analytics_destination_type" {
  type        = string
  description = "log_analytics_destination_type"
}

variable "storage_account_id" {
  description = "ID of target resource"
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