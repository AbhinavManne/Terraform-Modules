################################ Resource Group ###############################

create_resource_group = false
resource_group_name   = "rg"
location              = "East US"

############################## Network Interface ##############################
network_interface_name        = "example-nic"
dns_servers                   = ["10.0.0.2", "10.0.0.3"]
edge_zone                     = null
enable_ip_forwarding          = false
enable_accelerated_networking = true
internal_dns_name_label       = null
tags = {
  "Contact_person" : "abc"
  "cost_center" : 999
  "Application Name" : "Network Interface"
}

ip_configuration = {
  "key" = {
    gateway_load_balancer_frontend_ip_configuration_id = null
    ip_configuration_name                              = "internal"
    primary                                            = true
    private_ip_address                                 = "10.11.12.13"
    private_ip_address_allocation                      = "Dynamic"
    private_ip_address_version                         = "IPv4"
    public_ip_address_id                               = null
    subnet_id                                          = "/subscriptions/b325a432-99f2-46b9-99a4-f74d01446503/resourceGroups/rg/providers/Microsoft.Network/virtualNetworks/demo_vnet/subnets/default"
  }
}
/*
ip_configuration = {
  ip_configuration_name                              = "internal"
  gateway_load_balancer_frontend_ip_configuration_id = null
  subnet_id                                          = "/subscriptions/b325a432-99f2-46b9-99a4-f74d01446503/resourceGroups/demo_rg/providers/Microsoft.Network/virtualNetworks/demo_vnet/subnets/default"
  private_ip_address_version                         = "IPv4"
  private_ip_address_allocation                      = "Dynamic"
  public_ip_address_id                               = null
  primary                                            = true
  private_ip_address                                 = "10.11.12.13"
}
*/

