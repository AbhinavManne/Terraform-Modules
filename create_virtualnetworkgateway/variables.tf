variable "resource_group_name" {
  type        = string
  description = "RG name in Azure"
}

variable "location" {
  type        = string
  description = "RG location in Azure"
}

#----VARIABLES: VIRTUAL NETWORK GATEWAY RESOURCE----#
variable "virtual_network_gateway_name" {
  type        = string
  description = "The name of the Virtual Network Gateway."
}

variable "virtual_network_gateway_type" {
  type        = string
  description = "The type of the Virtual Network Gateway. Valid options are Vpn or ExpressRoute."
}

variable "virtual_network_gateway_active_active" {
  type        = bool
  description = " If true, an active-active Virtual Network Gateway will be created. An active-active gateway requires a HighPerformance or an UltraPerformance SKU. If false, an active-standby gateway will be created. Defaults to false."
  default     = false
}

variable "virtual_network_gateway_sku" {
  type        = string
  description = "Configuration of the size and capacity of the virtual network gateway. Valid options are Basic, Standard, HighPerformance, UltraPerformance, ErGw1AZ, ErGw2AZ, ErGw3AZ, VpnGw1, VpnGw2, VpnGw3, VpnGw4,VpnGw5, VpnGw1AZ, VpnGw2AZ, VpnGw3AZ,VpnGw4AZ and VpnGw5AZ and depend on the type, vpn_type and generation arguments. A PolicyBased gateway only supports the Basic SKU. Further, the UltraPerformance SKU is only supported by an ExpressRoute gateway."
}

variable "default_local_network_gateway_id" {
  type        = string
  description = "The ID of the local network gateway through which outbound Internet traffic from the virtual network in which the gateway is created will be routed (forced tunnelling)."
  default     = null
}

variable "virtual_network_gateway_edge_zone" {
  type        = string
  description = "Specifies the Edge Zone within the Azure Region where this Virtual Network Gateway should exist. Changing this forces a new Virtual Network Gateway to be created."
  default     = null
}

variable "virtual_network_gateway_enable_bgp" {
  type        = bool
  description = "If true, BGP (Border Gateway Protocol) will be enabled for this Virtual Network Gateway. Defaults to false."
  default     = false
}

variable "virtual_network_gateway_generation" {
  type        = string
  description = " The Generation of the Virtual Network gateway. Possible values include Generation1, Generation2 or None."
  default     = "None"
}

variable "private_ip_address_enabled" {
  type        = bool
  description = "Should private IP be enabled on this gateway for connections? Changing this forces a new resource to be created."
  default     = false
}

variable "virtual_network_gateway_vpn_type" {
  type        = string
  description = " The routing type of the Virtual Network Gateway. Valid options are RouteBased or PolicyBased."
  default     = "RouteBased"
}

variable "ip_configuration_name" {
  type        = string
  description = "A user-defined name of the IP configuration. Defaults to vnetGatewayConfig."
  default     = "vnetGatewayConfig"
}

variable "ip_configuration_pip_addalloc" {
  type        = string
  description = "Defines how the private IP address of the gateways virtual interface is assigned. Valid options are Static or Dynamic. Defaults to Dynamic."
  default     = "Dynamic"
}

variable "ip_configuration_pip_id" {
  type        = string
  description = "The ID of the public IP address to associate with the Virtual Network Gateway."
}

variable "ip_configuration_subnet_id" {
  type        = string
  description = " The ID of the gateway subnet of a virtual network in which the virtual network gateway will be created. It is mandatory that the associated subnet is named GatewaySubnet. Therefore, each virtual network can contain at most a single Virtual Network Gateway."
}

variable "vnet_gateway_ip_configuration" {
  type = list(object({
    name                          = string
    public_ip_address_id          = string
    private_ip_address_allocation = string
    subnet_id                     = string
  }))
  description = "One, two or three ip_configuration blocks documented below. An active-standby gateway requires exactly one ip_configuration block, an active-active gateway requires exactly two ip_configuration blocks whereas an active-active zone redundant gateway with P2S configuration requires exactly three ip_configuration blocks."
  validation {
    condition     = length(var.vnet_gateway_ip_configuration) < 3
    error_message = "One, two or three ip_configuration blocks can be specified, not more than that."
  }
}

variable "bgp_settings" {
  type = list(object({
    asn         = string
    peer_weight = string
    peering_addresses = list(object({
      ip_configuration_name = string
      apipa_addresses       = list(string)
    }))
  }))
  description = "In this block the BGP specific settings can be defined."
  default     = null
}

variable "vpn_client_configuration" {
  type = list(object({
    address_space         = list(string)
    aad_tenant            = string
    aad_audience          = string
    aad_issuer            = string
    radius_server_address = string
    radius_server_secret  = string
    vpn_client_protocols  = list(string)
    vpn_auth_types        = list(string)
    revoked_certificate = list(object({
      name       = string
      thumbprint = string
    }))
    root_certificate = list(object({
      name             = string
      public_cert_data = string
    }))
  }))
  description = "In this block the Virtual Network Gateway can be configured to accept IPSec point-to-site connections."
  default     = null
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resource."
}


#----VARIABLES:MODULE: ALERTS ----#
variable "storage_account_id" {
  type        = string
  description = "Reading Storage account ID "
}

variable "action_group_name" {
  type        = string
  description = "The name of the Action Group. Changing this forces a new resource to be created. "
}

variable "short_name" {
  type        = string
  description = "The short name of the action group. "
}

variable "action_group_rule_name" {
  type        = string
  description = "Specifies the name of the Monitor Action Rule. Changing this forces a new resource to be created. "
}

variable "scope_type" {
  type        = string
  description = "Specifies the type of target scope. Possible values are ResourceGroup and Resource "
}

variable "activity_log_alert_name" {
  type        = string
  description = "The name of the activity log alert. Changing this forces a new resource to be created. "
}

variable "resource_group_id" {
  type        = string
  description = "Resource group ID "
}

variable "operation_name_log_alert" {
  type        = string
  description = "The Resource Manager Role-Based Access Control operation name. Supported operation should be of the form: <resourceProvider>/<resourceType>/<operation> "
}

variable "category_log_alert" {
  type        = string
  description = "The category of the operation. Possible values are Administrative, Autoscale, Policy, Recommendation, ResourceHealth, Security and ServiceHealth "
}

variable "metric_alert_name" {
  type        = string
  description = "The name of the Metric Alert. Changing this forces a new resource to be created "
}

variable "metric_namespace" {
  type        = string
  description = "One of the metric namespaces to be monitored. "
}

variable "metric_name" {
  type        = string
  description = "One of the metric names to be monitored. "
}

variable "aggregation" {
  type        = string
  description = "The statistic that runs over the metric values. Possible values are Average, Count, Minimum, Maximum and Total. "
}

variable "operator" {
  type        = string
  description = "The criteria operator. Possible values are Equals, NotEquals, GreaterThan, GreaterThanOrEqual, LessThan and LessThanOrEqual. "
}

variable "threshold" {
  type        = number
  description = "The criteria threshold value that activates the alert "
}

variable "dimension_name" {
  type        = string
  description = "One of the dimension names "
}

variable "dimension_operator" {
  type        = string
  description = "The dimension operator. Possible values are Include, Exclude and StartsWith. "
}

variable "values" {
  type        = list(string)
  description = "The list of dimension values. "
}