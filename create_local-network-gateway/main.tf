module "local_network_gateway" {
  source                     = "../../modules/module_local-network-gateway/lng"
  resource_group_name        = module.module_create_resource_group.resource_group_name
  location                   = module.module_create_resource_group.resource_group_location
  local_network_gateway_name = var.local_network_gateway_name
  address_space              = var.address_space
  gateway_address            = var.gateway_address
  gateway_fqdn               = var.gateway_fqdn
  tags                       = var.tags
  bgp_settings               = var.bgp_settings
}

module "module_create_resource_group" {
  source                = "../../modules/module_resource-group-creation/resource_group"
  create_resource_group = var.create_resource_group
  resource_group_name   = var.resource_group_name
  location              = var.location
  tags                  = var.tags
}