resource "azurerm_netapp_snapshot" "example" {
  name                = var.netapp_snapshot
  account_name        = var.account_name
  pool_name           = var.pool_name
  volume_name         = var.volume_name
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags

}
