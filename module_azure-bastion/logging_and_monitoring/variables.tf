#-------------------------------OUTPUT VALUES----------------------------------------#
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

variable "resource_id" {
  type        = string
  description = "Resource ID"
}

#-------------------------------VARIABLES: DIAGNOSTIC SETTING RESOURCE------------------#
variable "diag_setting_name" {
  type        = string
  default     = "diag123"
  description = "Name of diagnostic setting in Azure Portal "
}

variable "log_category" {
  type        = string
  default     = "BastionAuditLogs"
  description = " "
}

variable "enabled_log" {
  type        = string
  default     = "true"
  description = " "
}

variable "enabled_retention_log" {
  type        = string
  default     = "true"
  description = " "
}

variable "days_retention_log" {
  type        = number
  default     = 7
  description = " "
}

variable "metric_category" {
  type        = string
  default     = "AllMetrics"
  description = " "
}

variable "enabled_retention_metric" {
  type        = string
  default     = "true"
  description = " "
}

variable "days_retention_metric" {
  type        = number
  default     = 7
  description = " "
}

