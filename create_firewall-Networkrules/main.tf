module "firewall-networkrules_module" {
  source = "../../modules/module_firewall-Networkrules/firewall-networkrules"
  depends_on = [
    module.firewall_module
  ]
  resource_group_name = var.resource_group_name
  firewall_name       = var.firewall_name
  csv_file_name       = var.csv_file_name

}

module "module_create_resource_group" {
  source                = "../../modules/module_resource-group-creation/resource_group"
  create_resource_group = var.create_resource_group
  resource_group_name   = var.resource_group_name
  location              = var.location
  tags                  = var.tags
}

module "firewall_module" {
  source                                           = "../../modules/module_firewall/firewall"
  resource_group_name                              = var.resource_group_name
  location                                         = var.location
  firewall_name                                    = var.firewall_name
  tags                                             = var.tags
  sku_name                                         = var.sku_name
  sku_tier                                         = var.sku_tier
  firewall_policy_id                               = var.firewall_policy_id
  dns_servers                                      = var.dns_servers
  private_ip_ranges                                = var.private_ip_ranges
  threat_intel_mode                                = var.threat_intel_mode
  zones                                            = var.zones
  ip_configuration_name                            = var.ip_configuration_name
  subnet_id_ip_configuration                       = var.subnet_id_ip_configuration
  public_ip_address_id_ip_configuration            = var.public_ip_address_id_ip_configuration
  management_ip_configuration_name                 = var.management_ip_configuration_name
  subnet_id_management_ip_configuration            = var.subnet_id_management_ip_configuration
  public_ip_address_id_management_ip_configuration = var.public_ip_address_id_management_ip_configuration
  virtual_hub_id                                   = var.virtual_hub_id
  public_ip_count                                  = var.public_ip_count
}

module "alert" {
  source                   = "../../modules/module_alert"
  action_group_name        = var.action_group_name
  resource_group_name      = module.module_create_resource_group.resource_group_name
  resource_group_location  = module.module_create_resource_group.resource_group_location
  short_name               = var.short_name
  action_group_rule_name   = var.action_group_rule_name
  scope_type               = var.scope_type
  resource_id              = module.firewall_module.firewall_id
  activity_log_alert_name  = var.activity_log_alert_name
  resource_group_id        = module.module_create_resource_group.resource_group_id
  operation_name_log_alert = var.operation_name_log_alert
  category_log_alert       = var.category_log_alert
  metric_alert_name        = var.metric_alert_name
  storage_account_id       = var.storage_account_id
  metric_namespace         = var.metric_namespace
  metric_name              = var.metric_name
  aggregation              = var.aggregation
  operator                 = var.operator
  threshold                = var.threshold
  dimension_name           = var.dimension_name
  dimension_operator       = var.dimension_operator
  values                   = var.values
}

module "diag_settings" {
  source                          = "../../modules/module_diagnostics_settings"
  enable_log_monitoring           = var.enable_log_monitoring
  diag_name                       = var.diag_name
  target_resource_id              = module.firewall_module.firewall_id
  log_analytics_workspace_id      = var.log_analytics_workspace_id
  log_analytics_destination_type  = var.log_analytics_destination_type
  storage_account_id              = var.storage_account_id
  eventhub_name                   = var.eventhub_name
  eventhub_authorization_rule_id  = var.eventhub_authorization_rule_id
  log_enabled                     = var.log_enabled
  log_retention_policy_enabled    = var.log_retention_policy_enabled
  log_retention_days              = var.log_retention_days
  metric_retention_policy_enabled = var.metric_retention_policy_enabled
  metric_retention_days           = var.metric_retention_days
}

