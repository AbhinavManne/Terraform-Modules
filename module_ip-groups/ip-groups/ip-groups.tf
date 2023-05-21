
#--------------------------------------------------------IP Group----------------------------------------------------------
resource "azurerm_ip_group" "ipgroup" {
  name                = var.ip_group
  location            = var.location
  resource_group_name = var.resource_group_name
  cidrs               = var.cidrs
  tags                = var.tags

}