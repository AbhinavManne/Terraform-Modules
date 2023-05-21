#Reference to DDoS protection plan creation module
module "create_resource_group" {
  source                = "../../modules/module_resource-group-creation/resource_group"
  create_resource_group = var.create_resource_group
  resource_group_name   = var.resource_group_name
  location              = var.location
  tags                  = var.tags
}

module "ddos_module" {
  for_each = var.ddos
  source = "../../modules/module_ddos-creation"
  ddos_plan_name = each.key
  location = lookup(each.value, "location")
  resource_group_name = module.create_resource_group.resource_group_name
  tags = lookup(each.value, "tags")
}

locals {
  ddos_name_and_ddos_id = {
    for index, d in module.ddos_module :
    d.ddos_name => d.ddos_id
  }
}

module "alert" {
  for_each                 = local.ddos_name_and_ddos_id
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

# output "name" {
#   value = local.ddos_name_and_ddos_id
# }

# output "name1" {
#   value = [
#     for i in module.ddos_module : i.ddos_name
#   ]
# }
