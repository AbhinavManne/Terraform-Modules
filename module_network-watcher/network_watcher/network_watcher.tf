resource "azurerm_network_watcher" "network_watcher" {
  name                = var.network_watcher
  location            = var.location
  resource_group_name = var.resource_group_name
  tags = var.tags
}


