variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}
variable "application_insights_name" {
  type        = string
  description = "Name of the application insights component"
}

variable "private_link_scope" {
  description = "name of private link scope"
}

variable "private_link_scoped_service" {
  description = " name of private link scoped service "
}
variable "application_insights_type" {
  type        = string
  description = "Type of application insights"
}

variable "log_analytics_workspace" {
  description = "Nme of the log analytics workspace"
}

variable "sku" {
  description = " sku of log analytics workspace "
}

variable "retention_in_days" {
  description = "Specifies the retention period in days. "
}

variable "daily_data_cap_in_gb" {
  description = " Specifies the Application Insights component daily data volume cap in GB."
}

variable "daily_data_cap_notifications_disabled" {
  description = " Specifies if a notification email will be send when the daily data volume cap is met."
}

variable "sampling_percentage" {
  description = " Specifies the percentage of the data produced by the monitored application that is sampled for Application Insights telemetry."
}

variable "disable_ip_masking" {
  description = " By default the real client ip is masked as 0.0.0.0 in the logs. Use this argument to disable masking and log the real client ip "
}

variable "tags" {
  type        = map(any)
  description = "Tags"
}
variable "smart_detection_rule" {
  description = " Specifies the name of the Application Insights Smart Detection Rule."
}

variable "enabled" {
  description = "Is the Application Insights Smart Detection Rule enabled? "
}

variable "read_telemetry" {
  description = "name of read telemetry api key "
}

variable "write_annotations" {
  description = " name of write annotation api key"
}

variable "write_permissions" {
  description = " Specifies the list of write permissions granted to the API key. "
}

variable "authenticate_sdk_control_channel" {
  description = " name of the sdk control channel api key "
}

variable "read_permissions1" {
  description = " read permissions  "
}
variable "read_permissions2" {
  description = " read permissions  "
}

variable "full_permissions" {
  description = "  name of full permission api key"
}

variable "read_permissions" {
  description = " read permissions in api key"
}

variable "role_definition_name" {
  type        = list(string)
  description = "List of Role Definitions"
}