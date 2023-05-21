#Reference to module that provisions azure dns zone
module "automation_module" {
  source = "../../modules/module_automation_account/automation_account"

  resource_group           = var.resource_group
  create_resource_group    = var.create_resource_group
  location                 = var.location
  automation_account       = var.automation_account
  sku_name                 = var.sku_name
  tags                     = var.tags
  automation_runbook_name  = var.automation_runbook_name
  log_verbose              = var.log_verbose
  log_progress             = var.log_progress
  description              = var.description
  runbook_type             = var.runbook_type
  automation_schedule_name = var.automation_schedule_name
  frequency                = var.frequency
  interval                 = var.interval
  schedule_description     = var.schedule_description
  week_days                = var.week_days

}

#Reference to module that provisions role assignment for each resource
module "module_resource-role-assignment" {
  source               = "../../modules/module_automation_account/rbac"
  scope                = module.automation_module.resource_id
  role_definition_name = var.role_definition_name

}

#Reference to module that provisions diagnostic settings of a particular resource
module "account_monitoring" {
  source                  = "../../modules/module_automation_account/diag_setting"
  resource_id             = module.automation_module.resource_id
  resource_group_name     = module.automation_module.resource_group
  resource_group_id       = module.automation_module.resource_group_id
  resource_group_location = module.automation_module.resource_group_location
}