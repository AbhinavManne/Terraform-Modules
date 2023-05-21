module "module_hpc_cache" {
  source                  = "../../modules/module_hpc-cache/hpc-cache"
  create_resource_group   = var.create_resource_group
  resource_group          = var.resource_group
  location                = var.location
  virtual_network_name    = var.virtual_network_name
  address_space           = var.address_space
  subnet_name             = var.subnet_name
  address_prefixes        = var.address_prefixes
  hpc_cache_name          = var.hpc_cache_name
  cache_size_in_gb        = var.cache_size_in_gb
  sku_name                = var.sku_name
  policy1                 = var.policy1
  scope                   = var.scope
  access                  = var.access
  storage_account_name    = var.storage_account_name
  account_tier            = var.account_tier
  account_replication_type= var.account_replication_type
  tags                    = var.tags
}

module "hpc_cache_monitoring" {

  source                  = "../../modules/module_hpc-cache/diag_setting"
  resource_id             = module.module_hpc_cache.resource_id
  storage_account_id      = module.module_hpc_cache.storage_account_id
  resource_group_name     = module.module_hpc_cache.resource_group_name
  resource_group_id       = module.module_hpc_cache.resource_group_id
  resource_group_location = module.module_hpc_cache.resource_group_location

}

module "module_resource-role-assignment" {

  source               = "../../modules/module_hpc-cache/rbac"
  resource_group_name  = module.module_hpc_cache.resource_group_name
  scope                = module.module_hpc_cache.resource_id
  role_definition_name = var.role_definition_name

}