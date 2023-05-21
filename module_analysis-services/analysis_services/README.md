<!-- BEGIN_TF_DOCS -->
###### Last Updated[DD/MM/YYYY]: 01/09/2022

## Introduction

This module helps us to provision Analysis Services Server:

## File Structure 

This particular module is having the following configuration files.
- analysis-services.tf : This file is having the terraform code to provision the resources as per requirements.
- Variables.tf : This file consists of all the variable definitions needed for the terraform code mentioned in analysis-services.tf
- Outputs.tf : This file will be having the resource output details generated.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.19.0 |

## Resources

| Name | Type |
|------|------|
| [azurerm_analysis_services_server.analysis_server](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/analysis_services_server) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_users"></a> [admin\_users](#input\_admin\_users) | Admin user in Azure | `list(string)` | <pre>[<br>  "abc@xyz.com"<br>]</pre> | no |
| <a name="input_backup_blob_container_uri"></a> [backup\_blob\_container\_uri](#input\_backup\_blob\_container\_uri) | URI and SAS token for a blob container to store backups. | `string` | `null` | no |
| <a name="input_enable_power_bi_service"></a> [enable\_power\_bi\_service](#input\_enable\_power\_bi\_service) | to enable power BI services | `bool` | `null` | no |
| <a name="input_firewall_rules"></a> [firewall\_rules](#input\_firewall\_rules) | Firewall rules. | <pre>list(object({<br>    name = string<br>    range_start = string<br>    range_end = string<br><br>  }))</pre> | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Resource group location | `string` | n/a | yes |
| <a name="input_querypool_connection_mode"></a> [querypool\_connection\_mode](#input\_querypool\_connection\_mode) | This controls how the read-write server is used in the query pool | `string` | `"All"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Resource group name | `string` | n/a | yes |
| <a name="input_server_name"></a> [server\_name](#input\_server\_name) | Analysis Services server name in Azure | `string` | n/a | yes |
| <a name="input_sku"></a> [sku](#input\_sku) | Analysis Services server sku in Azure, Possible values are: D1, B1, B2, S0, S1, S2, S4, S8, S9, S8v2 and S9v2 | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | tags for the resource | `map(any)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_analysis_server_id"></a> [analysis\_server\_id](#output\_analysis\_server\_id) | ID of the analysis services server |
| <a name="output_analysis_server_name"></a> [analysis\_server\_name](#output\_analysis\_server\_name) | Name of the analysis services server |

## Module Usage

```
module "Analysis_Services" {
  source                    = "../../modules/module_analysis-services/analysis_services"
  resource_group_name       = module.module_create_resource_group.resource_group_name
  location                  = module.module_create_resource_group.resource_group_location
  server_name               = var.server_name
  sku                       = var.sku
  admin_users               = var.admin_users
  querypool_connection_mode = var.querypool_connection_mode
  backup_blob_container_uri = var.backup_blob_container_uri
  enable_power_bi_service   = var.enable_power_bi_service
  firewall_rules            = var.firewall_rules
  tags                      = var.tags
}

module "module_create_resource_group" {
  source                = "../../modules/module_resource-group-creation/resource_group"
  create_resource_group = var.create_resource_group
  resource_group_name   = var.resource_group_name
  location              = var.location
  tags                  = var.tags
}

module "alert" {
  source                   = "../../modules/module_alert"
  action_group_name        = var.action_group_name
  resource_group_name      = module.module_create_resource_group.resource_group_name
  resource_group_location  = module.module_create_resource_group.resource_group_location
  short_name               = var.short_name
  action_group_rule_name   = var.action_group_rule_name
  scope_type               = var.scope_type
  resource_id              = module.Analysis_Services.analysis_server_id
  activity_log_alert_name  = var.activity_log_alert_name
  resource_group_id        = module.module_create_resource_group.resource_group_id
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

module "diag_settings" {
  source                          = "../../modules/module_diagnostics_settings"
  enable_log_monitoring           = var.enable_log_monitoring
  diag_name                       = var.diag_name
  target_resource_id              = module.Analysis_Services.analysis_server_id
  log_analytics_workspace_id      = var.log_analytics_workspace_id
  log_analytics_destination_type  = var.log_analytics_destination_type
  storage_account_id              = var.storage_account_id
  eventhub_name                   = var.eventhub_name
  eventhub_authorization_rule_id  = var.eventhub_authorization_rule_id
  log_enabled                     = var.log_enabled
  log_retention_policy_enabled    = var.log_retention_policy_enabled
  log_retention_days              = var.log_retention_days
  metric_retention_policy_enabled = var.metric_retention_policy_enabled
  metric_retention_days           = var.metric_retention_days
}
```
<!-- END_TF_DOCS -->