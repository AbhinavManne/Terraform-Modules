module "backuppolicy_module" {
  source = "../../modules/module_cdn/cdn"

  resource_group = var.resource_group
  cdn_profile    = var.cdn_profile
  tags           = var.tags
  //Resource Group
  location              = var.location
  create_resource_group = var.create_resource_group
  resource_group_name   = var.resource_group_name

  //Storage Group
  storage_account_name             = var.storage_account_name
  storage_account_tier             = var.storage_account_tier
  storage_account_replication_type = var.storage_account_replication_type
  cdn_endpoint                     = var.cdn_endpoint
  sku                              = var.sku
  origin                           = var.origin
  host_name                        = var.host_name
  optimization_type                = var.optimization_type
  delivery_rule                    = var.delivery_rule
  relative_path                    = var.relative_path
  action                           = var.action
  country_codes                    = var.country_codes
  duration                         = var.duration
  behavior                         = var.behavior
  order                            = var.order
  operator                         = var.operator
  match_values                     = var.match_values
  transforms                       = var.transforms
  querystring_caching_behaviour    = var.querystring_caching_behaviour
  is_compression_enabled           = var.is_compression_enabled
  content_types_to_compress        = var.content_types_to_compress
}

#-------------------------------MODULE FOR ROLE ASSIGNMENT----------------------------------------------#

module "role_assignemt" {
  source                  = "../../modules/module_cdn/rbac"
  resource_group_name     = module.backuppolicy_module.resource_group_name
  resource_group_id       = module.backuppolicy_module.resource_group_id
  resource_group_location = module.backuppolicy_module.resource_group_location
  scope                   = module.backuppolicy_module.resource_id
  role_definition_name    = var.role_definition

}

#--------------------------------MODULE FOR LOGGING AND MONITORING--------------------------------------#

module "diag_monitoring" {
  source                  = "../../modules/module_cdn/logging_and_monitoring"
  resource_group_name     = module.backuppolicy_module.resource_group_name
  resource_group_id       = module.backuppolicy_module.resource_group_id
  resource_group_location = module.backuppolicy_module.resource_group_location
  storage_account_id      = module.backuppolicy_module.storage_id
  resource_id             = module.backuppolicy_module.resource_id
}
