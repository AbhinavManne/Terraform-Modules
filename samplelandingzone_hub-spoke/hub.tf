locals {
  hubSubnetNames = ["GatewaySubnet", "AzureFirewallSubnet"]
  publicIpNames  = ["hub-vpn-gateway-pip", "hub-firewall-pip"]
}

#Reference to resource group creation module
module "module_create_hub_resource_group" {
  source              = "../../modules/module_resource-group-creation"
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
}

//add nsg confirm on this

#Reference to virtual network creation module
module "module_create_hub_virtual_network" {
  source = "../../modules/module_virtual-network-creation"
  depends_on = [
    module.module_create_hub_resource_group
  ]
  resource_group_name           = var.resource_group_name
  virtual_network_name          = var.hub_virtual_network_name
  virtual_network_address_space = var.hub_virtual_network_address_space
}

#Reference to subnet creation module
module "module_create_hub_subnet" {
  count  = length(local.hubSubnetNames)
  source = "../../modules/module_subnet-creation"
  depends_on = [
    module.module_create_hub_virtual_network
  ]
  resource_group_name     = var.resource_group_name
  virtual_network_name    = var.hub_virtual_network_name
  subnet_name             = local.hubSubnetNames[count.index]
  subnet_address_prefixes = count.index == 0 ? var.gateway_subnet_address_prefixes : var.firewall_subnet_address_prefixes
}

#Reference to resource group creation module
module "public_ip_module" {
  count  = length(local.publicIpNames)
  source = "../../modules/module_public-ip-creation"
  depends_on = [
    module.module_create_hub_resource_group
  ]
  resource_group_name         = var.resource_group_name
  public_ip_name              = local.publicIpNames[count.index]
  public_ip_sku               = var.public_ip_sku
  public_ip_allocation_method = var.public_ip_allocation_method
}

#Reference to virtual network gateway creation module
module "virtualnetworkgateway_module" {
  source = "../../modules/module_virtualnetworkgateway"
  depends_on = [
    module.public_ip_module, module.module_create_hub_subnet
  ]
  rg_name                    = var.resource_group_name
  public_ip_name             = local.publicIpNames[0]
  vnet_name                  = var.hub_virtual_network_name
  subnet_name                = local.hubSubnetNames[0]
  virtualnetworkgateway_name = var.virtualnetworkgateway_name
}

#Reference to azure firewall creation module
module "firewall_module" {
  source = "../../modules/module_firewall"
  depends_on = [
    module.public_ip_module, module.module_create_hub_subnet
  ]
  rg_name        = var.resource_group_name
  vnet_name      = var.hub_virtual_network_name
  subnet_name    = local.hubSubnetNames[1]
  public_ip_name = local.publicIpNames[1]
  firewall_name  = var.firewall_name
}

#Reference to firewall application rules module
module "firewall-Applicationrules_module" {
  source = "../../modules/module_firewall-Applicationrules"
  depends_on = [
    module.firewall_module
  ]
  rg_name       = var.resource_group_name
  firewall_name = var.firewall_name
}

#Reference to firewall NAT rules module
module "firewall-NATrules_module" {
  source = "../../modules/module_firewall-NATrules"
  depends_on = [
    module.firewall_module
  ]
  rg_name        = var.resource_group_name
  firewall_name  = var.firewall_name
  public_ip_name = local.publicIpNames[1]
}

#Reference to firewall network rules module
module "firewall-Networkrules_module" {
  source = "../../modules/module_firewall-Networkrules"
  depends_on = [
    module.firewall_module
  ]
  rg_name       = var.resource_group_name
  firewall_name = var.firewall_name
}


# #Reference to network interface creation module
# module "networkinterface_module" {
#   source = "../../modules/module_networkinterface"
#   rg_name               = var.rg_name
#   rg_location           = var.rg_location
#   vnet_name             = var.vnet_name
#   subnet_name           = var.subnet_name
#   networkinterface_name = var.networkinterface_name
# }