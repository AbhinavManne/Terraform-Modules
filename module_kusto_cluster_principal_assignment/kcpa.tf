data "azurerm_client_config" "identity" {}

resource "azurerm_kusto_cluster_principal_assignment" "kcpa" {
  name                = var.kcpa
  resource_group_name = var.resource_group_name
  cluster_name        = var.kusto_cluster
  tags                = var.tags


  tenant_id      = data.azurerm_client_config.identity.tenant_id
  principal_id   = data.azurerm_client_config.identity[0].principal_id
  principal_type = var.principal_type
  role           = var.role
  location       = var.location
}

