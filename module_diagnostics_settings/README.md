<!-- BEGIN_TF_DOCS -->
###### Last Updated[DD/MM/YYYY]: 19/08/2022
##  Introduction 
Analyze logs and metrics with diagnostics settings

## File Structure 
This particular module is having the following configuration files.
- diag.tf : This file is having the terraform code to provision the resources as per requirements.
- variables.tf : This file consist of all the variable definitions needed for provisioning the resource.
- output.tf : This file is having all the resource output details generated.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.19.0 |


## Resources

| Name | Type |
|------|------|
| [azurerm_monitor_diagnostic_setting.diag_settings](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_diagnostic_setting) | resource |
| [azurerm_monitor_diagnostic_categories.diag_categories](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/monitor_diagnostic_categories) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_diag_name"></a> [diag\_name](#input\_diag\_name) | Specifies the name of the Diagnostic Setting. | `string` | n/a | yes |
| <a name="input_enable_log_monitoring"></a> [enable\_log\_monitoring](#input\_enable\_log\_monitoring) | enable log monitoring | `bool` | n/a | yes |
| <a name="input_eventhub_authorization_rule_id"></a> [eventhub\_authorization\_rule\_id](#input\_eventhub\_authorization\_rule\_id) | eventhub\_authorization\_rule\_id | `any` | n/a | no |
| <a name="input_eventhub_name"></a> [eventhub\_name](#input\_eventhub\_name) | eventhub\_name | `any` | n/a | no |
| <a name="input_log_analytics_destination_type"></a> [log\_analytics\_destination\_type](#input\_log\_analytics\_destination\_type) | log\_analytics\_destination\_type | `string` | n/a | no |
| <a name="input_log_analytics_workspace_id"></a> [log\_analytics\_workspace\_id](#input\_log\_analytics\_workspace\_id) | ID of log anaytics workspace | `any` | n/a | yes |
| <a name="input_log_enabled"></a> [log\_enabled](#input\_log\_enabled) | log\_enabled | `bool` | n/a | no |
| <a name="input_log_retention_days"></a> [log\_retention\_days](#input\_log\_retention\_days) | log\_retention\_days | `number` | n/a | yes |
| <a name="input_log_retention_policy_enabled"></a> [log\_retention\_policy\_enabled](#input\_log\_retention\_policy\_enabled) | log\_retention\_policy\_enabled | `bool` | n/a | yes |
| <a name="input_metric_retention_days"></a> [metric\_retention\_days](#input\_metric\_retention\_days) | log\_retention\_days | `number` | n/a | yes |
| <a name="input_metric_retention_policy_enabled"></a> [metric\_retention\_policy\_enabled](#input\_metric\_retention\_policy\_enabled) | metric\_retention\_policy\_enabled | `bool` | n/a | yes |
| <a name="input_storage_account_id"></a> [storage\_account\_id](#input\_storage\_account\_id) | ID of target resource | `any` | n/a | no |
| <a name="input_target_resource_id"></a> [target\_resource\_id](#input\_target\_resource\_id) | ID of target resource | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_diag_id"></a> [diag\_id](#output\_diag\_id) | ID of the diagnostic settings resource |


## Module Usage
```
module "diag_settings" {
  source                         = "../../modules/module_diagnostics_settings"
  enable_log_monitoring          = var.enable_log_monitoring
  diag_name                      = var.diag_name
  target_resource_id             = var.target_resource_id
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

## Monitor Diagnostic Settings Resource
One of eventhub_authorization_rule_id, log_analytics_workspace_id and storage_account_id must be specified.<br>
At least one log or metric block must be specified.

* <u>'var.enable_log_monitoring'</u>: If you want to create a diagnostic settings resource then you can give the bool value 'true' otherwise 'false'.

* <u>'name'</u>:(Required) Specifies the name of the Diagnostic Setting. Changing this forces a new resource to be created.

* <u>'target_resource_id'</u>:(Required) The ID of an existing Resource on which to configure Diagnostic Settings. Changing this forces a new resource to be created.

* <u>'log_analytics_workspace_id'</u>:(Optional) Specifies the ID of a Log Analytics Workspace where Diagnostics Data should be sent.

* <u>'log_analytics_destination_type'</u>:(Optional) When set to 'Dedicated' logs sent to a Log Analytics workspace will go into resource specific tables, instead of the legacy AzureDiagnostics table.This setting will only have an effect if a log_analytics_workspace_id is provided, and the resource is available for resource-specific logs. 

* <u>'storage_account_id'</u>:(Optional) The ID of the Storage Account where logs should be sent. Changing this forces a new resource to be created.

* <u>'eventhub_name'</u>:(Optional) Specifies the name of the Event Hub where Diagnostics Data should be sent. Changing this forces a new resource to be created.

* <u>'eventhub_authorization_rule_id'</u>:(Optional) Specifies the ID of an Event Hub Namespace Authorization Rule used to send Diagnostics Data. Changing this forces a new resource to be created.


#### Refer this link to know more about Diagnostic Settings: [Diagnostic_settings](https://docs.microsoft.com/en-us/azure/azure-monitor/essentials/diagnostic-settings?tabs=portal)


<!-- END_TF_DOCS -->