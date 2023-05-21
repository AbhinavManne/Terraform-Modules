<!-- BEGIN_TF_DOCS -->
###### Last Updated[DD/MM/YYYY]: 29/11/2022
## Introduction

Creates Automation Rules for Microsoft Sentinel Workspace.

## File Structure 

This particular module is having the following configuration files.
- automationrule.tf : This file is having the terraform code to provision the resource as per requirements.
- variables.tf : This file consists of all the variable definitions needed for the terraform code mentioned in automationrule.tf
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
| [azurerm_sentinel_automation_rule.automation_rule](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/sentinel_automation_rule) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_automation_rule_config"></a> [automation\_rule\_config](#input\_automation\_rule\_config) | Manages a Sentinel Automation Rule. It is mandatory to pass all the arguments in the object. However, if you do not wish to pass custom values to the following optional parameters, please pass 'null' as input. <br>Optional Arguments<br> <li><b><i>enabled</i></b></li> <li><b><i>expiration</i></b></li> <br>Optional Blocks:<br> <li><b><i>action_incident</i></b></li> It is mandatory to pass all the arguments in the object. However, if you do not wish to pass custom values to the following optional parameters, please pass 'null' as input. <li><i>status</i></li> <li><i>classification</i></li> <li><i>classification_comment</i></li> <li><i>labels</i></li> <li><i>owner_id</i></li> <li><i>severity</i></li> <br>  <li><b><i>action_playbook</i></b></li> It is mandatory to pass all the arguments in the object. However, if you do not wish to pass custom values to the following optional parameters, please pass 'null' as input. <li><i>tenant_id</i></li>  <br> <li><b><i>condition</i></b></li> It is mandatory to pass all the arguments in the object. | <pre>object({<br>    name         = string<br>    display_name = string<br>    order        = number<br>    action_incident = object({<br>      order                  = number<br>      status                 = string<br>      classification         = string<br>      classification_comment = string<br>      labels                 = list(string)<br>      owner_id               = string<br>      severity               = string<br>    })<br>    action_playbook = object({<br>      logic_app_id = string<br>      order =  number<br>      tenant_id = string<br>    })<br>    condition = object({<br>      operator = string<br>      property = string<br>      values   = list(string)<br>    })<br>    enabled    = bool<br>    expiration = string<br>  })</pre> | <pre>{<br>  "action_incident": {<br>    "classification": null,<br>    "classification_comment": null,<br>    "labels": null,<br>    "order": null,<br>    "owner_id": null,<br>    "severity": null,<br>    "status": null<br>  },<br>  "action_playbook": {<br>    "logic_app_id": null,<br>    "order": null,<br>    "tenant_id": null<br>  },<br>  "condition": {<br>    "operator": null,<br>    "property": null,<br>    "values": null<br>  },<br>  "display_name": null,<br>  "enabled": true,<br>  "expiration": null,<br>  "name": null,<br>  "order": null<br>}</pre> | yes |
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
| <a name="output_sentinel_automation_rule_id"></a> [sentinel\_automation\_rule\_id](#output\_sentinel\_automation\_rule\_id) | The ID of the Sentinel Automation Rule. |

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

module "sentinel_automation_rule_module" {
  source = "../../../modules/module_sentinel/sentinel_automation_rule"
  
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

  automation_rule_config = {
    log_analytics_workspace_id = module.log_analytics_module.log_id
    action_incident = {
      order                  = var.automation_rule_config.action_incident.order
      status                 = var.automation_rule_config.action_incident.status
      classification         = var.automation_rule_config.action_incident.classification
      classification_comment = var.automation_rule_config.action_incident.classification_comment
      labels                 = var.automation_rule_config.action_incident.labels
      owner_id               = var.automation_rule_config.action_incident.owner_id
      severity               = var.automation_rule_config.action_incident.severity
    }
    action_playbook = {
      logic_app_id = var.automation_rule_config.action_playbook.logic_app_id
      order        = var.automation_rule_config.action_playbook.order
      tenant_id    = var.automation_rule_config.action_playbook.tenant_id
    }
    condition = {
      operator = var.automation_rule_config.condition.operator
      property = var.automation_rule_config.condition.property
      values   = var.automation_rule_config.condition.values
    }
    display_name = var.automation_rule_config.display_name
    enabled      = var.automation_rule_config.enabled
    expiration   = var.automation_rule_config.expiration
    name         = var.automation_rule_config.name
    order        = var.automation_rule_config.order
  }
}
```
<!-- END_TF_DOCS -->