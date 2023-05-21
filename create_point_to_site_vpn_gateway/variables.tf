variable "resource_group_name" {
  type        = string
  description = "RG name in Azure"
}

variable "point_to_site_vpn_gateway" {
  type = string
  description = "Specifies the name of the Point-to-Site VPN Gateway"
}

variable "location" {
  type = string
  description = "Specifies the supported Azure location where the resource exists"
}

variable "connection_configuration" {
  type = string
  description = "The Name which should be used for this Connection Configuration name"
}

variable "tags" {
  type = map(string)
  description = "A mapping of tags to assign to the Point-to-Site VPN Gateway"
  default = null
    
  
}

variable "scale_unit" {
  type = number
  description = "The Scale Unit for this Point-to-Site VPN Gateway"
}

variable "virtual_hub_id" {
  type = string
  description = "The ID of the Virtual Hub where this Point-to-Site VPN Gateway should exist"
}

variable "vpn_server_configuration_id" {
  type = string
  description = "The ID of the VPN Server Configuration which this Point-to-Site VPN Gateway should use"
  default = null
}

variable "vpn_server_configuration" {
  type = string
  description = "The name of vpn server configuration"
}

variable "vpn_authentication_types" {
  type = list(string)
  description = "The name of vpn authentication types"
}

#variable "client_root_certificate" {
 # type = number
  #description = "The name of client root certificate"
#}

#variable "public_cert_data" {
 # type = number
  #description = "The name of public certification data"
#}

variable "address_prefixes" {
  type = list(string)
  description = "A list of CIDR Ranges which should be used as Address Prefixes"
}

variable "internet_security_enabled" {
  type = bool
  description = "Should Internet Security be enabled to secure internet traffic? Changing this forces a new resource to be created. Defaults to false."
  default = false
}

#variable "enable_route" {
 # type        = bool
 # description = "Whether to enable route block"
#}

variable "associated_route_table_id" {
  type = string
  description = "The Virtual Hub Route Table resource id associated with this Routing Configuration."
  
}

variable "propagated_route_table" {
  type        = bool
  description = "Whether to enable propagated route table block"
}

variable "propagated_route_table_ids" {
  type = list(string)
  description = "The list of Virtual Hub Route Table resource id which the routes will be propagated to."
  
}

variable "propagated_route_table_labels" {
  type = set(string)
  description = "The list of labels to logically group Virtual Hub Route Tables which the routes will be propagated to."
  default = null
  }
