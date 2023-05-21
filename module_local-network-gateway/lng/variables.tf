#-----------------------------Resource Group---------------------------------
variable "resource_group_name" {
  type        = string
  description = "Resource group name"
}

#-----------------------------Local Network Gateway--------------------------
variable "location" {
  type        = string
  description = "Location where the local network gateway is created"
}

variable "local_network_gateway_name" {
  type        = string
  description = "The name of the local network gateway "
}

variable "address_space" {
  type        = list(string)
  description = "list of string CIDRs representing the address spaces the gateway exposes"
  default     = null
}

variable "gateway_address" {
  type        = string
  description = "The gateway IP address to connect with"
  default     = null
}

variable "gateway_fqdn" {
  type        = string
  description = "The gateway FQDN to connect with"
  default     = null
}


variable "tags" {
  type        = map(any)
  description = "Tags for the resource"
}


variable "bgp_settings" {
  type = list(object({
    asn                 = string
    bgp_peering_address = string
    peer_weight         = string
  }))
  description = "bgp settings block"
  default     = null
}