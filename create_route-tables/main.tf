#Reference to resource group creation module
module "create_resource_group" {
  source                = "../../modules/module_resource-group-creation/resource_group"
  create_resource_group = var.create_resource_group
  resource_group_name   = var.resource_group_name
  location              = var.location
  tags                  = var.tags

}

module "route_table" {

  source                        = "../../modules/module_route-tables"
  csv_file_name_for_Route_Table = "../../modules/module_route-tables/routes.csv"
  location                      = module.create_resource_group.resource_group_location
  resource_group_name           = module.create_resource_group.resource_group_name
  disable_bgp_route_propagation = var.disable_bgp_route_propagation
  tags                          = var.tags
}

module "alert" {
  depends_on = [
    module.route_table
  ]
  count = length(module.route_table.rt_ids)
  source = "../../modules/module_alert"
  action_group_name       = var.action_group_name
  resource_group_name     = var.resource_group_name
  resource_group_location = var.location
  short_name              = var.short_name
  action_group_rule_name  = var.action_group_rule_name
  scope_type              = var.scope_type
  resource_id             = module.route_table.rt_ids[count.index]
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
