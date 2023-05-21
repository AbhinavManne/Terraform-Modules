#Reference to the module for creating an app service
data "azurerm_resources" "example" {
  resource_group_name = "rg-001"
}

module "app_service" {
  source                    = "../../modules/module_app-service-enable-app-insights/app_service-module"
  resource_group_name       = var.resource_group_name
  resource_group_location   = var.resource_group_location
  app_service_plan_name     = var.app_service_plan_name
  tier                      = var.tier
  size                      = var.size
  app_service_name          = var.app_service_name
  https_only                = var.https_only
  contact_person            = var.contact_person
  cost_center               = var.cost_center
  backup_name               = var.backup_name
  frequency_interval        = var.frequency_interval
  frequency_unit            = var.frequency_unit
  dotnet_framework_version  = var.dotnet_framework_version
  scm_type                  = var.scm_type
  min_tls_version           = var.min_tls_version
  always_on                 = var.always_on
  use_32_bit_worker_process = var.use_32_bit_worker_process
  vnet_route_all_enabled    = var.vnet_route_all_enabled
  scm_ip_restriction_name   = var.scm_ip_restriction_name
  ip_address                = var.ip_address
  priority1                 = var.priority1
  action1                   = var.action1
  ip_restriction_name       = var.ip_restriction_name
  priority2                 = var.priority2
  action2                   = var.action2
  name1                     = var.name1
  type1                     = var.type1
  type2                     = var.type2
  auth_settings_enabled     = var.auth_settings_enabled
  default_provider          = var.default_provider
  token_store_enabled       = var.token_store_enabled
  application_insights_name = var.application_insights_name
  application_type          = var.application_type
  vnet_name                 = var.vnet_name
  address_space             = var.address_space
  subnet_name               = var.subnet_name
  address_prefixes          = var.address_prefixes
  storage_account_name      = var.storage_account_name
  account_tier              = var.account_tier
  account_replication_type  = var.account_replication_type
  container_name            = var.container_name
  container_access_type     = var.container_access_type
  start_date                = var.start_date
  end_date                  = var.end_date
  log_analytics_name        = var.log_analytics_name
}

module "app_service_monitoring" {

  source                  = "../../modules/module_app-service-enable-app-insights/diag_setting"
  resource_id             = module.app_service.app_service_id
  storage_account_id      = module.app_service.storage_account_id
  resource_group_name     = module.app_service.resource_group
  resource_group_id       = module.app_service.resource_group_id
  resource_group_location = module.app_service.resource_group_location

}

module "module_resource-role-assignment" {

  source = "../../modules/module_app-service-enable-app-insights/rbac"
  resource_group_name  = module.app_service.resource_group
  scope                = module.app_service.app_service_id
  role_definition_name = var.role_definition_name

}