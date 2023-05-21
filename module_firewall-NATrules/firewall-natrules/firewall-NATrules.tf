
locals {
  data_list = csvdecode(file(var.csv_file_name))
}

resource "azurerm_firewall_nat_rule_collection" "nat_rules" {
  for_each            = { for data_list in local.data_list : data_list.Rule => data_list }
  name                = each.value.Rule
  azure_firewall_name = var.firewall_name
  resource_group_name = var.resource_group_name
  priority            = each.value.Priority
  action              = each.value.action

  rule {

    name        = each.value.Name
    description = each.value.description
    source_addresses = [
      each.value.Source_Address
    ]

    destination_ports = [
      each.value.Destination_Port
    ]

    destination_addresses = [
      each.value.destination_address
    ]

    translated_port = each.value.translated_port

    translated_address = each.value.translated_address

    protocols = [
      each.value.Protocol
    ]

  }

}