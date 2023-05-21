#Reference to traffic manager endpoint creation module
module "traffic_manager_endpoint_creation_module" {
  source = "../../modules/module_traffic-manager-endpoint-creation/endpoints"

  #Resource Group
  resource_group_name     = var.resource_group_name
  resource_group_location = var.resource_group_location

  #Tags
  tags = var.tags

  #Storage Group
  storage_account_name             = var.storage_account_name
  storage_account_tier             = var.storage_account_tier
  storage_account_replication_type = var.storage_account_replication_type

  #Public Ip
  public_ip1_name              = var.public_ip1_name
  public_ip1_allocation_method = var.public_ip1_allocation_method
  domain_name_label            = var.domain_name_label
  public_ip2_name              = var.public_ip2_name
  public_ip2_allocation_method = var.public_ip2_allocation_method
  domain_name_label1           = var.domain_name_label1

  #Traffic Manager
  traffic_manager_profile_name = var.traffic_manager_profile_name
  traffic_routing_method       = var.traffic_routing_method
  traffic_view_enabled         = var.traffic_view_enabled

  #DNS config
  dns_config_name = var.dns_config_name

  #End Point
  azure_end_point1_name = var.azure_end_point1_name
  azure_end_point2_name = var.azure_end_point2_name


}

#-------------------------------MODULE FOR ROLE ASSIGNMENT----------------------------------------------#

module "role_assignemt" {
  source                  = "../../modules/module_traffic-manager-endpoint-creation/rbac"
  resource_group_name     = module.traffic_manager_endpoint_creation_module.resource_group_name
  resource_group_id       = module.traffic_manager_endpoint_creation_module.resource_group_id
  resource_group_location = module.traffic_manager_endpoint_creation_module.resource_group_location
  scope                   = module.traffic_manager_endpoint_creation_module.resource_id
  role_definition_name    = var.role_definition

}

#--------------------------------MODULE FOR LOGGING AND MONITORING--------------------------------------#

module "diag_monitoring" {
  source                  = "../../modules/module_traffic-manager-endpoint-creation/logging_and_monitoring"
  resource_group_name     = module.traffic_manager_endpoint_creation_module.resource_group_name
  resource_group_id       = module.traffic_manager_endpoint_creation_module.resource_group_id
  resource_group_location = module.traffic_manager_endpoint_creation_module.resource_group_location
  storage_account_id      = module.traffic_manager_endpoint_creation_module.storage_id
  resource_id             = module.traffic_manager_endpoint_creation_module.resource_id
}


