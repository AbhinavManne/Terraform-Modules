#-------------------------------OUTPUT VALUES----------------------------------------#
variable "resource_id" {
  type        = string
  description = "NSG ID "
}

variable "storage_account_id" {
  type        = string
  description = "Storage account ID "
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name "
}

variable "resource_group_id" {
  type        = string
  description = "Resource group ID "
}

variable "resource_group_location" {
  type        = string
  description = "Resource group location "
}

#-----------------------------------------VARIABLES: ACTION GROUP----------------------------------#

variable "action_group_name" {
  type        = string
  default     = "example-action-group"
  description = "The name of the Action Group. Changing this forces a new resource to be created"
}

variable "short_name" {
  type        = string
  default     = "actiongroup"
  description = "The short name of the action group"
}

#-------------------------------------------VARIABLES: ACTION GROUP RULE----------------------------#

variable "action_group_rule_name" {
  type        = string
  default     = "example-demo"
  description = "Specifies the name of the Monitor Action Rule. Changing this forces a new resource to be created"
}

variable "scope_type" {
  type        = string
  default     = "Resource"
  description = "Specifies the type of target scope. Possible values are ResourceGroup and Resource"
}

#---------------------------------------------VARIABLES: ACTIVITY LOG ALERT---------------------------#

variable "activity_log_alert_name" {
  type        = string
  default     = "example-activitylogalert"
  description = "The name of the activity log alert. Changing this forces a new resource to be created"
}

variable "operation_name_log_alert" {
  type        = string
  default     = "Microsoft.Network/networkSecurityGroups/write"
  description = "The Resource Manager Role-Based Access Control operation name"
}

variable "category_log_alert" {
  type        = string
  default     = "Security"
  description = "The category of the operation. Possible values are Administrative, Autoscale, Policy, Recommendation, ResourceHealth, Security and ServiceHealth"
}

#----------------------------------------------VARIABLES: METRIC ALERT-------------------------------#

variable "metric_alert_name" {
  type        = string
  default     = "example-metricalert"
  description = "The name of the Metric Alert. Changing this forces a new resource to be created"
}

variable "metric_namespace" {
  type        = string
  default     = "Microsoft.Storage/storageAccounts"
  description = "One of the metric namespaces to be monitored"
}

variable "metric_name" {
  type        = string
  default     = "Transactions"
  description = "One of the metric names to be monitored"
}

variable "aggregation" {
  type        = string
  default     = "Total"
  description = "The statistic that runs over the metric values. Possible values are Average, Count, Minimum, Maximum and Total"
}

variable "operator" {
  type        = string
  default     = "GreaterThan"
  description = "The criteria operator. Possible values are Equals, NotEquals, GreaterThan, GreaterThanOrEqual, LessThan and LessThanOrEqual."
}

variable "threshold" {
  type        = number
  default     = 50
  description = "The criteria threshold value that activates the alert"
}

variable "dimension_name" {
  type        = string
  default     = "ApiName"
  description = "One of the dimension names"
}

variable "dimension_operator" {
  type        = string
  default     = "Include"
  description = "The dimension operator. Possible values are Include, Exclude and StartsWith"
}

variable "values" {
  type        = list(string)
  default     = ["*"]
  description = "The list of dimension values"
}

#---------------------------------------------------------------------------------------------------#