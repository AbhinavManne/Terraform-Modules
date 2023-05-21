module "public_ip_module" {
  source = "../../modules/module_public-ip-creation/public ip"

  resource_group_name     = module.module_create_resource_group.resource_group_name
  location                = module.module_create_resource_group.resource_group_location
  public_ip_name          = var.public_ip_name
  allocation_method       = var.allocation_method
  sku                     = var.sku
  ip_version              = var.ip_version
  domain_name_label       = var.domain_name_label
  idle_timeout_in_minutes = var.idle_timeout_in_minutes
  zones                   = var.zones
  reverse_fqdn            = var.reverse_fqdn
  public_ip_prefix_id     = var.public_ip_prefix_id
  edge_zone               = var.edge_zone
  sku_tier                = var.sku_tier
  ip_tags                 = var.ip_tags


  tags = var.tags
}

module "module_create_resource_group" {

  source                = "../../modules/module_resource-group-creation/resource_group"
  create_resource_group = var.create_resource_group
  resource_group_name   = var.resource_group_name
  location              = var.location
  tags                  = var.tags
}