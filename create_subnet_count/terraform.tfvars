create_resource_group = false
resource_group_name   = "rg"
location              = "East US"
tags = {
  Contact_name     = "ABC"
  Cost_Center      = "111"
  Application_name = "Dev"
}

subnets = [{
  private_endpoint_network_policies_enabled     = true
  private_link_service_network_policies_enabled = true
  service_endpoint_policy_ids                   = null
  subnet_address_prefixes                       = ["10.0.0.0/24"]
  subnet_delegation                             = {}
  subnet_name                                   = "s-1"
  subnet_service_endpoints                      = {}
  virtual_network_name                          = "v-1"
  },
  {
    private_endpoint_network_policies_enabled     = true
    private_link_service_network_policies_enabled = true
    service_endpoint_policy_ids                   = null
    subnet_address_prefixes                       = ["10.0.1.0/24"]
    subnet_delegation                             = {}
    subnet_name                                   = "s-2"
    subnet_service_endpoints                      = {}
    virtual_network_name                          = "v-1"
  },
  {
    private_endpoint_network_policies_enabled     = true
    private_link_service_network_policies_enabled = true
    service_endpoint_policy_ids                   = null
    subnet_address_prefixes                       = ["10.1.0.0/24"]
    subnet_delegation                             = {}
    subnet_name                                   = "s-1"
    subnet_service_endpoints                      = {}
    virtual_network_name                          = "v-2"
  },
  {
    private_endpoint_network_policies_enabled     = true
    private_link_service_network_policies_enabled = true
    service_endpoint_policy_ids                   = null
    subnet_address_prefixes                       = ["10.1.1.0/24"]
    subnet_delegation                             = {}
    subnet_name                                   = "s-2"
    subnet_service_endpoints                      = {}
    virtual_network_name                          = "v-2"
  },
  {
    private_endpoint_network_policies_enabled     = true
    private_link_service_network_policies_enabled = true
    service_endpoint_policy_ids                   = null
    subnet_address_prefixes                       = ["10.1.2.0/24"]
    subnet_delegation                             = {}
    subnet_name                                   = "s-3"
    subnet_service_endpoints                      = {}
    virtual_network_name                          = "v-2"
}]

