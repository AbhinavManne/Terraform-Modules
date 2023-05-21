#Reference to storage service endpoint module
module "service_endpoint_storage_module" {
  source = "../../modules/module_service-endpoint-storage/storage_endpoint"

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
  storage_account_name                 = var.storage_account_name
  network_rule_default_action          = var.network_rule_default_action
  ip_rules                             = var.ip_rules
  network_rule_bypass                  = var.network_rule_bypass
  
}

#Reference to module that provisions role assignment for each resource
module "module_resource-role-assignment" {
  source               = "../../modules/module_service-endpoint-storage/rbac"
  scope                = module.service_endpoint_storage_module.resource_id
  role_definition_name = var.role_definition_name

}

#Reference to module that provisions diagnostic settings of a particular resource
module "resource_monitoring" {
  source                  = "../../modules/module_service-endpoint-storage/diag_setting"
  resource_id             = module.service_endpoint_storage_module.resource_id
  resource_group_name     = module.service_endpoint_storage_module.resource_group
  resource_group_id       = module.service_endpoint_storage_module.resource_group_id
  resource_group_location = module.service_endpoint_storage_module.resource_group_location
}
#------------------------------------------------------------------------------------------------------#