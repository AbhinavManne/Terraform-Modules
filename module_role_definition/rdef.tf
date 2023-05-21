resource "azurerm_role_definition" "rdef" {
  name        = var.role_definition_name
  scope       = var.scope
  description = var.role_definition_description

  dynamic "permissions" {
    for_each = var.rdef_permissions ? [1] : []
    content {
      actions          = var.rdef_permissions_actions
      data_actions     = var.rdef_permissions_data_actions
      not_actions      = var.rdef_permissions_not_actions
      not_data_actions = var.rdef_permissions_not_data_actions
    }
  }

  assignable_scopes = var.rdef_assignable_scopes //The value for scope is automatically included in this list if no other values supplied.
}
