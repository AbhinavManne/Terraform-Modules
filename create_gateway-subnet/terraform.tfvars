vnet_name                    = "vnet1"
address_space                = ["10.0.0.0/16"]
address_prefixes             = ["10.0.1.0/24"]
enable_ddos_protection_plan1 = "true"
create_resource_group        = false
resource_group_name          = "rg"
location                     = "east us"

network_ddos_protection_plan = "my_protection_plan"
public_ip_name               = "my_public_ip"
allocation_method            = "Static"
sku                          = "Standard"
dns_servers                  = []
role_definition_name = [ "Reader" ]
ip_config         = "Configuration"
firewall_name     = "my_firewall"
threat_intel_mode = "Alert"
tags = {
  Contact_name     = "ABC"
  Cost_Center      = "999"
  Application_name = "Gateway Subnet"
}
