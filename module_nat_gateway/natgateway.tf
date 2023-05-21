# --------------------------- NAT Gateway ------------------------------
resource "azurerm_nat_gateway" "natgateway" {
  name                    = var.nat_gateway_name
  location                = var.location
  resource_group_name     = var.resource_group_name
  sku_name                = var.sku_name
  idle_timeout_in_minutes = var.idle_timeout_in_minutes
  zones                   = var.zones
  tags                    = var.tags
}

resource "azurerm_public_ip" "natgwpublicip" {
  name                = var.nat_gateway_public_ip_name
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = var.allocation_method
  sku                 = var.sku
  zones               = var.zones
  tags                = var.tags
}
#-----------------------------------------------------
# Association between a Nat Gateway and a Public IP.
#-----------------------------------------------------
resource "azurerm_nat_gateway_public_ip_association" "main" {
  nat_gateway_id       = azurerm_nat_gateway.natgateway.id
  public_ip_address_id = azurerm_public_ip.natgw-public-ip.id
}

#-----------------------------------------------------------
# Association between a Nat Gateway and a Public IP Prefix.
#-----------------------------------------------------------
resource "azurerm_nat_gateway_public_ip_prefix_association" "main" {
  nat_gateway_id      = azurerm_nat_gateway.natgateway.id
  public_ip_prefix_id = var.public_ip_prefix_id
}

#-------------------------------------------------------------------
# Associates a NAT Gateway with a Subnet within a Virtual Network.
#-------------------------------------------------------------------
resource "azurerm_subnet_nat_gateway_association" "main" {
  count          = length(var.subnet_id)
  nat_gateway_id = azurerm_nat_gateway.natgateway.id
  subnet_id      = var.subnet_id[count.index]
}
