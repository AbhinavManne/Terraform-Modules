module "point_to_site_vpn_gateway" {
  source = "../../modules/module_point_to_site_vpn_gateway/point-to-site"

  resource_group_name            = var.resource_group_name
  point_to_site_vpn_gateway      = var.point_to_site_vpn_gateway
  location                       = var.location
  connection_configuration       = var.connection_configuration
  tags                           = var.tags
  scale_unit                     = var.scale_unit
  virtual_hub_id                 = var.virtual_hub_id
  vpn_server_configuration_id    = var.vpn_server_configuration_id
  vpn_server_configuration      = var.vpn_server_configuration
  vpn_authentication_types       = var.vpn_authentication_types
  #client_root_certificate        = var.client_root_certificate
  #public_cert_data               = var.public_cert_data
  address_prefixes               = var.address_prefixes
  internet_security_enabled      = var.internet_security_enabled
 # enable_route                   = var.enable_route
  associated_route_table_id      = var.associated_route_table_id
  propagated_route_table         = var.propagated_route_table
  propagated_route_table_ids     = var.propagated_route_table_ids
  propagated_route_table_labels  = var.propagated_route_table_labels

}
