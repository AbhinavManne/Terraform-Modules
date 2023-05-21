variable "resource_group_name" {
  type        = string
  description = "resource group name"
}

variable "action_group_name" {
  type        = string
  description = "action group name"
}

variable "virtual_machine_name" {
  type        = string
  description = " virtual machine name"
}

variable "environment" {
  type        = string
  description = "environment"
}

#output value
variable "resource_id" {
}
