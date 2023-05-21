
locals {
  data_list = csvdecode(file(var.csv_file_name))
}

resource "azurerm_firewall_application_rule_collection" "farc" {
  for_each = { for data_list in local.data_list : data_list.Rule => data_list }

  name                = each.value.Rule
  azure_firewall_name = var.firewall_name
  resource_group_name = var.resource_group_name
  priority            = each.value.Priority
  action              = each.value.action

  rule {
    name             = each.value.Name
    source_addresses = [each.value.Source_Address]
    target_fqdns     = [each.value.Target_FQDNs]

    protocol {
      port = each.value.port
      type = each.value.type
    }
  }
}