variable "create_resource_group" {
  type        = bool
  description = "Whether to create resource group and use it for all networking resources"
}
variable "location" {
  type        = string
  description = "The location/region where the virtual network is created. Changing this forces a new resource to be created."
}
variable "resource_group_name" {
  type        = string
  description = "The name of the resource group in which to create the virtual network."
}
variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(any)
}
variable "vnet" {
  type = list(object({
    virtual_network_name          = string
    virtual_network_address_space = list(string)
    bgp_community                 = string
    dns_servers                   = list(string)
    edge_zone                     = string
    flow_timeout_in_minutes       = string
    enable_ddos_protection_plan   = bool
    id_of_ddos_protection_plan    = string
    tags                          = map(string)
  }))
  description = "Details of Virtual Network."
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

