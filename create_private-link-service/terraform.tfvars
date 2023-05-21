
  resource_group_name                         = "azure_terraform"
  private_link_service                        = "link_service"
  location                                    = "East US"
  auto_approval_subscription_ids              = null
  enable_proxy_protocol                       = false
  fqdns                                       = null
  visibility_subscription_ids                 = null
  load_balancer_frontend_ip_configuration_ids = ["/subscriptions/e2ba095a-ad02-4bf7-8c39-7b0998af0ca3/resourceGroups/azure_terraform/providers/Microsoft.Network/loadBalancers/load_balancer_terraform/frontendIPConfigurations/frontend_ip"]
  tags = {
  Contact_name     = "ABC"
  Cost_Center      = "111"
  Application_name = "Dev" 
  }
  nat_ip_configuration                        = "nat_ip"
  private_ip_address                          = null
  private_ip_address_version                  = "IPv4"
  subnet_id                                   = "/subscriptions/e2ba095a-ad02-4bf7-8c39-7b0998af0ca3/resourceGroups/azure_terraform/providers/Microsoft.Network/virtualNetworks/virtual_network/subnets/default"
  primary                                     = false
  

