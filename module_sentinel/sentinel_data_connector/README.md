<!-- BEGIN_TF_DOCS -->
###### Last Updated[DD/MM/YYYY]: 29/11/2022
## Introduction

Creates Data Connectors for Microsoft Sentinel Workspace.

## File Structure 

This particular module is having the following configuration files.
- dataconnector.tf : This file is having the terraform code to provision the resource as per requirements.
- variables.tf : This file consists of all the variable definitions needed for the terraform code mentioned in dataconnector.tf
- outputs.tf : This file will be having the resource output details generated.

## Requirements

1. Resource group
2. Microsoft Sentinel enabled

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.33.0 |

## Resources

| Name | Type |
|------|------|
| [azurerm_sentinel_data_connector_aws_cloud_trail.data_connector_aws_cloud_trail](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/sentinel_data_connector_aws_cloud_trail) | resource |
| [azurerm_sentinel_data_connector_aws_s3.data_connector_aws_s3](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/sentinel_data_connector_aws_s3) | resource |
| [azurerm_sentinel_data_connector_azure_active_directory.data_connector_azure_active_directory](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/sentinel_data_connector_azure_active_directory) | resource |
| [azurerm_sentinel_data_connector_azure_advanced_threat_protection.data_connector_azure_advanced_threat_protection](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/sentinel_data_connector_azure_advanced_threat_protection) | resource |
| [azurerm_sentinel_data_connector_azure_security_center.data_connector_azure_security_center](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/sentinel_data_connector_azure_security_center) | resource |
| [azurerm_sentinel_data_connector_dynamics_365.data_connector_dynamics_365](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/sentinel_data_connector_dynamics_365) | resource |
| [azurerm_sentinel_data_connector_iot.data_connector_iot](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/sentinel_data_connector_iot) | resource |
| [azurerm_sentinel_data_connector_microsoft_cloud_app_security.data_connector_microsoft_cloud_app_security](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/sentinel_data_connector_microsoft_cloud_app_security) | resource |
| [azurerm_sentinel_data_connector_microsoft_defender_advanced_threat_protection.data_connector_microsoft_defender_advanced_threat_protection](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/sentinel_data_connector_microsoft_defender_advanced_threat_protection) | resource |
| [azurerm_sentinel_data_connector_office_365.data_connector_office_365](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/sentinel_data_connector_office_365) | resource |
| [azurerm_sentinel_data_connector_office_365_project.data_connector_office_365_project](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/sentinel_data_connector_office_365_project) | resource |
| [azurerm_sentinel_data_connector_office_atp.data_connector_office_atp](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/sentinel_data_connector_office_atp) | resource |
| [azurerm_sentinel_data_connector_office_irm.data_connector_office_irm](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/sentinel_data_connector_office_irm) | resource |
| [azurerm_sentinel_data_connector_office_power_bi.data_connector_office_power_bi](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/sentinel_data_connector_office_power_bi) | resource |
| [azurerm_sentinel_data_connector_threat_intelligence.data_connector_threat_intelligence](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/sentinel_data_connector_threat_intelligence) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_log_analytics_solution"></a> [create\_log\_analytics\_solution](#input\_create\_log\_analytics\_solution) | If you want to create a log analytics solution resource or not | `bool` | `false` | no |
| <a name="input_daily_quota_gb"></a> [daily\_quota\_gb](#input\_daily\_quota\_gb) | The workspace daily quota for ingestion in GB. | `number` | `-1` | no |
| <a name="input_data_connector_aws_cloud_trail_config"></a> [data\_connector\_aws\_cloud\_trail\_config](#input\_data\_connector\_aws\_cloud\_trail\_config) | Manages a AWS CloudTrail Data Connector. It is mandatory to pass all the arguments in the object. | <pre>object({<br>    name            = string<br>    aws_role_arn = string<br>  })</pre> | n/a | yes |
| <a name="input_data_connector_aws_s3_config"></a> [data\_connector\_aws\_s3\_config](#input\_data\_connector\_aws\_s3\_config) | Manages a AWS S3 Data Connector. It is mandatory to pass all the arguments in the object. | <pre>object({<br>    name            = string<br>    aws_role_arn = string<br>    destination_table = string<br>    sqs_urls = list(string)<br>  })</pre> | n/a> | yes |
| <a name="input_data_connector_azure_active_directory_config"></a> [data\_connector\_azure\_active\_directory\_config](#input\_data\_connector\_azure\_active\_directory\_config) | Manages a Azure Active Directory Data Connector. It is mandatory to pass all the arguments in the object. However, if you do not wish to pass custom values to the following optional parameters, please pass 'null' as input. <br>Optional Arguments<br> <li><b><i>tenant_id</i></b></li> | <pre>object({<br>    name            = string<br>    tenant_id = string<br>  })</pre> | n/a | yes |
| <a name="input_data_connector_azure_advanced_threat_protection_config"></a> [data\_connector\_azure\_advanced\_threat\_protection\_config](#input\_data\_connector\_azure\_advanced\_threat\_protection\_config) | Manages a Azure Advanced Threat Protection Data Connector. It is mandatory to pass all the arguments in the object. However, if you do not wish to pass custom values to the following optional parameters, please pass 'null' as input. <br>Optional Arguments<br> <li><b><i>tenant_id</i></b></li> | <pre>object({<br>    name            = string<br>    tenant_id = string<br>  })</pre> | n/a | yes |
| <a name="input_data_connector_azure_security_center_config"></a> [data\_connector\_azure\_security\_center\_config](#input\_data\_connector\_azure\_security\_center\_config) | Manages an Azure Security Center Data Connector. It is mandatory to pass all the arguments in the object. However, if you do not wish to pass custom values to the following optional parameters, please pass 'null' as input. <br>Optional Arguments<br> <li><b><i>subscription_id</i></b></li> | <pre>object({<br>    name            = string<br>    subscription_id = string<br>  })</pre> | n/a | yes |
| <a name="input_data_connector_dynamics_365_config"></a> [data\_connector\_dynamics\_365\_config](#input\_data\_connector\_dynamics\_365\_config) | Manages a Dynamics 365 Data Connector. It is mandatory to pass all the arguments in the object. However, if you do not wish to pass custom values to the following optional parameters, please pass 'null' as input. <br>Optional Arguments<br> <li><b><i>tenant_id</i></b></li> | <pre>object({<br>    name            = string<br>    tenant_id = string<br>  })</pre> | n/a | yes |
| <a name="input_data_connector_iot_config"></a> [data\_connector\_iot\_config](#input\_data\_connector\_iot\_config) | Manages an Iot Data Connector. It is mandatory to pass all the arguments in the object. However, if you do not wish to pass custom values to the following optional parameters, please pass 'null' as input. <br>Optional Arguments<br> <li><b><i>subscription_id</i></b></li> | <pre>object({<br>    name            = string<br>    subscription_id = string<br>  })</pre> | n/a | yes |
| <a name="input_data_connector_microsoft_cloud_app_security_config"></a> [data\_connector\_microsoft\_cloud\_app\_security\_config](#input\_data\_connector\_microsoft\_cloud\_app\_security\_config) | Manages a Microsoft Cloud App Security Data Connector. It is mandatory to pass all the arguments in the object. However, if you do not wish to pass custom values to the following optional parameters, please pass 'null' as input. <br>Optional Arguments<br> <li><b><i>alerts_enabled</i></b></li> <li><b><i>tenant_id</i></b></li> | <pre>object({<br>    name            = string<br>    alerts_enabled = bool<br>    tenant_id = string<br>  })</pre> | n/a | yes |
| <a name="input_data_connector_microsoft_defender_advanced_threat_protection_config"></a> [data\_connector\_microsoft\_defender\_advanced\_threat\_protection\_config](#input\_data\_connector\_microsoft\_defender\_advanced\_threat\_protection\_config) | Manages a Microsoft Defender Advanced Threat Protection Data Connector. It is mandatory to pass all the arguments in the object. However, if you do not wish to pass custom values to the following optional parameters, please pass 'null' as input. <br>Optional Arguments<br> <li><b><i>tenant_id</i></b></li> | <pre>object({<br>    name            = string<br>    tenant_id = string<br>  })</pre> | n/a | yes |
| <a name="input_data_connector_office_365_config"></a> [data\_connector\_office\_365\_config](#input\_data\_connector\_office\_365\_config) | Manages a Office 365 Data Connector. It is mandatory to pass all the arguments in the object. However, if you do not wish to pass custom values to the following optional parameters, please pass 'null' as input. <br>Optional Arguments<br> <li><b><i>exchange_enabled</i></b></li> <li><b><i>sharepoint_enabled</i></b></li> <li><b><i>teams_enabled</i></b></li> <li><b><i>tenant_id</i></b></li> | <pre>object({<br>    name            = string<br>    exchange_enabled = bool<br>    sharepoint_enabled = bool<br>    teams_enabled = bool<br>    tenant_id = string<br>  })</pre> | n/a | yes |
| <a name="input_data_connector_office_365_project_config"></a> [data\_connector\_office\_365\_project\_config](#input\_data\_connector\_office\_365\_project\_config) | Manages an Office 365 Project Data Connector. It is mandatory to pass all the arguments in the object. However, if you do not wish to pass custom values to the following optional parameters, please pass 'null' as input. <br>Optional Arguments<br> <li><b><i>tenant_id</i></b></li> | <pre>object({<br>    name            = string<br>    tenant_id = string<br>  })</pre> | n/a | yes |
| <a name="input_data_connector_office_atp_config"></a> [data\_connector\_office\_atp\_config](#input\_data\_connector\_office\_atp\_config) | Manages a Office ATP Data Connector. It is mandatory to pass all the arguments in the object. However, if you do not wish to pass custom values to the following optional parameters, please pass 'null' as input. <br>Optional Arguments<br> <li><b><i>tenant_id</i></b></li> | <pre>object({<br>    name            = string<br>    tenant_id = string<br>  })</pre> | n/a | yes |
| <a name="input_data_connector_office_irm_config"></a> [data\_connector\_office\_irm\_config](#input\_data\_connector\_office\_irm\_config) | Manages an Office IRM Data Connector. It is mandatory to pass all the arguments in the object. However, if you do not wish to pass custom values to the following optional parameters, please pass 'null' as input. <br>Optional Arguments<br> <li><b><i>tenant_id</i></b></li> | <pre>object({<br>    name            = string<br>    tenant_id = string<br>  })</pre> | n/a | yes |
| <a name="input_data_connector_office_power_bi_config"></a> [data\_connector\_office\_power\_bi\_config](#input\_data\_connector\_office\_power\_bi\_config) | Manages an Office Power BI Data Connector. It is mandatory to pass all the arguments in the object. However, if you do not wish to pass custom values to the following optional parameters, please pass 'null' as input. <br>Optional Arguments<br> <li><b><i>tenant_id</i></b></li> | <pre>object({<br>    name            = string<br>    tenant_id = string<br>  })</pre> | n/a | yes |
| <a name="input_data_connector_threat_intelligence_config"></a> [data\_connector\_threat\_intelligence\_config](#input\_data\_connector\_threat\_intelligence\_config) | Manages a Threat Intelligence Data Connector. It is mandatory to pass all the arguments in the object. However, if you do not wish to pass custom values to the following optional parameters, please pass 'null' as input. <br>Optional Arguments<br> <li><b><i>tenant_id</i></b></li> | <pre>object({<br>    name            = string<br>    tenant_id = string<br>  })</pre> | n/a | yes |
| <a name="input_internet_ingestion_enabled"></a> [internet\_ingestion\_enabled](#input\_internet\_ingestion\_enabled) | Internet ingestion enabled or not | `bool` | `true` | no |
| <a name="input_internet_query_enabled"></a> [internet\_query\_enabled](#input\_internet\_query\_enabled) | Interent query enable or not | `bool` | `true` | no |
| <a name="input_log_analytics_workspace"></a> [log\_analytics\_workspace](#input\_log\_analytics\_workspace) | Specifies the name of the Log Analytics Workspace. | `string` | n/a | yes |
| <a name="input_log_sku"></a> [log\_sku](#input\_log\_sku) | Specifies the Sku of the Log Analytics Workspace. | `string` | `"PerGB2018"` | no |
| <a name="input_log_tags"></a> [log\_tags](#input\_log\_tags) | Tags | `map(any)` | n/a | no |
| <a name="input_plan_product"></a> [plan\_product](#input\_plan\_product) | The product name of the solution. For example OMSGallery/Containers | `string` | n/a | yes |
| <a name="input_plan_publisher"></a> [plan\_publisher](#input\_plan\_publisher) | The publisher of the solution. For example Microsoft | `string` | n/a | yes |
| <a name="input_promotion_code"></a> [promotion\_code](#input\_promotion\_code) | A promotion code to be used with the solution. | `string` | n/a | yes |
| <a name="input_reservation_capacity_in_gb_per_day"></a> [reservation\_capacity\_in\_gb\_per\_day](#input\_reservation\_capacity\_in\_gb\_per\_day) | The capacity reservation level in GB for this workspace. Must be in increments of 100 between 100 and 5000. | `number` | `100` | no |
| <a name="input_resource_group_location"></a> [resource\_group\_location](#input\_resource\_group\_location) | Location of the resource group | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Name of the resource group | `string` | n/a | yes |
| <a name="input_retention_in_days"></a> [retention\_in\_days](#input\_retention\_in\_days) | The workspace data retention in days. Possible values are either 7 (Free Tier only) or range between 30 and 730. | `number` | `7` | no |
| <a name="input_solution_name"></a> [solution\_name](#input\_solution\_name) | Specifies the name of the solution to be deployed. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_data_connector_aws_cloud_trail_id"></a> [data\_connector\_aws\_cloud\_trail\_id](#output\_data\_connector\_aws\_cloud\_trail\_id) | The ID of the AWS CloudTrail Data Connector. |
| <a name="output_data_connector_aws_s3_id"></a> [data\_connector\_aws\_s3\_id](#output\_data\_connector\_aws\_s3\_id) | The ID of the AWS S3 Data Connector. |
| <a name="output_data_connector_azure_active_directory_id"></a> [data\_connector\_azure\_active\_directory\_id](#output\_data\_connector\_azure\_active\_directory\_id) | The ID of the Azure Active Directory Data Connector. |
| <a name="output_data_connector_azure_advanced_threat_protection_id"></a> [data\_connector\_azure\_advanced\_threat\_protection\_id](#output\_data\_connector\_azure\_advanced\_threat\_protection\_id) | The ID of the Azure Advanced Threat Protection Data Connector. |
| <a name="output_data_connector_azure_security_center_id"></a> [data\_connector\_azure\_security\_center\_id](#output\_data\_connector\_azure\_security\_center\_id) | The ID of the Azure Security Center Data Connector. |
| <a name="output_data_connector_dynamics_365_id"></a> [data\_connector\_dynamics\_365\_id](#output\_data\_connector\_dynamics\_365\_id) | The ID of the Dynamics 365 Data Connector. |
| <a name="output_data_connector_iot_id"></a> [data\_connector\_iot\_id](#output\_data\_connector\_iot\_id) | The ID of the Iot Data Connector. |
| <a name="output_data_connector_microsoft_cloud_app_security_id"></a> [data\_connector\_microsoft\_cloud\_app\_security\_id](#output\_data\_connector\_microsoft\_cloud\_app\_security\_id) | The ID of the Microsoft Cloud App Security Data Connector. |
| <a name="output_data_connector_microsoft_defender_advanced_threat_protection_id"></a> [data\_connector\_microsoft\_defender\_advanced\_threat\_protection\_id](#output\_data\_connector\_microsoft\_defender\_advanced\_threat\_protection\_id) | The ID of the Microsoft Defender Advanced Threat Protection Data Connector. |
| <a name="output_data_connector_office_365_id"></a> [data\_connector\_office\_365\_id](#output\_data\_connector\_office\_365\_id) | The ID of the Office 365 Data Connector. |
| <a name="output_data_connector_office_365_project_id"></a> [data\_connector\_office\_365\_project\_id](#output\_data\_connector\_office\_365\_project\_id) | The ID of the Office 365 Project Data Connector. |
| <a name="output_data_connector_office_atp_id"></a> [data\_connector\_office\_atp\_id](#output\_data\_connector\_office\_atp\_id) | The ID of the Office ATP Data Connector. |
| <a name="output_data_connector_office_irm_id"></a> [data\_connector\_office\_irm\_id](#output\_data\_connector\_office\_irm\_id) | The ID of the Office IRM Data Connector. |
| <a name="output_data_connector_office_power_bi_id"></a> [data\_connector\_office\_power\_bi\_id](#output\_data\_connector\_office\_power\_bi\_id) | The ID of the Office Power BI Data Connector. |
| <a name="output_data_connector_threat_intelligence_id"></a> [data\_connector\_threat\_intelligence\_id](#output\_data\_connector\_threat\_intelligence\_id) | The ID of the Threat Intelligence Data Connector. |

## Module Usage

```
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
```
<!-- END_TF_DOCS -->