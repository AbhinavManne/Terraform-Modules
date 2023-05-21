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