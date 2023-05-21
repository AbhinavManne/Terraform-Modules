data "azurerm_client_config" "identity" {}

resource "azurerm_kusto_database_principal_assignment" "kusto_database_principal_assignment" {
  name                = var.kusto_database_principal_assignment
  resource_group_name = var.resource_group_name
  cluster_name        = data.kusto_cluster.name
  database_name       = data.kusto_database.name
  location            = var.location

  tenant_id      = data.azurerm_client_config.identity.tenant_id
  principal_id   = data.kusto_cluster.identity[0].principal_id
  principal_type = var.principal_type
  role           = var.role1
  tags = var.tags
}