#Reading Resources from a Resource Group
data "azurerm_resources" "example" {
  resource_group_name = var.resource_group_name
}

#Reference to the resource level role assignment module
module "module_resource-role-assignment" {
  count                = length(data.azurerm_resources.example.resources)
  source               = "../../modules/module_rbac-resource"
  scope                = data.azurerm_resources.example.resources[count.index].id
  role_definition_name = var.role_definition_name
}