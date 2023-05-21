resource "azurerm_data_factory_integration_runtime_self_hosted" "integration_runtime" {

  data_factory_id = var.data_factory_id
  name            = var.integration_runtime_custom_name
  description     = var.integration_runtime_description

  dynamic "rbac_authorization" {
    for_each = var.resource_id != null ? [var.resource_id] : []
    content {
      resource_id = var.resource_id
    }
  }
}