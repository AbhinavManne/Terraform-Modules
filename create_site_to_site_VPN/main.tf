#Reference to storage account creation module
module "site_to_site_VPN_module" {
  source                           = "../../modules/module_site_to_site_VPN/site to site"
  resource_group                   = var.resource_group
  virtual_network                  = var.virtual_network
  location                         = var.location
  tags                             = var.tags
  storage_account_name             = var.storage_account_name
  storage_account_tier             = var.storage_account_tier
  storage_account_replication_type = var.storage_account_replication_type
  vnet_address_space               = var.vnet_address_space
  gateway_subnet_address           = var.gateway_subnet_address
  local_network_gateway            = var.local_network_gateway
  gateway_address                  = var.gateway_address
  address_space                    = var.address_space
  public_ip                        = var.public_ip
  allocation_method                = var.allocation_method
  vnet_gateway                     = var.vnet_gateway
  vnet_gateway_type                = var.vnet_gateway_type
  vpn_type                         = var.vpn_type
  active_active                    = var.active_active
  enable_bgp                       = var.enable_bgp
  sku                              = var.sku
  private_ip_address_allocation    = var.private_ip_address_allocation
  vnet_gateway_connection          = var.vnet_gateway_connection
  connection_type                  = var.connection_type
  shared_key                       = var.shared_key
}

#-------------------------------MODULE FOR ROLE ASSIGNMENT----------------------------------------------#

module "role_assignemt" {
  source                  = "../../modules/module_site_to_site_VPN/rbac"
  resource_group_name     = module.site_to_site_VPN_module.resource_group_name
  resource_group_id       = module.site_to_site_VPN_module.resource_group_id
  resource_group_location = module.site_to_site_VPN_module.resource_group_location
  scope                   = module.site_to_site_VPN_module.resource_id
  role_definition_name    = var.role_definition

}