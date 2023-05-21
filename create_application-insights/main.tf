#Reference to application insights creation module
module "module_create_application_insights" {
  source                                = "../../modules/module_application-insights-creation/application-insights"
  resource_group_name                   = var.resource_group_name
  application_insights_name             = var.application_insights_name
  application_insights_type             = var.application_insights_type
  log_analytics_workspace               = var.log_analytics_workspace
  sku                                   = var.sku
  retention_in_days                     = var.retention_in_days
  daily_data_cap_in_gb                  = var.daily_data_cap_in_gb
  daily_data_cap_notifications_disabled = var.daily_data_cap_notifications_disabled
  sampling_percentage                   = var.sampling_percentage
  disable_ip_masking                    = var.disable_ip_masking
  tags                                  = var.tags
  private_link_scope                    = var.private_link_scope
  private_link_scoped_service           = var.private_link_scoped_service
  authenticate_sdk_control_channel      = var.authenticate_sdk_control_channel
  smart_detection_rule                  = var.smart_detection_rule
  enabled                               = var.enabled
  read_telemetry                        = var.read_telemetry
  read_permissions1                     = var.read_permissions1
  read_permissions2                     = var.read_permissions2
  write_annotations                     = var.write_annotations
  write_permissions                     = var.write_permissions
  full_permissions                      = var.full_permissions
  read_permissions                      = var.read_permissions
}

#Reference to module that provisions role assignment for  resource
module "module_resource-role-assignment" {
  source                  = "../../modules/module_application-insights-creation/rbac"
  scope                   = module.module_create_application_insights.resource_id
  resource_group_name     = module.module_create_application_insights.resource_group_name
  resource_group_id       = module.module_create_application_insights.resource_group_id
  resource_group_location = module.module_create_application_insights.resource_group_location
  role_definition_name    = var.role_definition_name

}

#Reference to module that provisions diagnostic settings of a particular resource
module "application_insights_monitoring" {
  source                  = "../../modules/module_application-insights-creation/logging_and_monitoring"
  resource_id             = module.module_create_application_insights.resource_id
  resource_group_name     = module.module_create_application_insights.resource_group_name
  resource_group_id       = module.module_create_application_insights.resource_group_id
  resource_group_location = module.module_create_application_insights.resource_group_location
}