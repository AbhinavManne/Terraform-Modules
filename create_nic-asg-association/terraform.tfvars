resource_group_name           = "rg"
location                      = "east us"
create_resource_group         = false
application_security_group    = "tf-appsecuritygroup"
network_interface             = "example-nic"
vnet_name                     = "vnet"
subnet_name                   = "sub567"
address_prefixes              = ["10.0.2.0/24"]
address_space                 = ["10.0.0.0/16"]
ip_configuration              = "testconfiguration1"
private_ip_address_allocation = "Dynamic"
role_definition_name          = ["Reader"]
tags = {
  Contact_name     = "Nikita"
  Cost_Center      = 999
  Application_name = "application security grp"
}