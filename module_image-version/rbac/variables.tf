variable "resource_group_name" {
  type        = string
  description = "Name of the Resource Group"
}

variable "role_definition_name" {
  type        = list(string)
  default     = ["reader", "contributor"]
  description = "List of Role Definitions"
}

variable "scope" {
  type        = string
  description = "Scope of the Role Assignment"

}