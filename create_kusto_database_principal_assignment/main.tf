module "kusto_database_principal_assignment" {
  source              = "../../modules/module_kusto_databasee_principal_assignment"
  kusto_cluster       = var.kusto_cluster
  location            = var.location
  resource_group_name = var.resource_group_name
  #tenant_id                           = var.tenant_id
  #principal_id                        = var.principal_id
  principal_type                      = var.principal_type
  role                                = var.role
  kusto_database_principal_assignment = var.kusto_database_principal_assignment
  kusto_database                      = var.kusto_database
  tags                                = var.tags
}
