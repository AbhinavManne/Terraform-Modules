variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "log_analytics_workspace_name" {
  type        = string
  description = "Name of the log analytics workspace"
}

variable "tags" {
  type        = map(string)
  description = "The tags to associate with the resource."
}

#----------------------------------VARIABLES: RBAC MODULE----------------------------------------------#
variable "role_definition_name" {
  type        = list(string)
  description = "List of Role Definitions"
  default     = ["Reader", "Contributor"]
}

#------------------------------------------------------------------------------------------------------#