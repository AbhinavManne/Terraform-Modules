#-------------------------------OUTPUT VALUES----------------------------------------#

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

variable "resource_id" {
  type        = string
  description = "Resource ID"
}

#-----------------------------------------VARIABLES: ACTION GROUP----------------------------------#

variable "action_group_name" {
  type        = string
  default     = "example-action-group11"
  description = " "
}

variable "short_name" {
  type        = string
  default     = "actiongroup"
  description = " "
}

#-------------------------------------------VARIABLES: ACTION GROUP RULE----------------------------#

variable "action_group_rule_name" {
  type        = string
  default     = "rule123"
  description = " "
}

variable "scope_type" {
  type        = string
  default     = "Resource"
  description = " "
}

#---------------------------------------------VARIABLES: ACTIVITY LOG ALERT---------------------------#

variable "activity_log_alert_name" {
  type        = string
  default     = "example-activitylogalert"
  description = " "
}

variable "operation_name_log_alert" {
  type        = string
  default     = "Microsoft.Storage/storageAccounts/write"
  description = " "
}

variable "category_log_alert" {
  type        = string
  default     = "Recommendation"
  description = " "
}

#----------------------------------------------VARIABLES: METRIC ALERT-------------------------------#

variable "metric_alert_name" {
  type        = string
  default     = "example-metricalert123"
  description = " "
}

variable "metric_namespace" {
  type        = string
  default     = "Microsoft.Storage/storageAccounts"
  description = " "
}

variable "metric_name" {
  type        = string
  default     = "Transactions"
  description = " "
}

variable "aggregation" {
  type        = string
  default     = "Total"
  description = " "
}

variable "operator" {
  type        = string
  default     = "GreaterThan"
  description = " "
}

variable "threshold" {
  type        = number
  default     = 50
  description = " "
}

variable "dimension_name" {
  type        = string
  default     = "ApiName"
  description = " "
}

variable "dimension_operator" {
  type        = string
  default     = "Include"
  description = " "
}

variable "values" {
  type        = list(string)
  default     = ["*"]
  description = " "
}

#---------------------------------------------------------------------------------------------------#
#--------------------------------------Storage account -------------------------------------------------------------#
variable "storage_account_name" {
  type = string
  description = "Resource Group Name"
  default = "abc1r2"
}

variable "storage_account_tier" {
  type = string
  description = "Storage Account Tier"
  default = "Standard"
}

variable "storage_account_replication_type" {
  type = string
  description = "Storage Account Replication Type"
  default = "LRS"
}