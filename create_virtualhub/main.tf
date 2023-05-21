module "virtualhub" {
  source = "../../modules/module_virtualhub"

  virtualhub          = var.virtualhub
  rg                  = var.rg
  location            = var.location
  virtual_wan_id      = var.virtual_wan_id
  address_prefix      = "10.0.0.0/23"
  sku                 = var.sku
  tags                = var.tags
  next_hop_ip_address = var.next_hop_ip_address
  route               = var.route
}
