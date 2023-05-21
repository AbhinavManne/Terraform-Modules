module "network_watcher" {
  source = "../../modules/module_network-watcher/network_watcher"

  network_watcher     = var.network_watcher
  tags                = var.tags
  resource_group_name = var.resource_group_name
  location            = var.location
}






