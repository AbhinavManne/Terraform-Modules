module "kusto_database" {
  source              = "../../modules/module_kusto_database"
  kusto_database      = var.kusto_database
  hot_cache_period    = var.hot_cache_period
  soft_delete_period  = var.soft_delete_period
  kusto_cluster       = var.kusto_cluster
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags
}
