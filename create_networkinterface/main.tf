
module "networkinterface_module" {
  source                        = "../../modules/module_networkinterface/network-interface_module"
  network_interface_name        = var.network_interface_name
  location                      = var.location
  resource_group_name           = var.resource_group_name
  dns_servers                   = var.dns_servers
  edge_zone                     = var.edge_zone
  enable_ip_forwarding          = var.enable_ip_forwarding
  enable_accelerated_networking = var.enable_accelerated_networking
  internal_dns_name_label       = var.internal_dns_name_label
  tags                          = var.tags
  ip_configuration              = var.ip_configuration
}

module "module_create_resource_group" {

  source                = "../../modules/module_resource-group-creation/resource_group"
  create_resource_group = var.create_resource_group
  resource_group_name   = var.resource_group_name
  location              = var.location
  tags                  = var.tags
}

