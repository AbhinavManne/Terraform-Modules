resource_group_name     = "rg"
create_resource_group   = false
location                = "east us"
nat_gateway_name        = "nat-Gateway01"
sku_name                = "Standard"
idle_timeout_in_minutes = 10
zones                   = ["1"]
tags = {
  Application_Name = "NAT-gateway"
  Owner            = "abc"
  Cost_Center      = 9999
}
nat_gateway_public_ip_name = "NatGateway-Public-ip"
allocation_method          = "Static"
sku                        = "Standard"
public_ip_prefix_id        = "/subscriptions/b325a432-99f2-46b9-99a4-f74d01446503/resourcegroups/rg/providers/Microsoft.Network/publicIPPrefixes/test-ip-prefix"
subnet_id                  = ["/subscriptions/b325a432-99f2-46b9-99a4-f74d01446503/resourceGroups/rg/providers/Microsoft.Network/virtualNetworks/demo_vnet/subnets/default","/subscriptions/b325a432-99f2-46b9-99a4-f74d01446503/resourceGroups/rg/providers/Microsoft.Network/virtualNetworks/demo_vnet/subnets/test1"]

