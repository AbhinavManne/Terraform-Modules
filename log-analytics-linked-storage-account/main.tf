#Reference to create log analytics linked storage account module
module "module_log_analytics" {
  source                        = "../../modules/module_log-analytics-linked-storage-account/log_analytics"
  resource_group                = var.resource_group
  storage_account               = var.storage_account
  account_tier                  = var.account_tier
  account_replication_type      = var.account_replication_type
  log_analytics_workspace       = var.log_analytics_workspace
  log_sku                       = var.log_sku
  retention_in_days             = var.retention_in_days
  internet_ingestion_enabled    = var.internet_ingestion_enabled
  internet_query_enabled        = var.internet_query_enabled
  tags                          = var.tags
  data_source_type              = var.data_source_type
  log_storage_insights_name     = var.log_storage_insights_name
  log_data_export_name          = var.log_data_export_name
  log_data_export_table_names   = var.log_data_export_table_names
  log_data_export_enabled       = var.log_data_export_enabled
  log_saved_search              = var.log_saved_search
  log_saved_search_category     = var.log_saved_search_category
  log_saved_search_display_name = var.log_saved_search_display_name
  log_saved_search_query        = var.log_saved_search_query
  automation_account            = var.automation_account
  automation_account_sku_name   = var.automation_account_sku_name
  solution_name                 = var.solution_name
  plan_publisher                = var.plan_publisher
  plan_product                  = var.plan_product
}

#Reference to module that provisions diagnostic settings of a particular resource
module "log_monitoring" {
  source                  = "../../modules/module_log-analytics-linked-storage-account/diag_setting"
  resource_id             = module.module_log_analytics.log_id
  storage_account_id      = module.module_log_analytics.storage_account_id
  resource_group_name     = module.module_log_analytics.resource_group
  resource_group_id       = module.module_log_analytics.resource_group_id
  resource_group_location = module.module_log_analytics.resource_group_location
}

#Reference to module that provisions role assignment for each resource
module "module_resource-role-assignment" {
  #count = length(data.azurerm_resources.example.resources)
  #resource_group_name  =   
  source               = "../../modules/module_log-analytics-linked-storage-account/rbac_module"
  scope                = module.module_log_analytics.log_id
  role_definition_name = var.role_definition_name

}

#---------------------------------------------------------------------------------------------------------#