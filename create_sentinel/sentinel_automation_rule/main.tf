module "log_analytics_module" {
  source                        = "../../../modules/module_log-analytics-workspace-creation/log_analytics"
  log_analytics_workspace       = var.log_analytics_workspace  
  resource_group_name           = var.resource_group_name
  location                      = var.resource_group_location
  log_sku                       = var.log_sku
  retention_in_days             = var.retention_in_days
  internet_ingestion_enabled    = var.internet_ingestion_enabled
  internet_query_enabled        = var.internet_query_enabled
  reservation_capacity_in_gb_per_day = var.reservation_capacity_in_gb_per_day
  daily_quota_gb                = var.daily_quota_gb
  tags                          = var.tags
  create_log_analytics_solution = var.create_log_analytics_solution
  solution_name                 = var.solution_name
  plan_publisher                = var.plan_publisher
  plan_product                  = var.plan_product
  promotion_code                = var.promotion_code
}

module "sentinel_automation_rule_module" {
  source = "../../../modules/module_sentinel/sentinel_automation_rule"
  
  log_analytics_workspace       = var.log_analytics_workspace  
  resource_group_name           = var.resource_group_name
  resource_group_location = var.resource_group_location
  log_sku                       = var.log_sku
  retention_in_days             = var.retention_in_days
  internet_ingestion_enabled    = var.internet_ingestion_enabled
  internet_query_enabled        = var.internet_query_enabled
  reservation_capacity_in_gb_per_day = var.reservation_capacity_in_gb_per_day
  daily_quota_gb                = var.daily_quota_gb
  tags                          = var.tags
  create_log_analytics_solution = var.create_log_analytics_solution
  solution_name                 = var.solution_name
  plan_publisher                = var.plan_publisher
  plan_product                  = var.plan_product
  promotion_code                = var.promotion_code

  automation_rule_config = {
    log_analytics_workspace_id = module.log_analytics_module.log_id
    action_incident = {
      order                  = var.automation_rule_config.action_incident.order
      status                 = var.automation_rule_config.action_incident.status
      classification         = var.automation_rule_config.action_incident.classification
      classification_comment = var.automation_rule_config.action_incident.classification_comment
      labels                 = var.automation_rule_config.action_incident.labels
      owner_id               = var.automation_rule_config.action_incident.owner_id
      severity               = var.automation_rule_config.action_incident.severity
    }
    action_playbook = {
      logic_app_id = var.automation_rule_config.action_playbook.logic_app_id
      order        = var.automation_rule_config.action_playbook.order
      tenant_id    = var.automation_rule_config.action_playbook.tenant_id
    }
    condition = {
      operator = var.automation_rule_config.condition.operator
      property = var.automation_rule_config.condition.property
      values   = var.automation_rule_config.condition.values
    }
    display_name = var.automation_rule_config.display_name
    enabled      = var.automation_rule_config.enabled
    expiration   = var.automation_rule_config.expiration
    name         = var.automation_rule_config.name
    order        = var.automation_rule_config.order
  }
}