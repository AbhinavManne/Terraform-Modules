resource "azurerm_kusto_database" "kusto_database" {
  name                = var.kusto_database
  resource_group_name = var.resource_group_name
  location            = var.location
  cluster_name        = var.kusto_cluster

  hot_cache_period   = var.hot_cache_period
  soft_delete_period = var.soft_delete_period
}
