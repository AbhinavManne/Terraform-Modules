#Reference to management group role assignment module 
module "module_mg-role-assignment" {
  source                = "../../modules/module_rbac-management-group"
  management_group_name = var.management_group_name
  role_definition_name  = var.role_definition_name
}