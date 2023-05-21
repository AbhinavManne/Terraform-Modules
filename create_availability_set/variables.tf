#---------------------------------------- resource group variables -----------------------------------------
variable "create_resource_group" {
  type        = bool
  description = "Whether to create resource group and use it for all networking resources"
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name"
}

variable "location" {
  type        = string
  description = "The location/region to keep all your resources. To get the list of all locations with table format from azure cli, run 'az account list-locations -o table'"
}

variable "tags" {
  type        = map(any)
  description = "Tags"
}

#-------------------------------------availability set variables---------------------------------------------#
variable "availability_set" {
  type        = string
  description = "Name of the availability set in azure"
}

variable "platform_fault_domain_count" {
  type        = string
  description = "Specifies the number of fault domains that are used. Defaults to 3. Changing this forces a new resource to be created."
}

variable "platform_update_domain_count" {
  type        = string
  description = "Specifies the number of update domains that are used. Defaults to 5. Changing this forces a new resource to be created."
}

variable "managed" {
  type        = string
  description = "Specifies whether the availability set is managed or not. Possible values are true (to specify aligned) or false (to specify classic). Default is true."
}

variable "enable_proximity_placement_group"{
  type        = bool
  description = "Want to enable proximity_placement_group?"
}

variable "proximity_placement_group_name" {
  type        = string
  description = "Name of proximity placement group"
}
