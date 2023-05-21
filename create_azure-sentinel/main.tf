#Reference to module that provisions an Azure Sentinel
module "azure_sentinel_module" {
  source = "../../modules/module_azure-sentinel/sentinel"
  resource_group_name          = var.resource_group_name
  log_analytics_workspace_name = var.log_analytics_workspace_name
  tags                         = var.tags
}

#Reference to module that provisions role assignment for  resource
module "module_resource-role-assignment" {
  source               = "../../modules/module_azure-sentinel/rbac"
  scope                = module.azure_sentinel_module.resource_id
  role_definition_name = var.role_definition_name

}

#Reference to module that provisions diagnostic settings of a particular resource
module "resource_monitoring" {
  source                  = "../../modules/module_azure-sentinel/diag_setting"
  resource_id             = module.azure_sentinel_module.resource_id
  resource_group_name     = module.azure_sentinel_module.resource_group
  resource_group_id       = module.azure_sentinel_module.resource_group_id
  resource_group_location = module.azure_sentinel_module.resource_group_location
}