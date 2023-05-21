data "azurerm_client_config" "example" {
}

#Reading Resources from a Resource Group
data "azurerm_resources" "example" {
  resource_group_name = var.resource_group_name
}

#Assignment of Roles at the individual Resource levels
resource "azurerm_role_assignment" "example" {
  count                = length(var.role_definition_name)
  scope                = var.scope
  role_definition_name = element(var.role_definition_name, count.index)
  principal_id         = data.azurerm_client_config.example.object_id
}