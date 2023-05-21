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
  description = "Resource group location"
}

#--------------------------------------------Network Interface variables-----------------------------------------------

variable "network_interface_name" {
  type        = string
  description = "Network interface name in Azure"
}

variable "dns_servers" {
  type        = list(string)
  description = "dns servers"
}

variable "edge_zone" {
  type        = string
  description = "It specifies the Edge Zone, where this Network Interface should exist"
}

variable "enable_ip_forwarding" {
  type        = bool
  description = "Should IP Forwarding be enabled?"
}
variable "enable_accelerated_networking" {
  type        = bool
  description = "Should Accelerated Networking be enabled?"
}
variable "internal_dns_name_label" {
  type        = string
  description = "The (relative) DNS Name used for internal communications between Virtual Machines in the same Virtual Network."
}
variable "tags" {
  type        = map(any)
  description = "tags for the resource"
}

############### IP Configuration ############
variable "ip_configuration" {
  type = map(object({
    ip_configuration_name                              = string
    gateway_load_balancer_frontend_ip_configuration_id = string
    subnet_id                                          = string
    private_ip_address_version                         = string
    private_ip_address_allocation                      = string
    public_ip_address_id                               = string
    primary                                            = bool
    private_ip_address                                 = string
  }))
  description = "ip configuration block"
}
