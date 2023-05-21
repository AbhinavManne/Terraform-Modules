resource "azurerm_sentinel_data_connector_aws_cloud_trail" "data_connector_aws_cloud_trail" {
  name                       = var.data_connector_aws_cloud_trail_config.name
  log_analytics_workspace_id = var.data_connector_aws_cloud_trail_config.log_analytics_workspace_id
  aws_role_arn               = var.data_connector_aws_cloud_trail_config.aws_role_arn
}

resource "azurerm_sentinel_data_connector_aws_s3" "data_connector_aws_s3" {  
  name                       = var.data_connector_aws_s3_config.name
  log_analytics_workspace_id = var.data_connector_aws_s3_config.log_analytics_workspace_id
  aws_role_arn               = var.data_connector_aws_s3_config.aws_role_arn
  destination_table          = var.data_connector_aws_s3_config.destination_table
  sqs_urls                   = var.data_connector_aws_s3_config.sqs_urls
}

resource "azurerm_sentinel_data_connector_azure_active_directory" "data_connector_azure_active_directory" {  
  name                       = var.data_connector_azure_active_directory_config.name
  log_analytics_workspace_id = var.data_connector_azure_active_directory_config.log_analytics_workspace_id
  tenant_id                  = var.data_connector_azure_active_directory_config.tenant_id
}

resource "azurerm_sentinel_data_connector_azure_advanced_threat_protection" "data_connector_azure_advanced_threat_protection" {  
  name                       = var.data_connector_azure_advanced_threat_protection_config.name
  log_analytics_workspace_id = var.data_connector_azure_advanced_threat_protection_config.log_analytics_workspace_id
  tenant_id                  = var.data_connector_azure_advanced_threat_protection_config.tenant_id
}

resource "azurerm_sentinel_data_connector_azure_security_center" "data_connector_azure_security_center" {  
  name                       = var.data_connector_azure_security_center_config.name
  log_analytics_workspace_id = var.data_connector_azure_security_center_config.log_analytics_workspace_id
  subscription_id            = var.data_connector_azure_security_center_config.subscription_id
}

resource "azurerm_sentinel_data_connector_dynamics_365" "data_connector_dynamics_365" {  
  name                       = var.data_connector_dynamics_365_config.name
  log_analytics_workspace_id = var.data_connector_dynamics_365_config.log_analytics_workspace_id
  tenant_id                  = var.data_connector_dynamics_365_config.tenant_id
}

resource "azurerm_sentinel_data_connector_iot" "data_connector_iot" {  
  name                       = var.data_connector_iot_config.name
  log_analytics_workspace_id = var.data_connector_iot_config.log_analytics_workspace_id
  subscription_id            = var.data_connector_iot_config.subscription_id
}

resource "azurerm_sentinel_data_connector_microsoft_cloud_app_security" "data_connector_microsoft_cloud_app_security" {
  name                       = var.data_connector_microsoft_cloud_app_security_config.name
  log_analytics_workspace_id = var.data_connector_microsoft_cloud_app_security_config.log_analytics_workspace_id
  alerts_enabled             = var.data_connector_microsoft_cloud_app_security_config.alerts_enabled // One of either alerts_enabled or discovery_logs_enabled has to be specified.
  tenant_id                  = var.data_connector_microsoft_cloud_app_security_config.tenant_id
}

resource "azurerm_sentinel_data_connector_microsoft_defender_advanced_threat_protection" "data_connector_microsoft_defender_advanced_threat_protection" {
  name                       = var.data_connector_microsoft_defender_advanced_threat_protection_config.name
  log_analytics_workspace_id = var.data_connector_microsoft_defender_advanced_threat_protection_config.log_analytics_workspace_id
  tenant_id                  = var.data_connector_microsoft_defender_advanced_threat_protection_config.tenant_id
}

resource "azurerm_sentinel_data_connector_office_365" "data_connector_office_365" {  
  name                       = var.data_connector_office_365_config.name
  log_analytics_workspace_id = var.data_connector_office_365_config.log_analytics_workspace_id
  exchange_enabled           = var.data_connector_office_365_config.exchange_enabled
  sharepoint_enabled         = var.data_connector_office_365_config.sharepoint_enabled
  teams_enabled              = var.data_connector_office_365_config.teams_enabled
  tenant_id                  = var.data_connector_office_365_config.tenant_id
}

resource "azurerm_sentinel_data_connector_office_365_project" "data_connector_office_365_project" {  
  name                       = var.data_connector_office_365_project_config.name
  log_analytics_workspace_id = var.data_connector_office_365_project_config.log_analytics_workspace_id
  tenant_id                  = var.data_connector_office_365_project_config.tenant_id
}

resource "azurerm_sentinel_data_connector_office_atp" "data_connector_office_atp" {  
  name                       = var.data_connector_office_atp_config.name
  log_analytics_workspace_id = var.data_connector_office_atp_config.log_analytics_workspace_id
  tenant_id                  = var.data_connector_office_atp_config.tenant_id
}

resource "azurerm_sentinel_data_connector_office_irm" "data_connector_office_irm" {  
  name                       = var.data_connector_office_irm_config.name
  log_analytics_workspace_id = var.data_connector_office_irm_config.log_analytics_workspace_id
  tenant_id                  = var.data_connector_office_irm_config.tenant_id
}

resource "azurerm_sentinel_data_connector_office_power_bi" "data_connector_office_power_bi" {  
  name                       = var.data_connector_office_power_bi_config.name
  log_analytics_workspace_id = var.data_connector_office_power_bi_config.log_analytics_workspace_id
  tenant_id                  = var.data_connector_office_power_bi_config.tenant_id
}

resource "azurerm_sentinel_data_connector_threat_intelligence" "data_connector_threat_intelligence" {  
  name                       = var.data_connector_threat_intelligence_config.name
  log_analytics_workspace_id = var.data_connector_threat_intelligence_config.log_analytics_workspace_id
  tenant_id                  = var.data_connector_threat_intelligence_config.tenant_id
}
