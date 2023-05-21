#--------------------------------------------Resource group variables-----------------------------------------------

variable "resource_group_name" {
  type        = string
  description = "resource group name in Azure"
}

variable "location" {
  type        = string
  description = "resource group location in Azure"
}

#--------------------------------------------Network Interface variables-----------------------------------------------

variable "network_interface_name" {
  type        = string
  description = "Network interface name in Azure"
}

variable "dns_servers" {
  type        = list(string)
  description = "dns servers"
  default     = ["10.0.0.2", "10.0.0.3"]
}

variable "edge_zone" {
  type        = string
  description = "It specifies the Edge Zone, where this Network Interface should exist"
  default     = null
}

variable "enable_ip_forwarding" {
  type        = bool
  description = "Should IP Forwarding be enabled?"
  default     = false
}

variable "enable_accelerated_networking" {
  type        = bool
  description = "Should Accelerated Networking be enabled?"
  default     = false
}

variable "internal_dns_name_label" {
  type        = string
  description = "The (relative) DNS Name used for internal communications between Virtual Machines in the same Virtual Network."
  default     = null
}

variable "tags" {
  type        = map(any)
  description = "tags for the resource"
}

#---------------- IP Configuration ------------------
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
  description = "ip configuration block. Here, Optional Arguments are: gateway_load_balancer_frontend_ip_configuration_id, private_ip_address_version, public_ip_address_id, primary, and private_ip_address"
}

