#Reference to resource group creation module
module "resource_group" {
  source                           = "../../modules/module_resource-group-creation/resource_group"
  create_resource_group            = var.create_resource_group
  resource_group_name              = var.resource_group_name
  location                         = var.location
  tags                             = var.tags

}

#Reference to create log analytics module
module "log_analytics" {
  source                        = "../../modules/module_log-analytics-workspace-creation/log_analytics"
  log_analytics_workspace       = var.log_analytics_workspace  
  resource_group_name           = module.resource_group.resource_group_name
  location                      = module.resource_group.resource_group_location
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
