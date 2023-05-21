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

module "sentinel_data_connector_module" {
  source = "../../../modules/module_sentinel/sentinel_data_connector"

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

  data_connector_aws_cloud_trail_config = {
    log_analytics_workspace_id = module.log_analytics_module.log_id
    name         = var.data_connector_aws_cloud_trail_config.name
    aws_role_arn = var.data_connector_aws_cloud_trail_config.aws_role_arn
  }

  data_connector_aws_s3_config = {
    log_analytics_workspace_id = module.log_analytics_module.log_id
    name              = var.data_connector_aws_s3_config.name
    aws_role_arn      = var.data_connector_aws_s3_config.aws_role_arn
    destination_table = var.data_connector_aws_s3_config.destination_table
    sqs_urls          = var.data_connector_aws_s3_config.sqs_urls
  }

  data_connector_azure_active_directory_config = {
    log_analytics_workspace_id = module.log_analytics_module.log_id
    name      = var.data_connector_azure_active_directory_config.name
    tenant_id = var.data_connector_azure_active_directory_config.tenant_id
  }

  data_connector_azure_advanced_threat_protection_config = {
    log_analytics_workspace_id = module.log_analytics_module.log_id
    name      = var.data_connector_azure_advanced_threat_protection_config.name
    tenant_id = var.data_connector_azure_advanced_threat_protection_config.tenant_id
  }

  data_connector_azure_security_center_config = {
    log_analytics_workspace_id = module.log_analytics_module.log_id
    name            = var.data_connector_azure_security_center_config.name
    subscription_id = var.data_connector_azure_security_center_config.subscription_id
  }

  data_connector_dynamics_365_config = {
    log_analytics_workspace_id = module.log_analytics_module.log_id
    name      = var.data_connector_dynamics_365_config.name
    tenant_id = var.data_connector_dynamics_365_config.tenant_id
  }

  data_connector_iot_config = {
    log_analytics_workspace_id = module.log_analytics_module.log_id
    name            = var.data_connector_iot_config.name
    subscription_id = var.data_connector_iot_config.subscription_id
  }

  data_connector_microsoft_cloud_app_security_config = {
    log_analytics_workspace_id = module.log_analytics_module.log_id
    name           = var.data_connector_microsoft_cloud_app_security_config.name
    alerts_enabled = var.data_connector_microsoft_cloud_app_security_config.alerts_enabled // One of either alerts_enabled or discovery_logs_enabled has to be specified.
    tenant_id      = var.data_connector_microsoft_cloud_app_security_config.tenant_id
  }

  data_connector_microsoft_defender_advanced_threat_protection_config = {
    log_analytics_workspace_id = module.log_analytics_module.log_id
    name      = var.data_connector_microsoft_defender_advanced_threat_protection_config.name
    tenant_id = var.data_connector_microsoft_defender_advanced_threat_protection_config.tenant_id
  }

  data_connector_office_365_config = {
    log_analytics_workspace_id = module.log_analytics_module.log_id
    name               = var.data_connector_office_365_config.name
    exchange_enabled   = var.data_connector_office_365_config.exchange_enabled
    sharepoint_enabled = var.data_connector_office_365_config.sharepoint_enabled
    teams_enabled      = var.data_connector_office_365_config.teams_enabled
    tenant_id          = var.data_connector_office_365_config.tenant_id
  }

  data_connector_office_365_project_config = {
    log_analytics_workspace_id = module.log_analytics_module.log_id
    name      = var.data_connector_office_365_project_config.name
    tenant_id = var.data_connector_office_365_project_config.tenant_id
  }

  data_connector_office_atp_config = {
    log_analytics_workspace_id = module.log_analytics_module.log_id
    name      = var.data_connector_office_atp_config.name
    tenant_id = var.data_connector_office_atp_config.tenant_id
  }

  data_connector_office_irm_config = {
    log_analytics_workspace_id = module.log_analytics_module.log_id
    name      = var.data_connector_office_irm_config.name
    tenant_id = var.data_connector_office_irm_config.tenant_id
  }

  data_connector_office_power_bi_config = {
    log_analytics_workspace_id = module.log_analytics_module.log_id
    name      = var.data_connector_office_power_bi_config.name
    tenant_id = var.data_connector_office_power_bi_config.tenant_id
  }

  data_connector_threat_intelligence_config = {
    log_analytics_workspace_id = module.log_analytics_module.log_id
    name      = var.data_connector_threat_intelligence_config.name
    tenant_id = var.data_connector_threat_intelligence_config.tenant_id
  }
}