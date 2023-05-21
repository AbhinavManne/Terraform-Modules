resource "azurerm_subnet" "subnet" {
  for_each                                      = var.subnets
  name                                          = lookup(each.value, "subnet_name")
  resource_group_name                           = var.resource_group_name
  virtual_network_name                          = lookup(each.value, "virtual_network_name")
  address_prefixes                              = lookup(each.value, "subnet_address_prefixes")
  service_endpoints                             = lookup(each.value, "subnet_service_endpoints")
  private_endpoint_network_policies_enabled     = lookup(each.value, "private_endpoint_network_policies_enabled")
  private_link_service_network_policies_enabled = lookup(each.value, "private_link_service_network_policies_enabled")
  service_endpoint_policy_ids                   = lookup(each.value, "service_endpoint_policy_ids")
  dynamic "delegation" {
    for_each = lookup(each.value, "subnet_delegation", {})
    content {
      name = delegation.key
      service_delegation {
        name    = lookup(delegation.value, "service_name")
        actions = lookup(delegation.value, "service_actions", [])
      }
    }
  }
}

locals {
  subnet_name_and_subnet_id = {
    for index, s in azurerm_subnet.subnet :
    "${s.name}-${s.virtual_network_name}" => s.id
  }
  subnet_name = [
    for n in azurerm_subnet.subnet : n.name
  ]
  subnet_id = [
    for n in azurerm_subnet.subnet : n.id
  ]
}