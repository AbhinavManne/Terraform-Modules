variable "resource_group" {
  type        = string
  description = "Name of the resource group"
}


variable "logic_app_workflow" {
  type        = string
  description = "Specifies the name of the Logic App Workflow"
}

variable "logic_app_http_trigger" {
  type        = string
  description = " Specifies the name of the HTTP Request Trigger  within the Logic App Workflow"
}

variable "tags" {
  description = "Tag Name"
  type        = map(any)
}

#---------variables for Storage Account--------#

variable "storage_account_name" {
  type        = string
  description = "Resource Group Name"
}

variable "storage_account_tier" {
  type        = string
  description = "Storage Account Tier"
}

variable "storage_account_replication_type" {
  type        = string
  description = "Storage Account Replication Type"
}

variable "role_definition" {
  type    = list(any)
  default = ["reader"]
}
