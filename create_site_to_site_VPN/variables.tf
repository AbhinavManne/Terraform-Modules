variable "resource_group" {
  type        = string
  description = "Resource group name in Azure portal"
}

variable "location" {
  type        = string
  description = "Primary Location"
}

variable "tags" {
  description = "Tag Name"
  type        = map(any)
}

variable "role_definition" {
  type    = list(any)
  default = ["reader"]
}

#--Base VNet
variable "virtual_network" {
  type        = string
  description = "Base vnet"
}

variable "vnet_address_space" {
  type        = list(string)
  description = "Virtual Network address space "
}

variable "gateway_subnet_address" {
  type        = list(string)
  description = "Gateway subnet address"
}

variable "local_network_gateway" {
  type        = string
  description = "Local Network Gateway name in Azure Portal"
}

variable "gateway_address" {
  type        = string
  description = "Local Network Gateway address"
  #public ip address of subscription2
}

variable "address_space" {
  type        = list(string)
  description = "Address space in local network gateway"
  #vnet ip address of subscription2
}

variable "public_ip" {
  type        = string
  description = "Public IP address name in Azure portal"
}

variable "allocation_method" {
  type        = string
  description = "Allocation method in public IP"
}

variable "vnet_gateway" {
  type        = string
  description = "Virtual Network Gateway name in Azure Portal"
}

variable "vnet_gateway_type" {
  type        = string
  description = "Virtual Network Gateway type in Azure Portal"
}

variable "vpn_type" {
  type        = string
  description = "vpn type in virtual network gateway"
}

variable "active_active" {
  #type        = string
  description = "ip configuration in virtual network gateway"
}

variable "enable_bgp" {
  #type        = string
  description = " If true, BGP (Border Gateway Protocol) is enabled for this connection. Defaults to false"
}

variable "sku" {
  type        = string
  description = "A whole load of oddities occur around SKUs, see MS Docs for details"
}

variable "private_ip_address_allocation" {
  type        = string
  description = "private_ip_address_allocation in virtual network gateway"
}

variable "vnet_gateway_connection" {
  type        = string
  description = "vpn gateway connection name "
}

variable "connection_type" {
  type        = string
  description = "connection type in vpn gateway connection"
}

variable "shared_key" {
  type        = string
  description = "The shared IPSec key"
}
#--Storage Account

variable "storage_account_name" {
  type        = string
  description = "Resource Group Name"
}
variable "storage_account_tier" {
  type        = string
  description = "Storage Account Tier"
}
variable "storage_account_replication_type" {
  type        = string
  description = "Storage Account Replication Type"
}