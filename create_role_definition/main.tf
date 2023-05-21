module "role_definition" {
  source                            = "../../modules/module_role_definition"
  role_definition_name              = var.role_definition_name
  scope                             = var.scope
  role_definition_description       = var.role_definition_description
  rdef_permissions                  = var.rdef_permissions
  rdef_permissions_actions          = var.rdef_permissions_actions
  rdef_permissions_data_actions     = var.rdef_permissions_data_actions
  rdef_permissions_not_actions      = var.rdef_permissions_not_actions
  rdef_permissions_not_data_actions = var.rdef_permissions_not_data_actions
  rdef_assignable_scopes            = var.rdef_assignable_scopes
}
