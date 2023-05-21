module "vnet1tovnet2vpn_module" {
  source         = "../../modules/module_vnettovnetvpn/vpn"
  vnet1_to_vnet2 = var.vnet1_to_vnet2
  location       = var.location
  rg             = var.rg

  type                            = var.type
  virtual_network_gateway_id      = var.virtual_network_gateway_id
  peer_virtual_network_gateway_id = var.peer_virtual_network_gateway_id

  shared_key                     = var.shared_key
  tags                           = var.tags
  authorization_key              = var.authorization_key
  dpd_timeout_seconds            = var.dpd_timeout_seconds
  express_route_circuit_id       = var.express_route_circuit_id
  local_azure_ip_address_enabled = var.local_azure_ip_address_enabled
  local_network_gateway_id       = var.local_network_gateway_id
  routing_weight                 = var.routing_weight
  connection_mode                = var.connection_mode
  connection_protocol            = var.connection_protocol
  enable_bgp                     = var.enable_bgp

  express_route_gateway_bypass       = var.express_route_gateway_bypass
  egress_nat_rule_ids                = var.egress_nat_rule_ids
  ingress_nat_rule_ids               = var.ingress_nat_rule_ids
  use_policy_based_traffic_selectors = var.use_policy_based_traffic_selectors
  ipsec_policy                       = var.ipsec_policy
  dh_group                           = var.dh_group
  ike_encryption                     = var.ike_encryption
  ike_integrity                      = var.ike_integrity
  ipsec_encryption                   = var.ipsec_encryption
  ipsec_integrity                    = var.ipsec_integrity
  pfs_group                          = var.pfs_group
  sa_datasize                        = var.sa_datasize
  sa_lifetime                        = var.sa_lifetime
  traffic_selector_policy            = var.traffic_selector_policy
  local_address_cidrs                = var.local_address_cidrs
  remote_address_cidrs               = var.remote_address_cidrs
  custom_bgp_addresses               = var.custom_bgp_addresses
  primary                            = var.primary
  secondary                          = var.secondary

}
module "vnet2tovnet1vpn_module" {
  source         = "../../modules/module_vnettovnetvpn/vpn"
  vnet1_to_vnet2 = var.vnet2_to_vnet1
  location       = var.location1
  rg             = var.rg1

  type                            = var.type
  virtual_network_gateway_id      = var.peer_virtual_network_gateway_id
  peer_virtual_network_gateway_id = var.virtual_network_gateway_id

  shared_key                     = var.shared_key
  tags                           = var.tags
  authorization_key              = var.authorization_key
  dpd_timeout_seconds            = var.dpd_timeout_seconds
  express_route_circuit_id       = var.express_route_circuit_id
  local_azure_ip_address_enabled = var.local_azure_ip_address_enabled
  local_network_gateway_id       = var.local_network_gateway_id
  routing_weight                 = var.routing_weight
  connection_mode                = var.connection_mode
  connection_protocol            = var.connection_protocol
  enable_bgp                     = var.enable_bgp

  express_route_gateway_bypass       = var.express_route_gateway_bypass
  egress_nat_rule_ids                = var.egress_nat_rule_ids
  ingress_nat_rule_ids               = var.ingress_nat_rule_ids
  use_policy_based_traffic_selectors = var.use_policy_based_traffic_selectors
  ipsec_policy                       = var.ipsec_policy
  dh_group                           = var.dh_group
  ike_encryption                     = var.ike_encryption
  ike_integrity                      = var.ike_integrity
  ipsec_encryption                   = var.ipsec_encryption
  ipsec_integrity                    = var.ipsec_integrity
  pfs_group                          = var.pfs_group
  sa_datasize                        = var.sa_datasize
  sa_lifetime                        = var.sa_lifetime
  traffic_selector_policy            = var.traffic_selector_policy
  local_address_cidrs                = var.local_address_cidrs
  remote_address_cidrs               = var.remote_address_cidrs
  custom_bgp_addresses               = var.custom_bgp_addresses
  primary                            = var.primary
  secondary                          = var.secondary

}


