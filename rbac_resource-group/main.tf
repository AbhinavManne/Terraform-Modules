#Reference to the resource group role assignment module
module "module_rg-role-assignment" {
  source               = "../../modules/module_rbac-resource-group"
  resource_group_name  = var.resource_group_name
  role_definition_name = var.role_definition_name
}