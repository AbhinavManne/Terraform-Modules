resource "azurerm_virtual_network" "vn" {
  count                   = length(var.vnet)
  location                = var.location
  resource_group_name     = var.resource_group_name
  name                    = lookup(var.vnet[count.index], "virtual_network_name")
  address_space           = lookup(var.vnet[count.index], "virtual_network_address_space")
  bgp_community           = lookup(var.vnet[count.index], "bgp_community")
  dns_servers             = lookup(var.vnet[count.index], "dns_servers")
  edge_zone               = lookup(var.vnet[count.index], "edge_zone")
  flow_timeout_in_minutes = lookup(var.vnet[count.index], "flow_timeout_in_minutes")
  dynamic "ddos_protection_plan" {
    for_each = lookup(var.vnet[count.index], "enable_ddos_protection_plan") ? [1] : []
    content {
      enable = lookup(var.vnet[count.index], "enable_ddos_protection_plan")
      id     = lookup(var.vnet[count.index], "id_of_ddos_protection_plan")
    }
  }
  tags = lookup(var.vnet[count.index], "tags")
}


locals {
  vnet_name_and_vnet_id = {
    for index, vnet in azurerm_virtual_network.vn :
    vnet.name => vnet.id
  }
}

