output "data_connector_aws_cloud_trail_id" {
  value       = azurerm_sentinel_data_connector_aws_cloud_trail.data_connector_aws_cloud_trail.id
  description = "The ID of the AWS CloudTrail Data Connector."
}

output "data_connector_aws_s3_id" {
  value       = azurerm_sentinel_data_connector_aws_s3.data_connector_aws_s3.id
  description = "The ID of the AWS S3 Data Connector."
}

output "data_connector_azure_active_directory_id" {
  value       = azurerm_sentinel_data_connector_azure_active_directory.data_connector_azure_active_directory.id
  description = "The ID of the Azure Active Directory Data Connector."
}

output "data_connector_azure_advanced_threat_protection_id" {
  value       = azurerm_sentinel_data_connector_azure_advanced_threat_protection.data_connector_azure_advanced_threat_protection.id
  description = "The ID of the Azure Advanced Threat Protection Data Connector."
}

output "data_connector_azure_security_center_id" {
  value       = azurerm_sentinel_data_connector_azure_security_center.data_connector_azure_security_center.id
  description = "The ID of the Azure Security Center Data Connector."
}

output "data_connector_dynamics_365_id" {
  value       = azurerm_sentinel_data_connector_dynamics_365.data_connector_dynamics_365.id
  description = "The ID of the Dynamics 365 Data Connector."
}

output "data_connector_iot_id" {
  value       = azurerm_sentinel_data_connector_iot.data_connector_iot.id
  description = "The ID of the Iot Data Connector."
}

output "data_connector_microsoft_cloud_app_security_id" {
  value       = azurerm_sentinel_data_connector_microsoft_cloud_app_security.data_connector_microsoft_cloud_app_security.id
  description = "The ID of the Microsoft Cloud App Security Data Connector."
}

output "data_connector_microsoft_defender_advanced_threat_protection_id" {
  value       = azurerm_sentinel_data_connector_microsoft_defender_advanced_threat_protection.data_connector_microsoft_defender_advanced_threat_protection.id
  description = "The ID of the Microsoft Defender Advanced Threat Protection Data Connector."
}

output "data_connector_office_365_id" {
  value       = azurerm_sentinel_data_connector_office_365.data_connector_office_365.id
  description = "The ID of the Office 365 Data Connector."
}

output "data_connector_office_365_project_id" {
  value       = azurerm_sentinel_data_connector_office_365_project.data_connector_office_365_project.id
  description = "The ID of the Office 365 Project Data Connector."
}

output "data_connector_office_atp_id" {
  value       = azurerm_sentinel_data_connector_office_atp.data_connector_office_atp.id
  description = "The ID of the Office ATP Data Connector."
}

output "data_connector_office_irm_id" {
  value       = azurerm_sentinel_data_connector_office_irm.data_connector_office_irm.id
  description = "The ID of the Office IRM Data Connector."
}

output "data_connector_office_power_bi_id" {
  value       = azurerm_sentinel_data_connector_office_power_bi.data_connector_office_power_bi.id
  description = "The ID of the Office Power BI Data Connector."
}

output "data_connector_threat_intelligence_id" {
  value       = azurerm_sentinel_data_connector_threat_intelligence.data_connector_threat_intelligence.id
  description = "The ID of the Threat Intelligence Data Connector."
}
