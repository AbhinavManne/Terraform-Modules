#-----------------------------VARIABLE: DATA SOURCE: RESOURCE GROUP---------------------------------------#
variable "resource_group" {
  type        = string
  description = "RG name in Azure"
}

variable "create_resource_group" {
  type        = bool
  description = "create resource group"
}

variable "location" {
  type        = string
  description = "RG location in Azure"
}

#-------------------------------------VARIABLES:RESOURCE: AUTOMATION ACCOUNT-------------------------------#
variable "automation_account" {
  type        = string
  description = "Specifies the name of the Automation Account."
}

variable "sku_name" {
  type        = string
  description = "The SKU name of the account - only Basic is supported at this time."
}

variable "tags" {
  type        = map(string)
  description = "The tags to associate with the resource."
}

#-------------------------------------VARIABLES:RESOURCE: AUTOMATION RUNBOOK-------------------------------#
variable "automation_runbook_name" {
  type        = string
  description = "The SKU name of the account - only Basic is supported at this time."
}

variable "log_verbose" {
  type        = bool
  description = "The SKU name of the account - only Basic is supported at this time."
}

variable "log_progress" {
  type        = bool
  description = "The SKU name of the account - only Basic is supported at this time."
}

variable "description" {
  type        = string
  description = "The SKU name of the account - only Basic is supported at this time."
}

variable "runbook_type" {
  type        = string
  description = "The SKU name of the account - only Basic is supported at this time."
}

#-------------------------------------VARIABLES:RESOURCE: AUTOMATION SCHEDULE------------------------------#
variable "automation_schedule_name" {
  type        = string
  description = "Specifies the name of the Schedule"
}

variable "frequency" {
  type        = string
  description = "The frequency of the schedule. - can be either OneTime, Day, Hour, Week, or Month"
}

variable "interval" {
  type        = number
  description = " The number of frequencys between runs. Only valid when frequency is Day, Hour, Week, or Month and defaults to 1."
}

variable "schedule_description" {
  type        = string
  description = " description for this Schedule"
}

variable "week_days" {
  type        = list(string)
  description = "List of days of the week that the job should execute on. Only valid when frequency is Week."
}

#----------------------------------VARIABLES: RBAC MODULE----------------------------------------------#

variable "role_definition_name" {
  type        = list(string)
  description = "List of Role Definitions"
  default     = ["Reader", "Contributor"]
}

#----------------------------------------------------------------------------------------------------------#