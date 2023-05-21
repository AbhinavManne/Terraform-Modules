variable "subnet_name_and_subnet_id" {
  type = map(string)
  description = "Map of Subnet Name and respective Subnet ID."
}

variable "subnet_name_and_nsg_id" {
  type = map(string)
  description = "Map of Subnet name and NSG ID which we want to subnet."
}