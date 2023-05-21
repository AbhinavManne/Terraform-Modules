locals {

  list_of_csv_lines = csvdecode(file(var.csv_file_name_for_Route_Table))
  all_rt_names      = distinct([for item in local.list_of_csv_lines : item.route_table_name])

  combine = {
    for item in local.all_rt_names :
    "${item}" => [
      for line in local.list_of_csv_lines : line
      if item == line.route_table_name
    ]
  }
}

resource "azurerm_route_table" "rt" {
  for_each            = local.combine
  name                = each.key
  location            = var.location
  resource_group_name = var.resource_group_name
  disable_bgp_route_propagation = var.disable_bgp_route_propagation

  dynamic "route" {
    for_each = each.value

    content {
      name                   = route.value["rulename"]
      address_prefix         = route.value["address_prefix"]
      next_hop_type          = route.value["next_hop_type"]
      next_hop_in_ip_address = route.value["next_hop_type"] == "VirtualAppliance" ? route.value["next_hop_in_ip_address"] : null
    }
  }
  tags                = var.tags
}

locals {
  all_rt_id = [for rtid in azurerm_route_table.rt : rtid.id]
}

