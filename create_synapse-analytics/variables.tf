variable "create_resource_group" {
  type        = bool
  description = "Whether to create resource group?"
}

variable "resource_group_name" {
  description = "Name of the resource group to be imported."
  type        = string
}

variable "location" {
  description = "The location/region to keep all your network resources. To get the list of all locations with table format from azure cli, run 'az account list-locations -o table'"
}

variable "tags" {
  description = "value"
  type        = map(any)
}

variable "synapse_name" {
  type        = string
  description = "Specifies the name which should be used for this synapse Workspace. Changing this forces a new resource to be created."
}

variable "adminlogin" {
  description = "Specifies The Login Name of the SQL administrator. Changing this forces a new resource to be created."
  type        = string
}



variable "managed_virtual_network_enabled" {
  description = "Is Virtual Network enabled for all computes in this workspace? Defaults to false."
  type        = bool
}

variable "sql_identity_control_enabled" {
  description = "Are pipelines (running as workspace's system assigned identity) allowed to access SQL pools? Defaults to false."
  type        = bool
}

variable "managed_resource_group_name" {
  description = "value"
  type        = string
}

variable "aad_admin" {
  description = "AzureAD Admin block"
  type        = map(any)
  default     = null
}

variable "sql_aad_admin" {
  description = "AzureAD Admin block"
  type        = map(any)
  default     = null
}

variable "azure_devops_repo" {
  description = "azure_devops_repo configuration block."
  type        = map(any)
  default     = null
}

variable "github_repo" {
  description = "github_repo configuration block"
  type        = map(any)
  default     = null
}

variable "synapsesql" {
  description = "The name which should be used for this Synapse Sql Pool. Changing this forces a new synapse SqlPool to be created."
  type        = string
}


variable "synapse_sql_pool" {
  description = "describe your variable"
}

variable "synapse_spark_pool" {
  description = "describe your variable"
}


variable "data_exfiltration_protection_enabled" {
  description = "s data exfiltration protection enabled in synapse workspace?"
}


variable "firewall_rules" {
  description = "Range of IP addresses to allow firewall connections."
  type = map(object({

    start_ip_address = string
    end_ip_address   = string

  }))
}


variable "compute_subnet_id" {
  type        = string
  description = "Subnet ID used for computes in workspace"
  default     = null
}

variable "linking_allowed_for_aad_tenant_ids" {
  type        = list(string)
  description = "Allowed AAD Tenant Ids For Linking."
  default     = null
}

variable "public_network_access_enabled" {
  type        = string
  description = "Whether public network access is allowed for the Cognitive Account"
  default     = true
}

variable "purview_id" {
  type        = string
  description = " The ID of purview account."
  default     = null
}

variable "filesystem_name" {
  type        = string
  description = "filesystem name "
}

variable "storage_account_id" {
  type        = string
  description = "storage account id"
}

variable "managed_identity_type" {
  description = "The type of Managed Identity . Possible values are `SystemAssigned`, `UserAssigned` and `SystemAssigned, UserAssigned`"
  type        = string
}

##-----------keyvault secret -----------------------##
variable "key_vault_secret_name" {
  type=string
  description = "key vault secret name"
}

variable "key_vault_id" {
  type= string
  description ="ID of keyvault"
}

#-----------Alerts ,diag variables,pvt endpoint --------------------------------#
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

variable "log_retention_days" {
  type        = number
  description = "log_retention_days"
}

variable "subnet_id" {
  description = "Id of subnet"
  #default = ""
}
