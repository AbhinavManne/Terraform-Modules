#----DEFAULT VALUES: RESOURCE: LOG ANALYTICS WORKSPACE----#
resource_group_name = "sentinelrg"
resource_group_location = "East US"
log_analytics_workspace = "dataconnector-sentinel-law"
log_sku                 = "PerGB2018"
retention_in_days       = 30
internet_ingestion_enabled = true
internet_query_enabled     = true
reservation_capacity_in_gb_per_day = 100
daily_quota_gb = -1
tags = null

#----DEFAULT VALUES: RESOURCE: LOG ANALYTICS SOLUTION-----#
create_log_analytics_solution = true
solution_name                 = "SecurityInsights"
plan_publisher                = "Microsoft"
plan_product                  = "OMSGallery/SecurityInsights"
promotion_code                = null

#----DEFAULT VALUES: RESOURCE: SENTINEL DATA CONNECTORS---#
data_connector_aws_cloud_trail_config = {
  aws_role_arn = "arn:aws:iam::000000000000:role/role1"
  log_analytics_workspace_id = null
  name         = "aws-cloud-trail-data-connector-001"
}

data_connector_aws_s3_config = {
  aws_role_arn      = "arn:aws:iam::000000000000:role/role1"
  destination_table = "AWSGuardDuty"
  log_analytics_workspace_id = null
  name              = "aws-s3-data-connector-001"
  sqs_urls          = ["https://sqs.us-east-1.amazonaws.com/000000000000/example"]
}

data_connector_azure_active_directory_config = {
  log_analytics_workspace_id = null
  name      = "azure-active-directory-data-connector-001"
  tenant_id = null
}

data_connector_azure_advanced_threat_protection_config = {
  log_analytics_workspace_id = null
  name      = "advanced-threat-protection-data-connector-001"
  tenant_id = null
}

data_connector_azure_security_center_config = {
  log_analytics_workspace_id = null
  name            = "azure-security-center-data-connector-001"
  subscription_id = "bd294e0d-a549-4b26-9787-5daa46f7dc35" //give value otherwise raises error
}

data_connector_dynamics_365_config = {
  log_analytics_workspace_id = null
  name      = "dynamics-365-data-connector-001"
  tenant_id = null
}

data_connector_iot_config = {
  log_analytics_workspace_id = null
  name            = "iot-data-connector-001"
  subscription_id = "bd294e0d-a549-4b26-9787-5daa46f7dc35" //give value otherwise raises error
}

data_connector_microsoft_cloud_app_security_config = {
  alerts_enabled = true
  log_analytics_workspace_id = null
  name           = "microsoft-cloud-app-security-data-connector-001"
  tenant_id      = null
}

data_connector_microsoft_defender_advanced_threat_protection_config = {
  log_analytics_workspace_id = null
  name      = "microsoft-defender-advanced-threat-protection-data-connector-001"
  tenant_id = null
}

data_connector_office_365_config = {
  exchange_enabled   = true
  log_analytics_workspace_id = null
  name               = "office-365-data-connector-001"
  sharepoint_enabled = true
  teams_enabled      = true
  tenant_id          = null
}

data_connector_office_365_project_config = {
  log_analytics_workspace_id = null
  name      = "office-365-project-data-connector-001"
  tenant_id = null
}

data_connector_office_atp_config = {
  log_analytics_workspace_id = null
  name      = "office-atp-data-connector-001"
  tenant_id = null
}

data_connector_office_irm_config = {
  log_analytics_workspace_id = null
  name      = "office-irm-data-connector-001"
  tenant_id = null
}

data_connector_office_power_bi_config = {
  log_analytics_workspace_id = null
  name      = "office-power-bi-data-connector-001"
  tenant_id = null
}

data_connector_threat_intelligence_config = {
  log_analytics_workspace_id = null
  name      = "threat-intelligence-data-connector-001"
  tenant_id = null
}
