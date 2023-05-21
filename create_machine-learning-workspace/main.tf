module "machine_learning_workspace" {
  source = "../../modules/module_machine-learning-workspace/workspace"

  resource_group=var.resource_group
  application_insights_name=var.application_insights_name
  key_vault_name=var.key_vault_name
  storage_account_name=var.storage_account_name
  workspace_name=var.workspace_name
  identity_type=var.identity_type
  private_endpoint_name           = var.private_endpoint_name
  private_service_connection_name = var.private_service_connection_name
  subresource_names               = var.subresource_names
  sql_server_name                 = var.sql_server_name
  virtual_network_name            = var.virtual_network_name
  subnet_name                     = var.subnet_name
  address_prefixes                = var.address_prefixes
  is_manual_connection            = var.is_manual_connection
  request_message                 = var.request_message
  tags                            = var.tags
}

#---------module for Role Assignemt--------#

module "role_assignemt" {
  source                  = "../../modules/module_machine-learning-workspace/rbac"
  resource_group_name     = module.machine_learning_workspace.resource_group_name
  resource_group_id       = module.machine_learning_workspace.resource_group_id
  resource_group_location = module.machine_learning_workspace.resource_group_location
  scope                   = module.machine_learning_workspace.resource_id
  role_definition_name    = var.role_definition

}

#---------module for logging and monitoring--------#

module "diag_monitoring" {
  source                  = "../../modules/module_machine-learning-workspace/logging_and_monitoring"
  resource_group_name     = module.machine_learning_workspace.resource_group_name
  resource_group_id       = module.machine_learning_workspace.resource_group_id
  resource_group_location = module.machine_learning_workspace.resource_group_location
  resource_id             = module.machine_learning_workspace.resource_id
}