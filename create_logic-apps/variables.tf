variable "location" {
  type = string
}

variable "resource_group" {
  type = string
}

variable "logic_apps" {
  type = string
}

variable "tags" {
  description = "Tag Name"
  type        = map(any)
}

variable "role_definition" {
  type    = list(any)
  default = ["reader"]
}
#--------------------------------------------Storage Account Variable-------------------------------------
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
