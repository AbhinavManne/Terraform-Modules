
#---------------------------------------- resource group variables -----------------------------------------
variable "create_resource_group" {
  type        = bool
  description = "Whether to create resource group and use it for all networking resources"
  default     = false
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name"
  default     = "rg-cil-test"
}

variable "location" {
  type        = string
  description = "The location/region to keep all your resources. To get the list of all locations with table format from azure cli, run 'az account list-locations -o table'"
  default     = "East US"
}

variable "tags" {
  type        = map(any)
  description = "Tags"
}
