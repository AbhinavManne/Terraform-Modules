<!-- BEGIN_TF_DOCS -->
###### Last Updated[DD/MM/YYYY]: 03/08/2022
##  Introduction 
This module provisions a log analytics worskspace with log solution.(Log Solution is optional.) A Log Analytics workspace is a unique environment for log data from Azure Monitor and other Azure services such as Microsoft Sentinel and Microsoft Defender for Cloud. 

## File Structure 
This particular module is having the following configuration files.
- log-analytics.tf : This file is having the terraform code to provision the resources as per requirements.
- variables.tf : This file consist of all the variable definitions needed for the terraform code mentioned in log-analytics.tf
- output.tf : This file is having all the resource output details generated.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | =3.15.1 |

## Resources

| Name | Type |
|------|------|
| [azurerm_log_analytics_solution.log_sol](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/log_analytics_solution) | resource |
| [azurerm_log_analytics_workspace.log_work](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/log_analytics_workspace) | resource |


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_log_workspace"></a> [create\_log\_workspace](#input\_create\_log\_workspace) | If you wants to create a log analytics workspace resource or wants to use an existing one | `bool` | `false` | no |
| <a name="input_location"></a> [location](#input\_location) | The location/region to keep all your resources. To get the list of all locations with table format from azure cli, run 'az account list-locations -o table' | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Resource group name | `string` | n/a | yes |
| <a name="input_log_analytics_workspace"></a> [log\_analytics\_workspace](#input\_log\_analytics\_workspace) | Specifies the name of the Log Analytics Workspace. | `string` | n/a | yes |
| <a name="input_log_sku"></a> [log\_sku](#input\_log\_sku) | Specifies the Sku of the Log Analytics Workspace. | `string` | `"PerGB2018"` | no |
| <a name="input_retention_in_days"></a> [retention\_in\_days](#input\_retention\_in\_days) | The workspace data retention in days. Possible values are either 7 (Free Tier only) or range between 30 and 730. | `number` | `7` | no |
| <a name="input_internet_ingestion_enabled"></a> [internet\_ingestion\_enabled](#input\_internet\_ingestion\_enabled) | Internet ingestion enable or not | `bool` | `true` | no |
| <a name="input_internet_query_enabled"></a> [internet\_query\_enabled](#input\_internet\_query\_enabled) | Interent quet enable or not | `bool` | `true` | no |
| <a name="input_reservation_capacity_in_gb_per_day"></a> [reservation\_capacity\_in\_gb\_per\_day](#input\_reservation\_capacity\_in\_gb\_per\_day) | The capacity reservation level in GB for this workspace. Must be in increments of 100 between 100 and 5000. | `number` | `100` | no |
| <a name="input_daily_quota_gb"></a> [daily\_quota\_gb](#input\_daily\_quota\_gb) | The workspace daily quota for ingestion in GB. | `number` | `-1` | no |
| <a name="input_log_tags"></a> [log\_tags](#input\_log\_tags) | Tags | `map(any)` | n/a | no |
| <a name="input_create_log_analytics_solution"></a> [create\_log\_analytics\_solution](#input\_create\_log\_analytics\_solution) | If you wants to create a log analytics solution resource or not | `bool` | `false` | no |
| <a name="input_solution_name"></a> [solution\_name](#input\_solution\_name) | Specifies the name of the solution to be deployed. | `string` | n/a | yes |
| <a name="input_plan_publisher"></a> [plan\_publisher](#input\_plan\_publisher) | The publisher of the solution. For example Microsoft | `string` | n/a | yes |
| <a name="input_plan_product"></a> [plan\_product](#input\_plan\_product) | The product name of the solution. For example OMSGallery/Containers | `string` | n/a | yes |
| <a name="input_promotion_code"></a> [promotion\_code](#input\_promotion\_code) | A promotion code to be used with the solution. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_log_id"></a> [log\_id](#output\_log\_id) | ID of the Log Analytics |
| <a name="output_log_name"></a> [log\_name](#output\_log\_name) | Name of the Log Analytics Workspace |
| <a name="output_log_primary_shared_key"></a> [log\_primary\_shared\_key](#output\_log\_primary\_shared\_key) | Primary shared key of the Log Analytics Workspace |
| <a name="output_log_secondary_shared_key"></a> [log\_secondary\_shared\_key](#output\_log\_secondary\_shared\_key) | Secondary shared key of the Log Analytics Workspace |
| <a name="output_log_workspace_id"></a> [log\_workspace\_id](#output\_log\_workspace\_id) | ID of the Log Analytics Workspace |

## Module Usage
* You can call the specified Log Analytics module in any script where you want to integrate it.
```
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
  depends_on = [
    module.resource_group
  ]
  source                        = "../../modules/module_log-analytics-workspace-creation/log_analytics"
  create_log_workspace          = var.create_log_workspace
  log_analytics_workspace       = var.log_analytics_workspace  
  resource_group_name           = module.resource_group.resource_group_name
  location                      = module.resource_group.resource_group_location
  log_sku                       = var.log_sku
  retention_in_days             = var.retention_in_days
  internet_ingestion_enabled    = var.internet_ingestion_enabled
  internet_query_enabled        = var.internet_query_enabled
  reservation_capacity_in_gb_per_day = var.reservation_capacity_in_gb_per_day
  daily_quota_gb                = var.daily_quota_gb
  log_tags                      = var.log_tags
  create_log_analytics_solution = var.create_log_analytics_solution
  solution_name                 = var.solution_name
  plan_publisher                = var.plan_publisher
  plan_product                  = var.plan_product
  promotion_code                = var.promotion_code
}

#Reference to module that provisions alerts resources
module "alert" {
  source = "../../modules/module_alert"
  action_group_name        = var.action_group_name
  resource_group_name      = module.resource_group.resource_group_name
  resource_group_location  = module.resource_group.resource_group_location
  short_name               = var.short_name
  action_group_rule_name   = var.action_group_rule_name
  scope_type               = var.scope_type
  resource_id              = module.log_analytics.log_id
  activity_log_alert_name  = var.activity_log_alert_name
  resource_group_id        = module.resource_group.resource_group_id
  operation_name_log_alert = var.operation_name_log_alert
  category_log_alert       = var.category_log_alert
  metric_alert_name        = var.metric_alert_name
  storage_account_id       = var.storage_account_id
  metric_namespace         = var.metric_namespace
  metric_name              = var.metric_name
  aggregation              = var.aggregation
  operator                 = var.operator
  threshold                = var.threshold
  dimension_name           = var.dimension_name
  dimension_operator       = var.dimension_operator
  values                   = var.values
}

#Reference to module that provisions diagnostic resources
module "diag_settings" {
  source                         = "../../modules/module_diagnostics_settings"
  enable_log_monitoring          = var.enable_log_monitoring
  diag_name                      = var.diag_name
  target_resource_id             = module.log_analytics.log_id
  log_analytics_workspace_id     = var.log_analytics_workspace_id
  log_analytics_destination_type = var.log_analytics_destination_type
  storage_account_id             = var.storage_account_id
  eventhub_name                  = var.eventhub_name
  eventhub_authorization_rule_id = var.eventhub_authorization_rule_id
  log_enabled                    = var.log_enabled
  log_retention_policy_enabled   = var.log_retention_policy_enabled
  log_retention_days             = var.log_retention_days
  metric_retention_policy_enabled= var.metric_retention_policy_enabled
  metric_retention_days          = var.metric_retention_days
}
```

## Log Analytics Solution: 
Some of the solutions that can be added:

| solution_name | publisher | product |
|---------------|-----------|---------|
| ContainerInsights | Microsoft | OMSGallery/ContainerInsights |
| AzureAppGatewayAnalytics | Microsoft | OMSGallery/AzureAppGatewayAnalytics |
| AzureActivity | Microsoft | OMSGallery/AzureActivity |
| Security | Microsoft | OMSGallery/Security |
| KeyVaultAnalytics | Microsoft | OMSGallery/KeyVaultAnalytics |
| AntiMalware | Microsoft | OMSGallery/AntiMalware |
| NetworkMonitoring | Microsoft | OMSGallery/NetworkMonitoring |
<br>

#### Refer this link to know more about Log Analytics: [Log_Analytics_MSDOC](https://docs.microsoft.com/en-us/azure/azure-monitor/logs/log-analytics-workspace-overview)


#### Refer this link to know more about Log Analytics: [Log_Analytics_Terraform](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/log_analytics_workspace)


<!-- END_TF_DOCS -->