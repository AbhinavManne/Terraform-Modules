variable "enable_log_monitoring" {
  type  = bool
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
  type = string
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
  type  = bool
  description = "log_enabled"
}

variable "log_retention_policy_enabled" {
  type  = bool
  description = "log_retention_policy_enabled"
}

variable "log_retention_days" {
  type  = number
  description = "log_retention_days"
}

variable "metric_retention_policy_enabled" {
  type  = bool
  description = "metric_retention_policy_enabled"
}

variable "metric_retention_days" {
  type  = number
  description = "log_retention_days"
}