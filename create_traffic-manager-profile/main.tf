#Reference to traffic manager profile creation module
module "traffic_manager_profile_creation_module" {
  source = "../../modules/module_traffic-manager-profile-creation/profile"

  #Resource Group
  resource_group_name     = var.resource_group_name
  resource_group_location = var.resource_group_location

  #Tags
  tags = var.tags

  #Storage Group
  storage_account_name             = var.storage_account_name
  storage_account_tier             = var.storage_account_tier
  storage_account_replication_type = var.storage_account_replication_type

  #Traffic Manager
  traffic_manager_profile_name = var.traffic_manager_profile_name
  traffic_routing_method       = var.traffic_routing_method
  traffic_view_enabled         = var.traffic_view_enabled
  ttl                          = var.ttl
  protocol                     = var.protocol
  port                         = var.port
  path                         = var.path
  interval_in_seconds          = var.interval_in_seconds
  timeout_in_seconds           = var.timeout_in_seconds
  tolerated_number_of_failures = var.tolerated_number_of_failures
}

#-------------------------------MODULE FOR ROLE ASSIGNMENT----------------------------------------------#

module "role_assignemt" {
  source                  = "../../modules/module_traffic-manager-profile-creation/rbac"
  resource_group_name     = module.traffic_manager_profile_creation_module.resource_group_name
  resource_group_id       = module.traffic_manager_profile_creation_module.resource_group_id
  resource_group_location = module.traffic_manager_profile_creation_module.resource_group_location
  scope                   = module.traffic_manager_profile_creation_module.resource_id
  role_definition_name    = var.role_definition

}

#--------------------------------MODULE FOR LOGGING AND MONITORING--------------------------------------#

module "diag_monitoring" {
  source                  = "../../modules/module_traffic-manager-profile-creation/logging_and_monitoring"
  resource_group_name     = module.traffic_manager_profile_creation_module.resource_group_name
  resource_group_id       = module.traffic_manager_profile_creation_module.resource_group_id
  resource_group_location = module.traffic_manager_profile_creation_module.resource_group_location
  storage_account_id      = module.traffic_manager_profile_creation_module.storage_id
  resource_id             = module.traffic_manager_profile_creation_module.resource_id
}
