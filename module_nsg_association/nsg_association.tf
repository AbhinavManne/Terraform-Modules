resource "azurerm_subnet_network_security_group_association" "nsgas" {
  for_each                  = var.subnet_name_and_nsg_id
  subnet_id                 = var.subnet_name_and_subnet_id[each.key]
  network_security_group_id = each.value
}
