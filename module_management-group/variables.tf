variable "name" {
  type        = string
  description = "Name for management group"
}


variable "display_name" {
  type        = string
  description = "A friendly name for this management group. If not specified, this will be the same as the name"
}

variable "parent_management_group_name" {
  description = "The ID of the parent management group."
}

variable "subscription_ids" {
  description = "A list of subscription GUIDs which should be assigned to the management group"
}