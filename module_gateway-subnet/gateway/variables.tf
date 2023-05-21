
variable "create_resource_group" {
  description = "Whether to create resource group and use it for all networking resources"
}

variable "resource_group_name" {
  description = "A container that holds related resources for an Azure solution"
}

variable "location" {
  description = "The location/region to keep all your network resources. To get the list of all locations with table format from azure cli, run 'az account list-locations -o table'"
}
variable "address_prefixes" {
  type        = list(string)
  description = "List of address prefixes of the subnet"
}


#---------------------------------------- virtual network variables -----------------------------------------
variable "vnet_name" {
  type        = string
  description = "virtual network name"
}

variable "address_space" {
  type        = list(string)
  description = "address spaces for vnet"
}

variable "dns_servers" {
  type        = list(string)
  description = "DNS server"
}

variable "enable_ddos_protection_plan1" {
  type        = bool
  description = "enable ddos protection plan "
}

#---------------------------------------- DDOS Protection variables -----------------------------------------
variable "network_ddos_protection_plan" {
  type        = string
  description = "network ddos protection plan"
}
#---------------------------------------- Public IP variables -----------------------------------------
variable "public_ip_name" {
  type        = string
  description = "public ip name"
}

variable "allocation_method" {
  type        = string
  description = "allocation method"
}

variable "sku" {
  type        = string
  description = "sku"
}
#---------------------------------------- Firewall variables -----------------------------------------
variable "firewall_name" {
  type        = string
  description = "name of the firewall"
}

variable "threat_intel_mode" {
  type        = string
  description = "threat intel mode"
}


variable "ip_config" {
  type        = string
  description = "ip configuration"
}

variable "tags" {
  type        = map(any)
  description = "Tags"
}