variable "management_group_name" {
  type        = string
  description = "Name of the Management Group"
}

variable "role_definition_name" {
  type        = list(string)
  description = "List of Role Definitions"
}