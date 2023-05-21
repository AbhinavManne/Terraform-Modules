

peerings = [
  { //  for same region
    source = {
      vnet_name                    = "vnet-1",
      resource_group_name          = "rg",
      vnet_id                      = "/subscriptions/60d38622-38ad-40a0-984a-3f7ac52dd133/resourceGroups/rg/providers/Microsoft.Network/virtualNetworks/vnet-2"
      allow_virtual_network_access = true,
      allow_forwarded_traffic      = false,
      allow_gateway_transit        = false,
      use_remote_gateways          = false,
    },
    destination = {
      vnet_name                    = "vnet-2",
      resource_group_name          = "rg",
      vnet_id                      = "/subscriptions/60d38622-38ad-40a0-984a-3f7ac52dd133/resourceGroups/rg/providers/Microsoft.Network/virtualNetworks/vnet-1"
      allow_virtual_network_access = true,
      allow_forwarded_traffic      = false,
      allow_gateway_transit        = false,
      use_remote_gateways          = false,
    }
  },
  { //  for different region 
    source = {
      vnet_name                    = "vnet-1",
      resource_group_name          = "rg",
      vnet_id                      = "/subscriptions/60d38622-38ad-40a0-984a-3f7ac52dd133/resourceGroups/rg-test/providers/Microsoft.Network/virtualNetworks/vnet-3"
      allow_virtual_network_access = true,
      allow_forwarded_traffic      = false,
      allow_gateway_transit        = false,
      use_remote_gateways          = false,
    },
    destination = {
      vnet_name                    = "vnet-3",
      resource_group_name          = "rg-test",
      vnet_id                      = "/subscriptions/60d38622-38ad-40a0-984a-3f7ac52dd133/resourceGroups/rg/providers/Microsoft.Network/virtualNetworks/vnet-1"
      allow_virtual_network_access = true,
      allow_forwarded_traffic      = false,
      allow_gateway_transit        = false,
      use_remote_gateways          = false,
    }
  }
]
