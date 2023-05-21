data "azurerm_subscription" "primary" {
}

data "azurerm_client_config" "example" {
}

# data "azurerm_management_group" "example" {
# }

data "azurerm_resource_group" "rg" {
  name = "cil-testing-001"
}

module "role_assignment" {
  source                                 = "../../modules/module_role_assignment"
  role_assignment_name                   = var.role_assignment_name
  role_assignment_scope                  = data.azurerm_resource_group.rg.id
  role_definition_id                     = module.role_definition.role_definition_id
  ra_role_definition_name                = var.ra_role_definition_name
  principal_id                           = data.azurerm_client_config.example.object_id //var.principal_id
  rbac_condition                         = var.rbac_condition
  rbac_condition_version                 = var.rbac_condition_version
  delegated_managed_identity_resource_id = var.delegated_managed_identity_resource_id
  role_assignment_description            = var.role_assignment_description
  skip_service_principal_aad_check       = var.skip_service_principal_aad_check
}

module "role_definition" {
  source                            = "../../modules/module_role_definition"
  role_definition_name              = var.role_definition_name
  scope                             = data.azurerm_resource_group.rg.id
  role_definition_description       = var.role_definition_description
  rdef_permissions                  = var.rdef_permissions
  rdef_permissions_actions          = var.rdef_permissions_actions
  rdef_permissions_data_actions     = var.rdef_permissions_data_actions
  rdef_permissions_not_actions      = var.rdef_permissions_not_actions
  rdef_permissions_not_data_actions = var.rdef_permissions_not_data_actions
  rdef_assignable_scopes            = [data.azurerm_resource_group.rg.id] //The value for scope is automatically included in this list if no other values supplied.
}
