variable "rg" {
  type        = string
  description = "RG name in Azure"
}
variable "rg1" {
  type        = string
  description = "RG name in Azure"
  default = null
}
variable "location" {
  type        = string
  description = "RG location in Azure"
}
variable "tags" {
  type        = map(string)
  description = "The tags to associate with the resource."
}
variable "vnet1_to_vnet2" {
  type        = string
  description = "Gatewayconnection name in Azure"
}
variable "shared_key" {
  type        = string
  description = "Gatewayconnection name in Azure"
  default     = "null"
}
variable "peer_virtual_network_gateway_id" {
  type        = string
  description = "peer_virtual_network_gateway_id "
}
variable "virtual_network_gateway_id" {
  type        = string
  description = "Gatewayconnection name in Azure"
}
variable "type" {
  type        = string
  description = "type of connection"
}
variable "vnet2_to_vnet1" {
  type        = string
  description = "name of connection"
  default = null
}


variable "authorization_key" {
  type        = string
  description = "The authorization key associated with the Express Route Circuit. This field is required only if the type is an ExpressRoute connection."
  default     = null
}

variable "dpd_timeout_seconds" {
  type        = number
  description = "The dead peer detection timeout of this connection in seconds. Changing this forces a new resource to be created."
  default     = null
}
variable "express_route_circuit_id" {
  type        = string
  description = "The ID of the Express Route Circuit when creating an ExpressRoute connection (i.e. when type is ExpressRoute). The Express Route Circuit can be in the same or in a different subscription."
  default     = null
}
variable "local_azure_ip_address_enabled" {
  type        = bool
  description = "Use private local Azure IP for the connection. Changing this forces a new resource to be created."
  default     = false
}
variable "local_network_gateway_id" {
  type        = string
  description = "The ID of the local network gateway when creating Site-to-Site connection (i.e. when type is IPsec)."
  default     = null
}
variable "routing_weight" {
  type        = number
  description = "The routing weight. Defaults to 10"
  default     = 10
}
variable "connection_mode" {
  type        = string
  description = "Connection mode to use. Possible values are Default, InitiatorOnly and ResponderOnly. Defaults to Default. Changing this value will force a resource to be created."
  default     = "default"
}
variable "connection_protocol" {
  type        = string
  description = "The IKE protocol version to use. Possible values are IKEv1 and IKEv2. Defaults to IKEv2. Changing this value will force a resource to be created. -> Note: Only valid for IPSec connections on virtual network gateways with SKU VpnGw1, VpnGw2, VpnGw3, VpnGw1AZ, VpnGw2AZ or VpnGw3AZ."
  default     = null
}
variable "enable_bgp" {
  type        = bool
  description = "If true, BGP (Border Gateway Protocol) is enabled for this connection. Defaults to false"
  default     = false
}
variable "custom_bgp_addresses" {
  type        = list(string)
  description = "custom_bgp_addresses"
  default     = null
}
variable "express_route_gateway_bypass" {
  type        = bool
  description = "If true, data packets will bypass ExpressRoute Gateway for data forwarding This is only valid for ExpressRoute connections."
  default     = false
}
variable "egress_nat_rule_ids" {
  type        = list(string)
  description = "A list of the egress NAT Rule Ids."
  default     = null
}
variable "ingress_nat_rule_ids" {
  type        = list(string)
  description = "A list of the ingress NAT Rule Ids."
  default     = null
}
variable "use_policy_based_traffic_selectors" {
  type        = bool
  description = "If true, policy-based traffic selectors are enabled for this connection. Enabling policy-based traffic selectors requires an ipsec_policy block. Defaults to false"
  default     = false
}
variable "ipsec_policy" {
  type        = string
  description = "A ipsec_policy block which is documented below. Only a single policy can be defined for a connection. For details on custom policies refer to the relevant section in the Azure documentation."
  default     = null
}
variable "dh_group" {
  type        = string
  description = "The DH group used in IKE phase 1 for initial SA. Valid options are DHGroup1, DHGroup14, DHGroup2, DHGroup2048, DHGroup24, ECP256, ECP384, or None."

}
variable "ike_encryption" {
  type        = string
  description = "The IKE encryption algorithm. Valid options are AES128, AES192, AES256, DES, DES3, GCMAES128, or GCMAES256."

}
variable "ike_integrity" {
  type        = string
  description = "The IKE integrity algorithm. Valid options are GCMAES128, GCMAES256, MD5, SHA1, SHA256, or SHA384."

}
variable "ipsec_encryption" {
  type        = string
  description = "The IPSec encryption algorithm. Valid options are AES128, AES192, AES256, DES, DES3, GCMAES128, GCMAES192, GCMAES256, or None."

}
variable "ipsec_integrity" {
  type        = string
  description = "The IPSec integrity algorithm. Valid options are GCMAES128, GCMAES192, GCMAES256, MD5, SHA1, or SHA256."

}
variable "pfs_group" {
  type        = string
  description = "The DH group used in IKE phase 2 for new child SA. Valid options are ECP256, ECP384, PFS1, PFS14, PFS2, PFS2048, PFS24, PFSMM, or None."

}
variable "sa_datasize" {
  type        = string
  description = "The IPSec SA payload size in KB. Must be at least 1024 KB. Defaults to 102400000 KB."

}
variable "sa_lifetime" {
  type        = string
  description = "The IPSec SA lifetime in seconds. Must be at least 300 seconds. Defaults to 27000 seconds."

}
variable "traffic_selector_policy" {
  type        = string
  description = "One or more traffic_selector_policy blocks which are documented below. A traffic_selector_policy allows to specify a traffic selector policy proposal to be used in a virtual network gateway connection."
  default     = null
}
variable "local_address_cidrs" {
  type        = list(string)
  description = "List of local CIDRs"
  default     = null
}
variable "remote_address_cidrs" {
  type        = list(string)
  description = " List of remote CIDRs."
  default     = null
}
variable "primary" {
  type        = string
  description = "single IP address that is part of the azurerm_virtual_network_gateway ip_configuration (first one)"
  default     = null
}
variable "secondary" {
  type        = string
  description = "single IP address that is part of the azurerm_virtual_network_gateway ip_configuration (second one)"
  default     = null
}
variable "location1" {
  type        = string
  description = "location of second rg"
  default     = null
}

