variable "resource_group_name" {
  type        = string
  description = "Name of the Resource Group"
}

variable "role_definition_name" {
  type        = list(string)
  description = "List of Role Definitions"
}

variable "scope" {
  type        = string
  description = "Scope of the Role Assignment"

}

variable "resource_group_id" {
  type        = string
  description = "Resource group ID "
}

variable "resource_group_location" {
  type        = string
  description = "Resource group location "
}
