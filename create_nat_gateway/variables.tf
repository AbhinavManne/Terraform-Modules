#-----------------------------------Resource Group---------------------------------------------------
variable "create_resource_group" {
  type        = bool
  description = "Whether to create resource group?"
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name"
}

variable "location" {
  type        = string
  description = "Location where NAT gateway should exist"
}

#------------------------------ NAT Gateway --------------------------------
variable "nat_gateway_name" {
  type        = string
  description = "NAT gateway name"
}

variable "sku_name" {
  type        = string
  default     = "Standard"
  description = "The SKU which should be used"
}

variable "idle_timeout_in_minutes" {
  type        = number
  default     = 4
  description = "Idle timeout in minutes"
}

variable "zones" {
  type        = list(string)
  description = "Specifies a list of Availability Zones in which this NAT Gateway should be located."
}

variable "tags" {
  type        = map(any)
  description = "Tags"
}
#------------------------------ Public IP --------------------------------
variable "nat_gateway_public_ip_name" {
  type        = string
  description = "Specifies the name of the Public IP, which is specific to NAT Gateway"
}
variable "allocation_method" {
  type        = string
  description = "Defines the allocation method for this IP address"
}
variable "sku" {
  type        = string
  default     = "Basic"
  description = "The SKU of the Public IP"
}
#------------------------------ Variable for public ip prefix association--------------------------------

variable "public_ip_prefix_id" {
  type        = string
  description = "ID of the public ip prefix id"
}

#------------------------------ Variable for Subnet association --------------------------------
variable "subnet_id" {
  type        = list(string)
  description = "ID of the subnet"
}



