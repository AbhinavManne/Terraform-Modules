<!-- BEGIN_TF_DOCS -->
###### Last Updated[DD/MM/YYYY]: 29/11/2022
## Introduction

Creates Alert Rules for Microsoft Sentinel Workspace.

## File Structure 

This particular module is having the following configuration files.
- alertrule.tf : This file is having the terraform code to provision the resource as per requirements.
- variables.tf : This file consists of all the variable definitions needed for the terraform code mentioned in alertrule.tf
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
| [azurerm_sentinel_alert_rule_fusion.alert_rule_fusion](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/sentinel_alert_rule_fusion) | resource |
| [azurerm_sentinel_alert_rule_machine_learning_behavior_analytics.alert_rule_machine_learning_behavior_analytics](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/sentinel_alert_rule_machine_learning_behavior_analytics) | resource |
| [azurerm_sentinel_alert_rule_ms_security_incident.alert_rule_ms_security_incident](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/sentinel_alert_rule_ms_security_incident) | resource |
| [azurerm_sentinel_alert_rule_nrt.alert_rule_nrt](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/sentinel_alert_rule_nrt) | resource |
| [azurerm_sentinel_alert_rule_scheduled.alert_rule_scheduled](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/sentinel_alert_rule_scheduled) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alert_rule_fusion_config"></a> [alert\_rule\_fusion\_config](#input\_alert\_rule\_fusion\_config) | Manages a Sentinel Fusion Alert Rule. It is mandatory to pass all the arguments in the object. However, if you do not wish to pass custom values to the following optional parameters, please pass 'null' as input. <br>Optional Arguments<br> <li><b><i>enabled</i></b></li> | <pre>object({<br>    name                     = string<br>    alert_rule_template_guid = string<br>    enabled                  = bool<br>    <br>  })</pre> | n/a | yes |
| <a name="input_alert_rule_machine_learning_behavior_analytics_config"></a> [alert\_rule\_machine\_learning\_behavior\_analytics\_config](#input\_alert\_rule\_machine\_learning\_behavior\_analytics\_config) | Manages a Sentinel Machine Learning Behavior Analytics Alert Rule. It is mandatory to pass all the arguments in the object. However, if you do not wish to pass custom values to the following optional parameters, please pass 'null' as input. <br>Optional Arguments<br> <li><b><i>enabled</i></b></li> | <pre>object({<br>    name                     = string<br>    alert_rule_template_guid = string<br>    enabled                  = bool<br>  })</pre> | n/a | yes |
| <a name="input_alert_rule_ms_security_incident_config"></a> [alert\_rule\_ms\_security\_incident\_config](#input\_alert\_rule\_ms\_security\_incident\_config) | Manages a Sentinel MS Security Incident Alert Rule. It is mandatory to pass all the arguments in the object. However, if you do not wish to pass custom values to the following optional parameters, please pass 'null' as input. <br>Optional Arguments<br> <li><b><i>alert_rule_template_guid</i></b></li> <li><b><i>description</i></b></li> <li><b><i>enabled</i></b></li> <li><b><i>display_name_filter</i></b></li> <li><b><i>display_name_exclude_filter</i></b></li> | <pre>object({<br>    name                        = string<br>    display_name                = string<br>    product_filter              = string<br>    severity_filter             = list(string)<br>    alert_rule_template_guid    = string<br>    description                 = string<br>    enabled                     = bool<br>    display_name_filter         = list(string)<br>    display_name_exclude_filter = list(string)<br>  })</pre> | n/a | yes |
| <a name="input_alert_rule_nrt_config"></a> [alert\_rule\_nrt\_config](#input\_alert\_rule\_nrt\_config) | Manages a Sentinel NRT Alert Rule. It is mandatory to pass all the arguments in the object. However, if you do not wish to pass custom values to the following optional parameters, please pass 'null' as input. <br>Optional Arguments<br> <li><b><i>alert_rule_template_guid</i></b></li><li><b><i>alert_rule_template_version</i></b></li> <li><b><i>custom_details</i></b></li> <li><b><i>description</i></b></li> <li><b><i>enabled</i></b></li> <li><b><i>suppression_duration</i></b></li> <li><b><i>suppression_enabled</i></b></li> <li><b><i>tactics</i></b></li><br>Optional Blocks:<br> <li><b><i>alert_details_override</i></b></li> It is mandatory to pass all the arguments in the object. However, if you do not wish to pass custom values to the following optional parameters, please pass 'null' as input. <li><i>description_format</i></li> <li><i>display_name_format</i></li> <li><i>severity_column_name</i></li> <li><i>tactics_column_name</i></li><br> <li><b><i>entity_mapping</i></b></li> It is mandatory to pass all the arguments in the object.<br> <br> <li><b><i>incident</i></b></li> It is mandatory to pass all the arguments in the object. However, if you do not wish to pass custom values to the following optional parameters, please pass 'null' as input.<br>Optional Blocks:<br> <li><b><i>grouping</i></b></li> It is mandatory to pass all the arguments in the object. However, if you do not wish to pass custom values to the following optional parameters, please pass 'null' as input. <li><i>enabled</i></li> <li><i>lookback_duration</i></li> <li><i>reopen_closed_incidents</i></li> <li><i>entity_matching_method</i></li> <li><i>by_entities</i></li> <li><i>by_alert_details</i></li> <li><i>by_custom_details</i></li> | <pre>object({<br>    name         = string<br>    display_name = string<br>    severity     = string<br>    query        = string<br>    alert_details_override = object({<br>      description_format   = string<br>      display_name_format  = string<br>      severity_column_name = string<br>      tactics_column_name  = string<br>    })<br>    alert_rule_template_guid    = string<br>    alert_rule_template_version = string<br>    custom_details              = map(string)<br>    description                 = string<br>    enabled                     = bool<br>    entity_mapping = object({<br>      entity_type = string<br>      field_mapping = object({<br>        identifier  = string<br>        column_name = string<br>      })<br>    })<br>    incident = object({<br>      create_incident_enabled = bool<br>      grouping = object({<br>        enabled                 = bool<br>        lookback_duration       = string<br>        reopen_closed_incidents = bool<br>        entity_matching_method  = string<br>        by_entities             = list(string)<br>        by_alert_details        = list(string)<br>        by_custom_details       = list(string)<br>      })<br>    })<br>    suppression_duration = string<br>    suppression_enabled  = bool<br>    tactics              = list(string)<br>    })</pre> | n/a | yes |
| <a name="input_alert_rule_scheduled_config"></a> [alert\_rule\_scheduled\_config](#input\_alert\_rule\_scheduled\_config) | Manages a Sentinel Scheduled Alert Rule. It is mandatory to pass all the arguments in the object. However, if you do not wish to pass custom values to the following optional parameters, please pass 'null' as input. <br>Optional Arguments<br> <li><b><i>alert_rule_template_guid</i></b></li> <li><b><i>alert_rule_template_version</i></b></li> <li><b><i>custom_details</i></b></li> <li><b><i>description</i></b></li> <li><b><i>enabled</i></b></li> <li><b><i>query_frequency</i></b></li>  <li><b><i>query_period</i></b></li>  <li><b><i>suppression_duration</i></b></li> <li><b><i>suppression_enabled</i></b></li> <li><b><i>tactics</i></b></li> <li><b><i>techniques</i></b></li> <li><b><i>trigger_operator</i></b></li> <li><b><i>trigger_threshold</i></b></li> <br>Optional Blocks:<br> <li><b><i>alert_details_override</i></b></li> It is mandatory to pass all the arguments in the object. However, if you do not wish to pass custom values to the following optional parameters, please pass 'null' as input. <li><i>description_format</i></li> <li><i>display_name_format</i></li> <li><i>severity_column_name</i></li> <li><i>tactics_column_name</i></li> <br> <li><b><i>entity_mapping</i></b></li> It is mandatory to pass all the arguments in the object.  <br><br> <li><b><i>event_grouping</i></b></li> It is mandatory to pass all the arguments in the object. <br><br> <li><b><i>incident_configuration</i></b></li> It is mandatory to pass all the arguments in the object. However, if you do not wish to pass custom values to the following optional parameters, please pass 'null' as input.  <br>Optional Blocks:<br> <li><b><i>grouping</i></b></li> It is mandatory to pass all the arguments in the object. However, if you do not wish to pass custom values to the following optional parameters, please pass 'null' as input. <li><i>enabled</i></li> <li><i>lookback_duration</i></li> <li><i>reopen_closed_incidents</i></li> <li><i>entity_matching_method</i></li> <li><i>group_by_entities</i></li> <li><i> group_by_alert_details</i></li> <li><i> group_by_custom_details</i></li> | <pre>object({<br>    name         = string<br>    display_name = string<br>    severity     = string<br>    query        = string<br>    alert_details_override = object({<br>      description_format   = string<br>      display_name_format  = string<br>      severity_column_name = string<br>      tactics_column_name  = string<br>    })<br>    alert_rule_template_guid    = string<br>    alert_rule_template_version = string<br>    custom_details              = map(string)<br>    description                 = string<br>    enabled                     = bool<br>    entity_mapping = object({<br>      entity_type = string<br>      field_mapping = object({<br>        identifier  = string<br>        column_name = string<br>      })<br>    })<br>    event_grouping = object({<br>      aggregation_method = string<br>    })<br>    incident_configuration = object({<br>      create_incident = bool<br>      grouping = object({<br>        enabled                 = bool<br>        lookback_duration       = string<br>        reopen_closed_incidents = bool<br>        entity_matching_method  = string<br>        group_by_entities       = list(string)<br>        group_by_alert_details  = list(string)<br>        group_by_custom_details = list(string)<br>      })<br>    })<br>    query_frequency      = string<br>    query_period         = string<br>    suppression_duration = string<br>    suppression_enabled  = bool<br>    tactics              = list(string)<br>    techniques           = list(string)<br>    trigger_operator     = string<br>    trigger_threshold    = number<br>  })</pre> | n/a | yes |
| <a name="input_create_log_analytics_solution"></a> [create\_log\_analytics\_solution](#input\_create\_log\_analytics\_solution) | If you want to create a log analytics solution resource or not | `bool` | `false` | no |
| <a name="input_daily_quota_gb"></a> [daily\_quota\_gb](#input\_daily\_quota\_gb) | The workspace daily quota for ingestion in GB. | `number` | `-1` | no |
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
| <a name="output_sentinel_fusion_alert_rule_id"></a> [sentinel\_fusion\_alert\_rule\_id](#output\_sentinel\_fusion\_alert\_rule\_id) | The ID of the Sentinel Fusion Alert Rule. |
| <a name="output_sentinel_machine_learning_behavior_analytics_alert_rule_id"></a> [sentinel\_machine\_learning\_behavior\_analytics\_alert\_rule\_id](#output\_sentinel\_machine\_learning\_behavior\_analytics\_alert\_rule\_id) | The ID of the Sentinel Machine Learning Behavior Analytics Alert Rule. |
| <a name="output_sentinel_ms_security_incident_alert_rule_id"></a> [sentinel\_ms\_security\_incident\_alert\_rule\_id](#output\_sentinel\_ms\_security\_incident\_alert\_rule\_id) | The ID of the Sentinel MS Security Incident Alert Rule. |
| <a name="output_sentinel_nrt_alert_rule_id"></a> [sentinel\_nrt\_alert\_rule\_id](#output\_sentinel\_nrt\_alert\_rule\_id) | The ID of the Sentinel NRT Alert Rule. |
| <a name="output_sentinel_scheduled_alert_rule_id"></a> [sentinel\_scheduled\_alert\_rule\_id](#output\_sentinel\_scheduled\_alert\_rule\_id) | The ID of the Sentinel Scheduled Alert Rule. |

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

module "sentinel_alert_rule_module" {
  source = "../../../modules/module_sentinel/sentinel_alert_rule"

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

  alert_rule_fusion_config = {
    log_analytics_workspace_id = module.log_analytics_module.log_id
    alert_rule_template_guid = var.alert_rule_fusion_config.alert_rule_template_guid
    enabled                  = var.alert_rule_fusion_config.enabled
    name                     = var.alert_rule_fusion_config.name
  }

  alert_rule_machine_learning_behavior_analytics_config = {
    log_analytics_workspace_id = module.log_analytics_module.log_id
    alert_rule_template_guid = var.alert_rule_machine_learning_behavior_analytics_config.alert_rule_template_guid
    enabled                  = var.alert_rule_machine_learning_behavior_analytics_config.enabled
    name                     = var.alert_rule_machine_learning_behavior_analytics_config.name
  }

  alert_rule_ms_security_incident_config = {
    log_analytics_workspace_id = module.log_analytics_module.log_id
    alert_rule_template_guid    = var.alert_rule_ms_security_incident_config.alert_rule_template_guid
    description                 = var.alert_rule_ms_security_incident_config.description
    display_name                = var.alert_rule_ms_security_incident_config.display_name
    display_name_exclude_filter = var.alert_rule_ms_security_incident_config.display_name_exclude_filter
    display_name_filter         = var.alert_rule_ms_security_incident_config.display_name_filter
    enabled                     = var.alert_rule_ms_security_incident_config.enabled
    name                        = var.alert_rule_ms_security_incident_config.name
    product_filter              = var.alert_rule_ms_security_incident_config.product_filter
    severity_filter             = var.alert_rule_ms_security_incident_config.severity_filter
  }

  alert_rule_nrt_config = {
    log_analytics_workspace_id = module.log_analytics_module.log_id
    alert_details_override = {
      description_format   = var.alert_rule_nrt_config.alert_details_override.description_format
      display_name_format  = var.alert_rule_nrt_config.alert_details_override.display_name_format
      severity_column_name = var.alert_rule_nrt_config.alert_details_override.severity_column_name
      tactics_column_name  = var.alert_rule_nrt_config.alert_details_override.tactics_column_name
    }
    alert_rule_template_guid    = var.alert_rule_nrt_config.alert_rule_template_guid
    alert_rule_template_version = var.alert_rule_nrt_config.alert_rule_template_version
    custom_details              = var.alert_rule_nrt_config.custom_details
    description                 = var.alert_rule_nrt_config.description
    display_name                = var.alert_rule_nrt_config.display_name
    enabled                     = var.alert_rule_nrt_config.enabled
    entity_mapping = {
      entity_type = var.alert_rule_nrt_config.entity_mapping.entity_type
      field_mapping = {
        identifier  = var.alert_rule_nrt_config.entity_mapping.field_mapping.identifier
        column_name = var.alert_rule_nrt_config.entity_mapping.field_mapping.column_name
      }
    }
    incident = {
      create_incident_enabled = var.alert_rule_nrt_config.incident.create_incident_enabled
      grouping = {
        enabled                 = var.alert_rule_nrt_config.incident.grouping.enabled
        lookback_duration       = var.alert_rule_nrt_config.incident.grouping.lookback_duration
        reopen_closed_incidents = var.alert_rule_nrt_config.incident.grouping.reopen_closed_incidents
        entity_matching_method  = var.alert_rule_nrt_config.incident.grouping.entity_matching_method
        by_entities             = var.alert_rule_nrt_config.incident.grouping.by_entities
        by_alert_details        = var.alert_rule_nrt_config.incident.grouping.by_alert_details
        by_custom_details       = var.alert_rule_nrt_config.incident.grouping.by_custom_details
      }
    }
    name                 = var.alert_rule_nrt_config.name
    display_name         = var.alert_rule_nrt_config.display_name
    severity             = var.alert_rule_nrt_config.severity
    query                = var.alert_rule_nrt_config.query
    suppression_duration = var.alert_rule_nrt_config.suppression_duration
    suppression_enabled  = var.alert_rule_nrt_config.suppression_enabled
    tactics              = var.alert_rule_nrt_config.tactics
  }

  alert_rule_scheduled_config = {
    log_analytics_workspace_id = module.log_analytics_module.log_id
    alert_details_override = {
      description_format   = var.alert_rule_scheduled_config.alert_details_override.description_format
      display_name_format  = var.alert_rule_scheduled_config.alert_details_override.display_name_format
      severity_column_name = var.alert_rule_scheduled_config.alert_details_override.severity_column_name
      tactics_column_name  = var.alert_rule_scheduled_config.alert_details_override.tactics_column_name
    }
    alert_rule_template_guid    = var.alert_rule_scheduled_config.alert_rule_template_guid
    alert_rule_template_version = var.alert_rule_scheduled_config.alert_rule_template_version
    custom_details              = var.alert_rule_scheduled_config.custom_details
    description                 = var.alert_rule_scheduled_config.description
    display_name                = var.alert_rule_scheduled_config.display_name
    enabled                     = var.alert_rule_scheduled_config.enabled
    entity_mapping = {
      entity_type = var.alert_rule_scheduled_config.entity_mapping.entity_type
      field_mapping = {
        identifier  = var.alert_rule_scheduled_config.entity_mapping.field_mapping.identifier
        column_name = var.alert_rule_scheduled_config.entity_mapping.field_mapping.column_name
      }
    }
    event_grouping = {
      aggregation_method = var.alert_rule_scheduled_config.event_grouping.aggregation_method
    }
    incident_configuration = {
      create_incident = var.alert_rule_scheduled_config.incident_configuration.create_incident
      grouping = {
        enabled                 = var.alert_rule_scheduled_config.incident_configuration.grouping.enabled
        lookback_duration       = var.alert_rule_scheduled_config.incident_configuration.grouping.lookback_duration
        reopen_closed_incidents = var.alert_rule_scheduled_config.incident_configuration.grouping.reopen_closed_incidents
        entity_matching_method  = var.alert_rule_scheduled_config.incident_configuration.grouping.entity_matching_method
        group_by_entities       = var.alert_rule_scheduled_config.incident_configuration.grouping.group_by_entities
        group_by_alert_details  = var.alert_rule_scheduled_config.incident_configuration.grouping.group_by_alert_details
        group_by_custom_details = var.alert_rule_scheduled_config.incident_configuration.grouping.group_by_custom_details
      }
    }
    name                 = var.alert_rule_scheduled_config.name
    display_name         = var.alert_rule_scheduled_config.display_name
    severity             = var.alert_rule_scheduled_config.severity
    query                = var.alert_rule_scheduled_config.query
    query_frequency      = var.alert_rule_scheduled_config.query_frequency
    query_period         = var.alert_rule_scheduled_config.query_period
    suppression_duration = var.alert_rule_scheduled_config.suppression_duration
    suppression_enabled  = var.alert_rule_scheduled_config.suppression_enabled
    tactics              = var.alert_rule_scheduled_config.tactics
    techniques           = var.alert_rule_scheduled_config.techniques
    trigger_operator     = var.alert_rule_scheduled_config.trigger_operator
    trigger_threshold    = var.alert_rule_scheduled_config.trigger_threshold
  }
}
```
<!-- END_TF_DOCS -->