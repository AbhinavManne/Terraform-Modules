resource "azurerm_role_assignment" "rbac" {
  name                                   = var.role_assignment_name
  scope                                  = var.role_assignment_scope
  role_definition_id                     = var.role_definition_id
  role_definition_name                   = var.role_definition_id == null ? var.ra_role_definition_name : null
  principal_id                           = var.principal_id
  condition                              = var.rbac_condition
  condition_version                      = var.rbac_condition_version
  delegated_managed_identity_resource_id = var.delegated_managed_identity_resource_id
  description                            = var.role_assignment_description
  skip_service_principal_aad_check       = var.skip_service_principal_aad_check
}
