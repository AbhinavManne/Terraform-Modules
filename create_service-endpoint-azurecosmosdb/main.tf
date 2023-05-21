#Reference to Azure CosmosDB account service endpoint module
module "service_endpoint_azurecosmosdb_module" {
  source = "../../modules/module_service-endpoint-azurecosmosdb/service_endpoint"

  resource_group                       = var.resource_group
  create_resource_group                = var.create_resource_group
  location                             = var.location
  virtual_network                      = var.virtual_network
  address_space                        = var.address_space
  dns_servers                          = var.dns_servers
  enable_ddos_protection_plan1         = var.enable_ddos_protection_plan1
  tags                                 = var.tags
  network_ddos_protection_plan         = var.network_ddos_protection_plan
  subnet_name                          = var.subnet_name
  subnet_address_prefixes              = var.subnet_address_prefixes
  service_endpoints                    = var.service_endpoints
  public_ip                            = var.public_ip
  allocation_method                    = var.allocation_method
  sku                                  = var.sku
  firewall_name                        = var.firewall_name
  threat_intel_mode                    = var.threat_intel_mode
  ip_config                            = var.ip_config
  cosmosdb_account_name                = var.cosmosdb_account_name
  offer_type                           = var.offer_type
  kind                                 = var.kind
  enable_automatic_failover            = var.enable_automatic_failover
  is_virtual_network_filter_enabled    = var.is_virtual_network_filter_enabled
  consistency_level                    = var.consistency_level
  max_interval_in_seconds              = var.max_interval_in_seconds
  max_staleness_prefix                 = var.max_staleness_prefix
  geo_location_failover_priority       = var.geo_location_failover_priority
  ignore_missing_vnet_service_endpoint = var.ignore_missing_vnet_service_endpoint

}

#Reference to module that provisions role assignment for each resource
module "module_resource-role-assignment" {
  source               = "../../modules/module_service-endpoint-azurecosmosdb/rbac"
  scope                = module.service_endpoint_azurecosmosdb_module.resource_id
  role_definition_name = var.role_definition_name

}

#Reference to module that provisions diagnostic settings of a particular resource
module "resource_monitoring" {
  source                  = "../../modules/module_service-endpoint-azurecosmosdb/diag_setting"
  resource_id             = module.service_endpoint_azurecosmosdb_module.resource_id
  resource_group_name     = module.service_endpoint_azurecosmosdb_module.resource_group
  resource_group_id       = module.service_endpoint_azurecosmosdb_module.resource_group_id
  resource_group_location = module.service_endpoint_azurecosmosdb_module.resource_group_location
}