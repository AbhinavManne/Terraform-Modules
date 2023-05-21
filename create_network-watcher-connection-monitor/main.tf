module "network-watcher" {
  source = "../../modules/module_network-watcher-connection-monitor/connection-monitor"

  resource_group                 = var.resource_group
  vnet_name                      = var.vnet_name
  subnet_name                    = var.subnet_name
  network_interface_name         = var.network_interface_name
  network_watcher_name           = var.network_watcher_name
  publisher                      = var.publisher
  virtual_machine_extension_name = var.virtual_machine_extension_name
  type                           = var.type
  type_handler_version           = var.type_handler_version
  auto_upgrade_minor_version     = var.auto_upgrade_minor_version
  log_analytics_workspace_name   = var.log_analytics_workspace_name
  connection_monitor_name        = var.connection_monitor_name
  endpoint_name1                 = var.endpoint_name1
  endpoint_name2                 = var.endpoint_name2
  endpoint_address               = var.endpoint_address
  item_type                      = var.item_type
  filter_type                    = var.filter_type
  application_gateway_name       = var.application_gateway_name
  tc_name                        = var.tc_name
  tc_protocol                    = var.tc_protocol
  tc_port                        = var.tc_port
  tc_frequency                   = var.tc_frequency
  test_group_name                = var.test_group_name
  destination_endpoints          = var.destination_endpoints
  source_endpoints               = var.source_endpoints
  test_configuration_names       = var.test_configuration_names
  virtual_machine                = var.virtual_machine
  tags                           = var.tags
}

module "monitoring" {

  source                  = "../../modules/module_network-watcher-connection-monitor/logging_and_monitoring"
  resource_id             = module.network-watcher.resource_id
  resource_group_name     = module.network-watcher.resource_group_name
  resource_group_id       = module.network-watcher.resource_group_id
  resource_group_location = module.network-watcher.resource_group_location
}

module "module_resource-role-assignment" {
  source                  = "../../modules/module_network-watcher-connection-monitor/rbac"
  resource_group_name     = module.network-watcher.resource_group_name
  scope                   = module.network-watcher.resource_id
  resource_group_id       = module.network-watcher.resource_group_id
  resource_group_location = module.network-watcher.resource_group_location
  role_definition_name    = var.role_definition_name
}