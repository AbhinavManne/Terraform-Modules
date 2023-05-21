module "Kusto_cluster_Principal_Assignment" {
  source              = "../../modules/module_kusto_cluster_Principal_Assignment"
  kcpa                = var.kcpa
  tenant_id           = var.tenant_id
  principal_id        = var.principal_id
  principal_type      = var.principal_type
  role                = var.role
  kusto_cluster       = var.kusto_cluster
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags
}
