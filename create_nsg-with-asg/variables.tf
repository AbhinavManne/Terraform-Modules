variable "resource_group_name" {
  type        = string
  description = "Name of the resource group in which Application Security Group exists"
}
variable "create_resource_group" {
  description = "Whether to create resource group and use it for all networking resources"
}

variable "location" {
  description = "The location/region to keep all your network resources. To get the list of all locations with table format from azure cli, run 'az account list-locations -o table'"
}

variable "network_security_group" {
  type        = string
  description = "NSG name in Azure"
}

variable "application_security_group" {
  type        = string
  description = "ASG name in Azure"
}

//Vars for NSG security_rule
variable "sr_name" {
  type        = string
  description = "Name in NSG security_rule"
}
variable "sr_priority" {
  type        = number
  description = "Priority in NSG security_rule"
}
variable "sr_direction" {
  type        = string
  description = "Direction in NSG security_rule"
}
variable "sr_access" {
  type        = string
  description = "Access in NSG security_rule"
}
variable "sr_protocol" {
  type        = string
  description = "Protocol in NSG security_rule"
}
variable "sr_source_port_range" {
  type        = string
  description = "Source_port_range in NSG security_rule"
}
variable "sr_destination_port_range" {
  type        = string
  description = "Destination_port_range in NSG security_rule"
}

variable "sr_destination_address_prefix" {
  type        = string
  description = "Destination_address_prefix in NSG security_rule"
}

variable "tags" {
  type        = map(any)
  description = "Tags"
}

variable "role_definition_name" {
  type = list(any)
}