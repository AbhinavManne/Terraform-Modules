#Reference to subnet creation module
module "gateway_subnet" {
  source                       = "../../modules/module_gateway-subnet/gateway"
  create_resource_group        = var.create_resource_group
  resource_group_name          = var.resource_group_name
  location                     = var.location
  address_prefixes             = var.address_prefixes
  vnet_name                    = var.vnet_name
  address_space                = var.address_space
  dns_servers                  = var.dns_servers
  enable_ddos_protection_plan1 = var.enable_ddos_protection_plan1
  network_ddos_protection_plan = var.network_ddos_protection_plan
  firewall_name                = var.firewall_name
  threat_intel_mode            = var.threat_intel_mode
  ip_config                    = var.ip_config
  public_ip_name               = var.public_ip_name
  allocation_method            = var.allocation_method
  sku                          = var.sku
  tags                         = var.tags
}

module "subnet_monitoring" {
  source                  = "../../modules/module_gateway-subnet/diag_setting"
  resource_id             = module.gateway_subnet.vnet_id
  resource_group_name     = module.gateway_subnet.resource_group
  resource_group_id       = module.gateway_subnet.resource_group_id
  resource_group_location = module.gateway_subnet.resource_group_location


}

module "module_resource-role-assignment" {
  source               = "../../modules/module_gateway-subnet/rbac"
  resource_group_name  = module.gateway_subnet.resource_group
  scope                = module.gateway_subnet.vnet_id
  role_definition_name = var.role_definition_name

}