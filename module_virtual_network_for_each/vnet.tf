resource "azurerm_virtual_network" "vn" {
  for_each                = var.vnet
  location                = var.location
  resource_group_name     = var.resource_group_name
  name                    = each.key
  address_space           = lookup(each.value, "virtual_network_address_space")
  bgp_community           = lookup(each.value, "bgp_community")
  dns_servers             = lookup(each.value, "dns_servers")
  edge_zone               = lookup(each.value, "edge_zone")
  flow_timeout_in_minutes = lookup(each.value, "flow_timeout_in_minutes")
  dynamic "ddos_protection_plan" {
    for_each = lookup(each.value, "enable_ddos_protection_plan") ? [1] : []
    content {
      enable = lookup(each.value, "enable_ddos_protection_plan")
      id     = lookup(each.value, "id_of_ddos_protection_plan")
    }
  }
  tags = lookup(each.value, "virtual_network_tags")
}


locals {
  vnet_name_and_vnet_id = {
    for index, vnet in azurerm_virtual_network.vn :
    vnet.name => vnet.id
  }
}
