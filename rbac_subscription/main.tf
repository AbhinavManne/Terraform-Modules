#Reference to subscription role assignment module
module "module_subscription-role-assignment" {
  source               = "../../modules/module_rbac-subscription"
  role_definition_name = var.role_definition_name
}