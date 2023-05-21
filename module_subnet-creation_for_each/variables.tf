variable "resource_group_name" {
  type        = string
  description = "The name of the resource group in which to create the virtual network."
}

variable "subnets" {
  type = map(object({
    virtual_network_name                          = string
    subnet_name                                   = string
    subnet_address_prefixes                       = list(string)
    subnet_service_endpoints                      = list(string)
    private_endpoint_network_policies_enabled     = bool
    private_link_service_network_policies_enabled = bool
    service_endpoint_policy_ids                   = list(string)
    subnet_delegation = map(object({
      service_name    = string
      service_actions = list(string)
    }))
  }))
  description = "List of object in which user have to define the detailes of Subnets."
}

