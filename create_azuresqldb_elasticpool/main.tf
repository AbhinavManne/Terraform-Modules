module "sql" {
  source = "../../modules/module_elasticpool_azuresql"

  client_name         = var.client_name
  environment         = var.environment
  location            = var.location
  location_short      = var.location_short
  resource_group_name = var.resource_group_name
  stack               = var.stack

  databases_names = ["users", "documents"]

  administrator_login = var.administrator_login
  #administrator_password = var.administrator_password

  sku = {
    tier     = "Standard"
    capacity = "100"
  }

  elastic_pool_max_size = "50"

  # This can costs you money https://docs.microsoft.com/en-us/azure/sql-database/sql-database-advanced-data-security
  enable_advanced_data_security = true

  enable_logging = true

  #logs_storage_account_id = data.terraform_remote_state.run.logs_storage_account_id
  #logs_log_analytics_workspace_id = data.terraform_remote_state.run.log_analytics_id
}