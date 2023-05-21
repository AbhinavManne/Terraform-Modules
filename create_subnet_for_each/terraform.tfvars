create_resource_group = false
resource_group_name   = "rg"
location              = "East US"
tags = {
  Contact_name     = "ABC"
  Cost_Center      = "111"
  Application_name = "Dev"
}

subnets = {
  "s-1_v-1" = {
    private_endpoint_network_policies_enabled     = true
    private_link_service_network_policies_enabled = true
    subnet_address_prefixes                       = ["10.0.0.0/24"]
    subnet_name                                   = "s-1"
    service_endpoint_policy_ids                   = null
    subnet_delegation                             = {}
    subnet_service_endpoints                      = null
    virtual_network_name                          = "v-1"
  },
  "s-3_v-1" = {
    private_endpoint_network_policies_enabled     = true
    private_link_service_network_policies_enabled = true
    subnet_address_prefixes                       = ["10.0.2.0/24"]
    subnet_name                                   = "s-3"
    service_endpoint_policy_ids                   = null
    subnet_delegation                             = {}
    subnet_service_endpoints                      = null
    virtual_network_name                          = "v-1"
  },
  "s-2_v-1" = {
    private_endpoint_network_policies_enabled     = true
    private_link_service_network_policies_enabled = true
    subnet_address_prefixes                       = ["10.0.1.0/24"]
    subnet_name                                   = "s-2"
    service_endpoint_policy_ids                   = null
    subnet_delegation                             = {}
    subnet_service_endpoints                      = null
    virtual_network_name                          = "v-1"
  },
  "s-1_v-2" = {
    private_endpoint_network_policies_enabled     = true
    private_link_service_network_policies_enabled = true
    subnet_address_prefixes                       = ["10.1.0.0/24"]
    subnet_name                                   = "s-1"
    service_endpoint_policy_ids                   = null
    subnet_delegation                             = {}
    subnet_service_endpoints                      = null
    virtual_network_name                          = "v-2"
  },
  "s-3_v-2" = {
    private_endpoint_network_policies_enabled     = true
    private_link_service_network_policies_enabled = true
    subnet_address_prefixes                       = ["10.1.2.0/24"]
    subnet_name                                   = "s-3"
    service_endpoint_policy_ids                   = null
    subnet_delegation                             = {}
    subnet_service_endpoints                      = null
    virtual_network_name                          = "v-2"
  }
  "s-2_v-2" = {
    private_endpoint_network_policies_enabled     = true
    private_link_service_network_policies_enabled = true
    subnet_address_prefixes                       = ["10.1.1.0/24"]
    subnet_name                                   = "s-2"
    service_endpoint_policy_ids                   = null
    subnet_delegation                             = {}
    subnet_service_endpoints                      = null
    virtual_network_name                          = "v-2"
  },

}

