module "kusto_attached_database_configuration" {
  source                                = "../../modules/module_kusto_attached_database_configuration"
  kusto_cluster                         = var.kusto_cluster
  location                              = var.location
  resource_group_name                   = var.resource_group_name
  kusto_attached_database_configuration = var.kusto_attached_database_configuration
  cluster_id                   = var.cluster_id
  external_tables_to_exclude            = var.external_tables_to_exclude
  external_tables_to_include            = var.external_tables_to_include
  materialized_views_to_exclude         = var.materialized_views_to_exclude
  materialized_views_to_include         = var.materialized_views_to_include
  tables_to_exclude                     = var.tables_to_exclude
  tables_to_include                     = var.tables_to_include
  kusto_database                        = var.kusto_database
  tags                                  = var.tags
}
