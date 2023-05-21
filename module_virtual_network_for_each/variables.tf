variable "location" {
  type        = string
  description = "The location/region where the virtual network is created. Changing this forces a new resource to be created."
}
variable "resource_group_name" {
  type        = string
  description = "The name of the resource group in which to create the virtual network."
}
variable "vnet" {
  type = map(object({
    virtual_network_address_space = list(string)
    bgp_community                 = string
    dns_servers                   = list(string)
    edge_zone                     = string
    flow_timeout_in_minutes       = string
    enable_ddos_protection_plan   = bool
    id_of_ddos_protection_plan    = string
    virtual_network_tags          = map(string)
  }))
  description = "Details of Virtual Network."
}