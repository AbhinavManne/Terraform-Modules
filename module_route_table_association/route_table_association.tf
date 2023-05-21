resource "azurerm_subnet_route_table_association" "rtas" {
  for_each                  = var.subnet_name_and_rt_id
  subnet_id                 = var.subnet_name_and_subnet_id[each.key]
  route_table_id  = each.value
}
