#--------------------------------RESOURCE: LOG ANALYTICS WORKSPACE----------------------------------#
variable "log_analytics_workspace" {
  type        = string
  description = "Specifies the name of the Log Analytics Workspace."
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "resource_group_location" {
  type        = string
  description = "Location of the resource group"
}

variable "log_sku" {
  type        = string
  description = " Specifies the Sku of the Log Analytics Workspace."
}

variable "retention_in_days" {
  type        = number
  description = "The workspace data retention in days. Possible values are either 7 (Free Tier only) or range between 30 and 730."
}

variable "internet_ingestion_enabled" {
  type        = bool
  description = " Internet ingestion enabled or not"
}

variable "internet_query_enabled" {
  type        = bool
  description = " Interent query enable or not"
}

variable "reservation_capacity_in_gb_per_day" {
  type        = number
  description = " The capacity reservation level in GB for this workspace. Must be in increments of 100 between 100 and 5000."
}

variable "daily_quota_gb" {
  type        = number
  description = " The workspace daily quota for ingestion in GB."
}

variable "tags" {
  type        = map(any)
  description = "Tags"
}

#--------------------------------RESOURCE: LOG ANALYTICS SOLUTION----------------------------------#
variable "create_log_analytics_solution" {
  type        = bool
  description = "If you want to create a log analytics solution resource or not"
}

variable "solution_name" {
  type        = string
  description = "Specifies the name of the solution to be deployed."
}

variable "plan_publisher" {
  type        = string
  description = "The publisher of the solution. For example Microsoft"
}

variable "plan_product" {
  type        = string
  description = "The product name of the solution. For example OMSGallery/Containers"
}

variable "promotion_code" {
  type        = string
  description = "A promotion code to be used with the solution."
}

#--------------------------------RESOURCE: SENTINEL DATA CONNECTOR---------------------------------#

variable "data_connector_aws_cloud_trail_config" {
  type = object({
    name         = string
    log_analytics_workspace_id = string
    aws_role_arn = string
  })
  default = {
    name         = null
    log_analytics_workspace_id = null
    aws_role_arn = null
  }
  description = "Manages a AWS CloudTrail Data Connector."
}

variable "data_connector_aws_s3_config" {
  type = object({
    name              = string
    log_analytics_workspace_id = string
    aws_role_arn      = string
    destination_table = string
    sqs_urls          = list(string)
  })
  default = {
    name              = null
    log_analytics_workspace_id = null
    aws_role_arn      = null
    destination_table = null
    sqs_urls          = null
  }
  description = "Manages a AWS S3 Data Connector."
}

variable "data_connector_azure_active_directory_config" {
  type = object({
    name      = string
    log_analytics_workspace_id = string
    tenant_id = string
  })
  default = {
    name      = null
    log_analytics_workspace_id = null
    tenant_id = null
  }
  description = "Manages a Azure Active Directory Data Connector."
}

variable "data_connector_azure_advanced_threat_protection_config" {
  type = object({
    name      = string
    log_analytics_workspace_id = string
    tenant_id = string
  })
  default = {
    name      = null
    log_analytics_workspace_id = null
    tenant_id = null
  }
  description = "Manages a Azure Advanced Threat Protection Data Connector."
}

variable "data_connector_azure_security_center_config" {
  type = object({
    name            = string
    log_analytics_workspace_id = string
    subscription_id = string
  })
  default = {
    name            = null
    log_analytics_workspace_id = null
    subscription_id = null
  }
  description = "Manages an Azure Security Center Data Connector."
}

variable "data_connector_dynamics_365_config" {
  type = object({
    name      = string
    log_analytics_workspace_id = string
    tenant_id = string
  })
  default = {
    name      = null
    log_analytics_workspace_id = null
    tenant_id = null
  }
  description = "Manages a Dynamics 365 Data Connector."
}

variable "data_connector_iot_config" {
  type = object({
    name            = string
    log_analytics_workspace_id = string
    subscription_id = string
  })
  default = {
    name            = null
    log_analytics_workspace_id = null
    subscription_id = null
  }
  description = "Manages an Iot Data Connector."
}

variable "data_connector_microsoft_cloud_app_security_config" {
  type = object({
    name           = string
    log_analytics_workspace_id = string
    alerts_enabled = bool
    tenant_id      = string
  })
  default = {
    name           = null
    log_analytics_workspace_id = null
    alerts_enabled = true
    tenant_id      = null
  }
  description = "Manages a Microsoft Cloud App Security Data Connector."
}

variable "data_connector_microsoft_defender_advanced_threat_protection_config" {
  type = object({
    name      = string
    log_analytics_workspace_id = string
    tenant_id = string
  })
  default = {
    name      = null
    log_analytics_workspace_id = null
    tenant_id = null
  }
  description = "Manages a Microsoft Defender Advanced Threat Protection Data Connector."
}

variable "data_connector_office_365_config" {
  type = object({
    name               = string
    log_analytics_workspace_id = string
    exchange_enabled   = bool
    sharepoint_enabled = bool
    teams_enabled      = bool
    tenant_id          = string
  })
  default = {
    name               = null
    log_analytics_workspace_id = null
    exchange_enabled   = true
    sharepoint_enabled = true
    teams_enabled      = true
    tenant_id          = null
  }
  description = "Manages a Office 365 Data Connector."
}

variable "data_connector_office_365_project_config" {
  type = object({
    name      = string
    log_analytics_workspace_id = string
    tenant_id = string
  })
  default = {
    name      = null
    log_analytics_workspace_id = null
    tenant_id = null
  }
  description = "Manages an Office 365 Project Data Connector."
}

variable "data_connector_office_atp_config" {
  type = object({
    name      = string
    log_analytics_workspace_id = string
    tenant_id = string
  })
  default = {
    name      = null
    log_analytics_workspace_id = null
    tenant_id = null
  }
  description = "Manages a Office ATP Data Connector."
}

variable "data_connector_office_irm_config" {
  type = object({
    name      = string
    log_analytics_workspace_id = string
    tenant_id = string
  })
  default = {
    name      = null
    log_analytics_workspace_id = null
    tenant_id = null
  }
  description = "Manages an Office IRM Data Connector."
}

variable "data_connector_office_power_bi_config" {
  type = object({
    name      = string
    log_analytics_workspace_id = string
    tenant_id = string
  })
  default = {
    log_analytics_workspace_id = null
    name      = null
    tenant_id = null
  }
  description = "Manages an Office Power BI Data Connector."
}

variable "data_connector_threat_intelligence_config" {
  type = object({
    name      = string
    log_analytics_workspace_id = string
    tenant_id = string
  })
  default = {
    log_analytics_workspace_id = null
    name      = null
    tenant_id = null
  }
  description = "Manages a Threat Intelligence Data Connector."
}
