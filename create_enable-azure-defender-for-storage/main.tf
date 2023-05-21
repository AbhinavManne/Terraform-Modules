#Reference to module for enabling Azure Defender for Storage
module "enable_azure_defender_for_storage_module" {
  source                                         = "../../modules/module_enable-azure-defender-for-storage"
  storage_account_name                           = var.storage_account_name
  location                                       = var.location
  resource_group                                 = var.resource_group
  tags                                           = var.tags
  account_tier                                   = var.account_tier
  access_tier                                    = var.access_tier
  replication_type                               = var.replication_type
  enable_large_file_share                        = var.enable_large_file_share
  enable_hns                                     = var.enable_hns
  enable_https_traffic_only                      = var.enable_https_traffic_only
  min_tls_version                                = var.min_tls_version
  allow_blob_public_access                       = var.allow_blob_public_access
  access_list                                    = var.access_list
  traffic_bypass                                 = var.traffic_bypass
  blob_cors                                      = var.blob_cors
  enable_static_website                          = var.enable_static_website
  index_path                                     = var.index_path
  custom_404_path                                = var.custom_404_path
  encryption_scopes                              = var.encryption_scopes
  nfsv3_enabled                                  = var.nfsv3_enabled
  default_network_rule                           = var.default_network_rule
  shared_access_key_enabled                      = var.shared_access_key_enabled
  create_resource_group                          = var.create_resource_group
  network_rules                                  = var.network_rules
  length                                         = var.length
  special                                        = var.special
  upper                                          = var.upper
  vnet_name                                      = var.vnet_name
  address_space                                  = var.address_space
  subnet_name                                    = var.subnet_name
  address_prefixes                               = var.address_prefixes
  service_endpoints                              = var.service_endpoints
  enforce_private_link_endpoint_network_policies = var.enforce_private_link_endpoint_network_policies
  default_action                                 = var.default_action
  ip_rules                                       = var.ip_rules
  bypass                                         = var.bypass
  source_var                                     = var.source_var
  private_endpoint_name                          = var.private_endpoint_name
  private_service_connection_name                = var.private_service_connection_name
  manual_connection                              = var.manual_connection
  subresource_name                               = var.subresource_name
  deployment_mode                                = var.deployment_mode
  template_deployment_name                       = var.template_deployment_name
}


module "storage_account_monitoring" {
  source                  = "../../modules/module_enable-azure-defender-for-storage/logging_and_monitoring"
  resource_id             = module.enable_azure_defender_for_storage_module.resource_id
  storage_account_id      = module.enable_azure_defender_for_storage_module.storage_account_id
  resource_group_name     = module.enable_azure_defender_for_storage_module.resource_group_name
  resource_group_id       = module.enable_azure_defender_for_storage_module.resource_group_id
  resource_group_location = module.enable_azure_defender_for_storage_module.resource_group_location

}

module "module_resource-role-assignment" {
  source               = "../../modules/module_enable-azure-defender-for-storage/rbac"
  resource_group_name  = module.enable_azure_defender_for_storage_module.resource_group_name
  scope                = module.enable_azure_defender_for_storage_module.resource_id
  role_definition_name = var.role_definition_name

}