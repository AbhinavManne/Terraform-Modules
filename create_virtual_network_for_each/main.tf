module "create_resource_group" {
  source                = "../../modules/module_resource-group-creation/resource_group"
  create_resource_group = var.create_resource_group
  resource_group_name   = var.resource_group_name
  location              = var.location
  tags                  = var.tags
}
module "vnet" {
  source              = "../../modules/module_virtual_network_for_each"
  location            = module.create_resource_group.resource_group_location
  resource_group_name = module.create_resource_group.resource_group_name
  vnet                = var.vnet
}

module "alert" {
  for_each                 = module.vnet.vnet_name_and_vnet_id
  source                   = "../../modules/module_alert"
  action_group_name        = "${each.key}-${var.action_group_name}"
  resource_group_name      = var.resource_group_name
  resource_group_location  = var.location
  short_name               = "${each.key}-${var.short_name}"
  action_group_rule_name   = "${each.key}-${var.action_group_rule_name}"
  scope_type               = var.scope_type
  resource_id              = each.value
  activity_log_alert_name  = "${each.key}-${var.activity_log_alert_name}"
  resource_group_id        = module.create_resource_group.resource_group_id
  operation_name_log_alert = var.operation_name_log_alert
  category_log_alert       = var.category_log_alert
  metric_alert_name        = "${each.key}-${var.metric_alert_name}"
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
  for_each                        = module.vnet.vnet_name_and_vnet_id
  source                          = "../../modules/module_diagnostics_settings"
  enable_log_monitoring           = var.enable_log_monitoring
  diag_name                       = "${each.key}-${var.diag_name}"
  target_resource_id              = each.value
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
