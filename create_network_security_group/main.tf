#Reference to resource group creation module
module "module_create_resource_group" {
  source                = "../../modules/module_resource-group-creation/resource_group"
  create_resource_group = var.create_resource_group
  resource_group_name   = var.resource_group_name
  location              = var.location
  tags                  = var.tags

}

module "network_security_group" {

  source                = "../../modules/module_network-security-group"
  location              = module.module_create_resource_group.resource_group_location
  resource_group_name   = module.module_create_resource_group.resource_group_name
  csv_file_name_for_NSG = "../../modules/module_network-security-group/nsg_rules.csv"
  tags                  = var.tags
}

module "alert" {
  count = length(module.network_security_group.nsg_ids)
  source                   = "../../modules/module_alert"
  action_group_name        = "${var.action_group_name}-${count.index}"
  resource_group_name      = var.resource_group_name
  resource_group_location  = var.location
  short_name               = "${var.short_name}-${count.index}"
  action_group_rule_name   = "${var.action_group_rule_name}-${count.index}"
  scope_type               = var.scope_type
  resource_id              = module.network_security_group.all_nsg_id[count.index]
  activity_log_alert_name  = "${var.activity_log_alert_name}-${count.index}"
  resource_group_id        = module.module_create_resource_group.resource_group_id
  operation_name_log_alert = var.operation_name_log_alert
  category_log_alert       = var.category_log_alert
  metric_alert_name        = "${var.metric_alert_name}-${count.index}"
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
  count = length(module.network_security_group.nsg_ids)
  source                          = "../../modules/module_diagnostics_settings"
  enable_log_monitoring           = var.enable_log_monitoring
  diag_name                       = "${var.diag_name}-${count.index}"
  target_resource_id              = module.network_security_group.all_nsg_id[count.index]
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
