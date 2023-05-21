################################ Load Balancer ########################

variable "lb_name" {
  type        = string
  description = "(Required) Specifies the name of the Load Balancer."
}

variable "resource_group_name" {
  description = " (Required) The name of the Resource Group in which to create the Load Balancer."
  type        = string
}

variable "location" {
  description = "(Required) Specifies the supported Azure Region where the Load Balancer should be created."
  type        = string
}

variable "edge_zone" {
  description = "(Optional) Specifies the Edge Zone within the Azure Region where this Load Balancer should exist. Changing this forces a new Load Balancer to be created."
  type        = string
  default     = null
}

variable "frontend_ip_configuration" {
  description = "(Optional) One or multiple frontend_ip_configuration blocks as documented below. The optional values in case of the frontend ip configuration are zones, gateway_load_balancer_frontend_ip_configuration, private_ip_address_allocation, public_ip_address_id, public_ip_prefix_id for which null can be passed."
  type = map(object({
    name                                               = string,
    zones                                              = list(string),
    subnet_id                                          = string,
    gateway_load_balancer_frontend_ip_configuration_id = string,
    private_ip_address                                 = string,
    private_ip_address_allocation                      = string,
    private_ip_address_version                         = string,
    public_ip_address_id                               = string,
    public_ip_prefix_id                                = string
  }))
}

variable "lb_sku" {
  description = " (Optional) The SKU of the Azure Load Balancer. Accepted values are Basic, Standard and Gateway. Defaults to Basic."
  type        = string
  default     = "Basic"
}

variable "lb_sku_tier" {
  description = "(Optional) The SKU tier of this Load Balancer. Possible values are Global and Regional. Defaults to Regional. Changing this forces a new resource to be created."
  type        = string
  default     = "Regional"
}

variable "tags" {
  description = "(Optional) A mapping of tags to assign to the resource."
  type        = map(string)
  default     = {}
}

variable "public_load_balancer_required" {
  type        = bool
  description = "A boolean flag defining whether a public load balancer is required or private"
  default     = false
}

############################ Backend Address Pool #################################
variable "backend_address_pools_required" {
  description = "A boolean flag determining whether backend address pools are required or not"
  default     = false
  type        = bool
}

variable "backend_address_pools" {
  description = "Specifies the backend address pools which we can typically used for the load balancer. The optional values in case of the backend_addres_pool is backend_pool_tunnel_interface for which null can be passed."
  type = map(object({
    backend_pool_tunnel_interface = list(object({
      pool_identifier = number,
      pool_type       = string,
      pool_protocol   = string,
      pool_port       = string
    }))
  }))
  default = null
}

############################ Backend Address Pool Address #################################

variable "backend_address_pools_addresses_required" {
  description = "A boolean flag determining whether backend address pools addresses are required or not"
  type        = bool
  default     = false
}

variable "backend_address_pool_addresses" {
  description = "Specifies the backend address pool address which we can typically use for the load balancer. The optional values for backend_address_pool_addresses are backend_address_pool_address_ip_address, backend_address_pool_address_virtual_network_id, backend_address_pool_address_backend_address_ip_configuration_id for which null value can be passed."
  type = map(object({
    backend_address_pool_address_ip_address                          = string,
    backend_address_pool_address_virtual_network_id                  = string,
    backend_address_pool_address_backend_address_ip_configuration_id = string,
    backend_address_pool_address_backend_address_pool_id             = string
  }))
  default = null
}

########################  Load Balancing Probes  #########################

variable "probe_required" {
  description = "A boolean flag determining whether probe are required or not"
  type        = bool
  default     = false
}

variable "probes" {
  description = "Specifies the different health probes which can be attached to the resource. The optional values for probes are probe_request_path, probe_interval_in_seconds, number_of_probes, probe_protocol for which null value can be passed."
  type = map(object(
    {
      probe_port                = number,
      probe_request_path        = string,
      probe_interval_in_seconds = number,
      number_of_probes          = number
      probe_protocol            = string
    }
  ))
  default = null
}

########################  Load Balancing Rules  #########################

variable "load_balancing_rules_required" {
  description = "A boolean flag determining whether load balancing rules are required or not"
  type        = bool
  default     = false
}

variable "load_balancing_rules_file_path" {
  description = "The file path for the load balancing rules"
  type        = string
}

############################# Outbound Rule #################################

variable "outbound_rules_required" {
  description = "A boolean flag determining whether outbound rules are required or not"
  type        = bool
  default     = false
}

variable "outbound_rules_file_path" {
  description = "The file path for the outbound rules csv"
  type        = string
}

############################ Nat Pool #################################

variable "nat_pools_required" {
  description = "A boolean flag determining whether nat pools are required or not"
  type        = bool
  default     = false
}

variable "nat_pools" {
  description = "Specifies the nat pools which we can typically used for the load balancer. The optional values for nat_pools are lb_nat_pool_idle_timeout_in_minutes, lb_nat_pool_floating_ip_enabled, lb_nat_pool_tcp_reset_enabled for which null value can be passed."
  type = map(object({
    lb_nat_pool_protocol                       = string,
    lb_nat_pool_frontend_port_start            = number,
    lb_nat_pool_frontend_port_end              = number,
    lb_nat_pool_backend_port                   = number,
    lb_nat_pool_idle_timeout_in_minutes        = number,
    lb_nat_pool_floating_ip_enabled            = bool,
    lb_nat_pool_tcp_reset_enabled              = bool,
    lb_nat_pool_frontend_ip_configuration_name = string
  }))
  default = null
}

############################ Nat Rule #################################
variable "nat_rules_required" {
  description = "A boolean flag determining whether nat rules required or not"
  type        = bool
  default     = false
}

variable "nat_rules_file_path" {
  description = "The file path for the nat rules csv"
  type        = string
}

variable "use_nat_rules_frontend_port" {
  description = "The nat rules are getting picked up from csv file. When utilizing the frontend port, not the frontend port start and end set this variable to true so that value can be picked up from csv."
  type        = bool
  default     = false
}

variable "use_nat_rules_frontend_range" {
  description = "The nat rules are getting picked up from csv file. When utilizing the frontend start and end, not the frontend port set this variable to true so that value can be picked up from csv."
  type        = bool
  default     = false
}





