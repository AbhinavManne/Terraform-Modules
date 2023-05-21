variable "resource_group_name" {
  type        = string
  description = "Name of the Resource Group"
}

variable "location" {
  type        = string
  description = "Name of the Region"
}

variable "role_definition_name" {
  type        = list
  description = "List of Role Definitions"
}