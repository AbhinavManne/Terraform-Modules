#-----------------------------VARIABLE: RESOURCE GROUP------------------------------------------------------------#
variable "resource_group" {
  type        = string
  description = "RG name in Azure"
}

variable "create_resource_group" {
  type        = bool
  description = "create resource group"
}

variable "location" {
  type        = string
  description = "RG location in Azure"
}

#----------------------------------------VARIABLE: VIRTUAL NETWORK-------------------------------------------------#
variable "virtual_network" {
  type        = string
  description = "Virtual network name in Azure"
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

variable "tags" {
  type        = map(string)
  description = "The tags to associate with the resource."
}

#----------------------------------------VARIABLES: DDOS Protection------------------------------------------------#
variable "network_ddos_protection_plan" {
  type        = string
  description = "network ddos protection plan"
}

#---------------------------------------------VARIABLE: SUBNET-----------------------------------------------------#
variable "subnet_name" {
  type        = string
  description = "Subnet name in Azure"
}

variable "subnet_address_prefixes" {
  type        = list(string)
  description = "List of address prefixes of the subnet"
}

variable "service_endpoints" {
  type        = list(string)
  description = "List of service endpoints of the subnet"
}

#---------------------------------------- Public IP variables -----------------------------------------
variable "public_ip" {
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

#------------------------------------------VARIABLES: Firewall ---------------------------------------------------#
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

#------------------------------------------VARIABLES: POSTGRE SQL------------------------------------------------#
variable "postgresql_server" {
  type        = string
  description = "PostgreSQL server name in Azure"
}

variable "psql_virtual_network_rule" {
  type        = string
  description = "Name of the PostgreSQL Virtual Network Rule"
}