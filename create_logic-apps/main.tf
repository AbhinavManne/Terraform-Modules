module "logic_apps" {
  source = "../../modules/module_logic-apps/logic_app"

  location                         = var.location
  resource_group                   = var.resource_group
  logic_apps                       = var.logic_apps
  tags                             = var.tags
  storage_account_name             = var.storage_account_name
  storage_account_tier             = var.storage_account_tier
  storage_account_replication_type = var.storage_account_replication_type
}

#---------module for Role Assignemt--------#

module "role_assignemt" {
  source                  = "../../modules/module_logic-apps/rbac"
  resource_group_name     = module.logic_apps.resource_group_name
  resource_group_id       = module.logic_apps.resource_group_id
  resource_group_location = module.logic_apps.resource_group_location
  scope                   = module.logic_apps.resource_id
  role_definition_name    = var.role_definition

}

#---------module for logging and monitoring--------#

module "diag_monitoring" {
  source                  = "../../modules/module_logic-apps/logging_and_monitoring"
  resource_group_name     = module.logic_apps.resource_group_name
  resource_group_id       = module.logic_apps.resource_group_id
  resource_group_location = module.logic_apps.resource_group_location
  storage_account_id      = module.logic_apps.storage_id
  resource_id             = module.logic_apps.resource_id
}
