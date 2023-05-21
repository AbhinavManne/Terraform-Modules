variable "resource_group_name" {
  type        = string
  description = "Resource group name"
}
variable "storage_account_name" {
  type        = string
  description = "Name of the storage account"
}
variable "key_vault_name" {
  type        = string
  description = "Name of the key vault"
}
variable "diagnostic_setting_name" {
  type        = string
  description = "Name of the diagnostic_setting"
}
variable "log_category" {
  type        = string
  description = "Name of the log category"
}
variable "metric_category" {
  type        = string
  description = "Name of the metric category"
}
variable "enabled" {
  type        = bool
  description = " Is this Diagnostic Log enabled? Defaults to true"
}
