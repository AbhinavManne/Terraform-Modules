point_to_site_vpn_gateway       = "point_to_site_vpn_gateway"
location                        = "East US"
resource_group_name             = "rg1"
virtual_hub_id                  = "/subscriptions/bd294e0d-a549-4b26-9787-5daa46f7dc35/resourceGroups/rg1/providers/Microsoft.Network/virtualHubs/vh"
vpn_server_configuration_id     = "/subscriptions/bd294e0d-a549-4b26-9787-5daa46f7dc35/resourceGroups/rg1/providers/Microsoft.Network/virtualNetworkGateways/cilvng"
scale_unit                      = 1
#vpn_client_address_pool        = ["10.0.2.0/24"]
address_prefixes                = ["10.0.2.0/24"]
internet_security_enabled       = false
#enable_route                    = true
associated_route_table_id       = null
propagated_route_table          = true
propagated_route_table_ids      = null
propagated_route_table_labels   = null
#vpn_server                      = []
vpn_server_configuration        = "cilvng"
vpn_authentication_types        = []
#client_root_certificate         = []
#public_cert_data                = []


connection_configuration        = "cn"

tags = {
  Contact_name     = "ABC"
  Cost_Center      = "111"
  Application_name = "Dev"

}
