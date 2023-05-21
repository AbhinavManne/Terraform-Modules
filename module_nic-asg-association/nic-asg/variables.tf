variable resource_group_name {
  type        = string
  description = "Name of the resource group in which Application Security Group exists"
}
variable "create_resource_group" {
  description = "Whether to create resource group and use it for all networking resources"
}

variable "location" {
  description = "The location/region to keep all your network resources. To get the list of all locations with table format from azure cli, run 'az account list-locations -o table'"
}
variable application_security_group {
  type        = string
  description = "Name of the Application Security Group"
}

variable network_interface {
  type        = string
  description = "Name of the Network Interface"
}

variable "vnet_name" {
  type        = string
  description = "vnet name in Azure"
}

variable "subnet_name" {
  type        = string
  description = "subnet name in Azure"
}

variable "address_space" {
  type        = list(string)
  description = "address spaces for vnet"
}

variable "address_prefixes" {
  type        = list(string)
  description = "address prefixes"
}

variable "ip_configuration" {
  description = "name of ip configuration"
}

variable "private_ip_address_allocation" {
  description = "the allocation method used for the Private IP Address."
}

variable tags {
  type        = map
  description = "Tags"
}