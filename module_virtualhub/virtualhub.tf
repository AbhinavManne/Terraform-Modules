resource "azurerm_virtual_hub" "virtualhub" {
  name                = var.virtualhub
  resource_group_name = var.rg
  location            = var.location
  virtual_wan_id      = var.virtual_wan_id
  address_prefix      = "10.0.0.0/23"
  sku                 = var.sku
  tags                = var.tags

  dynamic "route" {
    for_each = var.route != null ? [var.route] : []
    content {
      address_prefixes    = var.address_prefix
      next_hop_ip_address = var.next_hop_ip_address
    }
  }

}
