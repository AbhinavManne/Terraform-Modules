resource "azurerm_virtual_network_gateway_connection" "vnettovnetvpn" {
  name                            = var.vnet1_to_vnet2
  location                        = var.location
  resource_group_name             = var.rg
  type                            = var.type
  virtual_network_gateway_id      = var.virtual_network_gateway_id
  peer_virtual_network_gateway_id = var.peer_virtual_network_gateway_id
  shared_key                      = var.shared_key
  tags                            = var.tags
  authorization_key               = var.authorization_key
  dpd_timeout_seconds             = var.dpd_timeout_seconds
  express_route_circuit_id        = var.express_route_circuit_id
  local_azure_ip_address_enabled  = var.local_azure_ip_address_enabled
  local_network_gateway_id        = var.local_network_gateway_id
  routing_weight                  = var.routing_weight
  connection_mode                 = var.connection_mode
  connection_protocol             = var.connection_protocol
  enable_bgp                      = var.enable_bgp

  express_route_gateway_bypass       = var.express_route_gateway_bypass
  egress_nat_rule_ids                = var.egress_nat_rule_ids
  ingress_nat_rule_ids               = var.ingress_nat_rule_ids
  use_policy_based_traffic_selectors = var.use_policy_based_traffic_selectors

  dynamic "ipsec_policy" {
    for_each = var.ipsec_policy != null ? [var.ipsec_policy] : []
    content {
      dh_group         = var.dh_group
      ike_encryption   = var.ike_encryption
      ike_integrity    = var.ike_integrity
      ipsec_encryption = var.ipsec_encryption
      ipsec_integrity  = var.ipsec_integrity
      pfs_group        = var.pfs_group
      sa_datasize      = var.sa_datasize
      sa_lifetime      = var.sa_lifetime
    }
  }
  dynamic "traffic_selector_policy" {
    for_each = var.traffic_selector_policy != null ? [var.traffic_selector_policy] : []
    content {
      local_address_cidrs  = var.local_address_cidrs
      remote_address_cidrs = var.remote_address_cidrs
    }
  }

}
