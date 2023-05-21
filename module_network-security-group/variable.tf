
#---------------------Network Security Group---------------------#

variable "csv_file_name_for_NSG" {
  type        = string
  description = "Name of the CSV file where Network Security Rule details defined."
}

variable "location" {
  type        = string
  description = "Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group in which to create the network security group. Changing this forces a new resource to be created."
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resource."
}

