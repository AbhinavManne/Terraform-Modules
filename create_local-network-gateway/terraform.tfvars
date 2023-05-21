create_resource_group      = false
resource_group_name        = "rg"
location                   = "east us"
local_network_gateway_name = "ln1"
address_space              = ["10.0.0.0/16"]
gateway_address            = "12.13.14.15"
gateway_fqdn               = null

tags = {
  Contact_name     = "ABC"
  Cost_Center      = "111"
  Application_name = "local network gateway"
}
