
module "natgateway_module" {
  source                     = "../../modules/module_nat_gateway"
  resource_group_name        = module.module_create_resource_group.resource_group_name
  location                   = module.module_create_resource_group.resource_group_location
  nat_gateway_name           = var.nat_gateway_name
  sku_name                   = var.sku_name
  idle_timeout_in_minutes    = var.idle_timeout_in_minutes
  zones                      = var.zones
  tags                       = var.tags
  nat_gateway_public_ip_name = var.nat_gateway_public_ip_name
  allocation_method          = var.allocation_method
  sku                        = var.sku
  public_ip_prefix_id        = var.public_ip_prefix_id
  subnet_id                  = var.subnet_id
}

module "module_create_resource_group" {
  source                = "../../modules/module_resource-group-creation/resource_group"
  create_resource_group = var.create_resource_group
  resource_group_name   = var.resource_group_name
  location              = var.location
  tags                  = var.tags
}
