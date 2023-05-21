resource "azurerm_virtual_network_gateway" "vnet_gateway" {
  name                             = var.virtual_network_gateway_name
  location                         = var.location
  resource_group_name              = var.resource_group_name
  type                             = var.virtual_network_gateway_type
  active_active                    = var.virtual_network_gateway_sku == "HighPerformance" || var.virtual_network_gateway_sku == "UltraPerformance" ? var.virtual_network_gateway_active_active : false
  sku                              = var.virtual_network_gateway_sku
  default_local_network_gateway_id = var.default_local_network_gateway_id
  edge_zone                        = var.virtual_network_gateway_edge_zone
  enable_bgp                       = var.virtual_network_gateway_enable_bgp
  generation                       = var.virtual_network_gateway_generation
  private_ip_address_enabled       = var.private_ip_address_enabled
  vpn_type                         = var.virtual_network_gateway_vpn_type

  ip_configuration {
    name                          = var.ip_configuration_name
    public_ip_address_id          = var.ip_configuration_pip_id
    private_ip_address_allocation = var.ip_configuration_pip_addalloc
    subnet_id                     = var.ip_configuration_subnet_id
  }

  dynamic "ip_configuration" {
    for_each = var.vnet_gateway_ip_configuration != null && var.virtual_network_gateway_active_active ? var.vnet_gateway_ip_configuration : []
    content {
      name                          = ip_configuration.value.name
      public_ip_address_id          = ip_configuration.value.public_ip_address_id
      private_ip_address_allocation = ip_configuration.value.private_ip_address_allocation
      subnet_id                     = ip_configuration.value.subnet_id
    }
  }

  dynamic "bgp_settings" {
    for_each = var.virtual_network_gateway_enable_bgp ? var.bgp_settings : []
    content {
      asn         = bgp_settings.value.asn
      peer_weight = bgp_settings.value.peer_weight
      dynamic "peering_addresses" {
        for_each = bgp_settings.value.peering_addresses
        content {
          ip_configuration_name = peering_addresses.value.ip_configuration_name
          apipa_addresses       = peering_addresses.value.apipa_addresses
        }
      }
    }
  }

  dynamic "vpn_client_configuration" {
    for_each = var.vpn_client_configuration 
    content {
      address_space         = vpn_client_configuration.value.address_space
      aad_tenant            = vpn_client_configuration.value.aad_tenant
      aad_audience          = vpn_client_configuration.value.aad_audience
      aad_issuer            = vpn_client_configuration.value.aad_issuer
      radius_server_address = vpn_client_configuration.value.radius_server_address
      radius_server_secret  = vpn_client_configuration.value.radius_server_secret
      vpn_client_protocols  = vpn_client_configuration.value.vpn_client_protocols
      vpn_auth_types        = vpn_client_configuration.value.vpn_auth_types
      dynamic "root_certificate" {
        for_each = vpn_client_configuration.value.root_certificate
        content {
          name             = root_certificate.value.name
          public_cert_data = root_certificate.value.public_cert_data
        }
      }
      dynamic "revoked_certificate" {
        for_each = vpn_client_configuration.value.revoked_certificate
        content {
          name             = revoked_certificate.value.name
          thumbprint       = revoked_certificate.value.thumbprint
        }
      }

    }
  }

  tags = var.tags
}