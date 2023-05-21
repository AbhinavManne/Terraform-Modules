module "storage" {

  source = "../../modules/module_storage-container/storage-container"

  storage_account_name                 = var.storage_account_name
  location                             = var.location
  resource_group                       = var.resource_group
  tags                                 = var.tags
  account_tier                         = var.account_tier
  access_tier                          = var.access_tier
  replication_type                     = var.replication_type
  enable_large_file_share              = var.enable_large_file_share
  enable_hns                           = var.enable_hns
  enable_https_traffic_only            = var.enable_https_traffic_only
  min_tls_version                      = var.min_tls_version
  allow_blob_public_access             = var.allow_blob_public_access
  access_list                          = var.access_list
  service_endpoints                    = var.service_endpoints
  traffic_bypass                       = var.traffic_bypass
  blob_cors                            = var.blob_cors
  enable_static_website                = var.enable_static_website
  index_path                           = var.index_path
  custom_404_path                      = var.custom_404_path
  encryption_scopes                    = var.encryption_scopes
  nfsv3_enabled                        = var.nfsv3_enabled
  default_network_rule                 = var.default_network_rule
  shared_access_key_enabled            = var.shared_access_key_enabled
  create_resource_group                = var.create_resource_group
  skuname                              = var.skuname
  blob_soft_delete_retention_days      = var.blob_soft_delete_retention_days
  last_access_time_enabled             = var.last_access_time_enabled
  change_feed_enabled                  = var.change_feed_enabled
  network_rules                        = var.network_rules
  containers_list                      = var.containers_list
  enable_versioning                    = var.enable_versioning
  container_soft_delete_retention_days = var.container_soft_delete_retention_days

}

#---------module for logging and monitoring--------#
module "diag_monitoring" {
  source                  = "../../modules/module_storage-container/logging_and_monitoring"
  resource_group_name     = module.storage.resource_group
  resource_group_id       = module.storage.resource_group_id
  resource_group_location = module.storage.resource_group_location
  storage_account_id      = module.storage.storage_id
}

// --------Module for RBAC ----------------------//
module "module_resource-role-assignment" {
  source                  = "../../modules/module_storage-container/rbac"
  resource_group_name     = module.storage.resource_group
  resource_group_id       = module.storage.resource_group_id
  resource_group_location = module.storage.resource_group_location
  scope                   = module.storage.storage_id
  role_definition_name    = var.role_definition_name
}