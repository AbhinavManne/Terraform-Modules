module "create_resource_group" {
  source                = "../../modules/module_resource-group-creation/resource_group"
  create_resource_group = var.create_resource_group
  resource_group_name   = var.resource_group_name
  location              = var.location
  tags                  = var.tags

}

module "virtual_network" {
  source                       = "../../modules/module_network_module"
  resource_group_name          = module.create_resource_group.resource_group_name
  location                     = module.create_resource_group.resource_group_location
  virtual_network              = var.virtual_network
  address_space                = var.address_space
  dns_servers                  = var.dns_servers
  
  bgp_community = var.bgp_community
  edge_zone = var.edge_zone
  enable_flow_timeout_in_minutes = var.enable_flow_timeout_in_minutes
  flow_timeout_in_minutes = var.flow_timeout_in_minutes
  
  tags                         = var.tags
  enable_ddos_protection_plan = var.enable_ddos_protection_plan
  id_of_existing_ddos = var.id_of_existing_ddos
  
  network_ddos_protection_plan = var.network_ddos_protection_plan

  firewall_subnet_address_prefix = var.firewall_subnet_address_prefix
  firewall_service_endpoints     = var.firewall_service_endpoints

  gateway_subnet_address_prefix = var.gateway_subnet_address_prefix
  gateway_service_endpoints     = var.gateway_service_endpoints

  subnet_names                                          = var.subnet_names
  subnet_prefixes                                       = var.subnet_prefixes
  subnet_service_endpoints                              = var.subnet_service_endpoints
  private_endpoint_network_policies_enabled = var.private_endpoint_network_policies_enabled
  private_link_service_network_policies_enabled = var.private_link_service_network_policies_enabled
  service_endpoint_policy_ids = var.service_endpoint_policy_ids
  subnet_delegation = var.subnet_delegation

  map_of_subnet_name_and_nsg_id = var.map_of_subnet_name_and_nsg_id
  map_of_subnet_name_and_route_table_id = var.map_of_subnet_name_and_route_table_id

  public_ip_name    = var.public_ip_name
  allocation_method = var.allocation_method
  sku               = var.sku
  firewall_name     = var.firewall_name
  threat_intel_mode = var.threat_intel_mode
  firewall_sku_name = var.firewall_sku_name
  firewall_sku_tier = var.firewall_sku_tier
  ip_config         = var.ip_config
}

module "alert" {
  source = "../../modules/module_alert"
  action_group_name       = var.action_group_name
  resource_group_name     = var.resource_group_name
  resource_group_location = var.location
  short_name              = var.short_name
  action_group_rule_name  = var.action_group_rule_name
  scope_type              = var.scope_type
  resource_id             = module.virtual_network.virtual_network_id
  activity_log_alert_name = var.activity_log_alert_name
  resource_group_id       = module.create_resource_group.resource_group_id
  operation_name_log_alert = var.operation_name_log_alert
  category_log_alert      = var.category_log_alert
  metric_alert_name       = var.metric_alert_name
  storage_account_id      = var.storage_account_id
  metric_namespace        = var.metric_namespace
  metric_name             = var.metric_name
  aggregation             = var.aggregation
  operator                = var.operator
  threshold               = var.threshold
  dimension_name          = var.dimension_name
  dimension_operator      = var.dimension_operator
  values                  = var.values
}

module "diag_settings" {
  source                         = "../../modules/module_diagnostics_settings"
  enable_log_monitoring          = var.enable_log_monitoring
  diag_name                      = var.diag_name
  target_resource_id             = module.virtual_network.virtual_network_id
  log_analytics_workspace_id     = var.log_analytics_workspace_id
  log_analytics_destination_type = var.log_analytics_destination_type
  storage_account_id             = var.storage_account_id
  eventhub_name                  = var.eventhub_name
  eventhub_authorization_rule_id = var.eventhub_authorization_rule_id
  log_enabled                    = var.log_enabled
  log_retention_policy_enabled   = var.log_retention_policy_enabled
  log_retention_days             = var.log_retention_days
  metric_retention_policy_enabled= var.metric_retention_policy_enabled
  metric_retention_days          = var.metric_retention_days
}
