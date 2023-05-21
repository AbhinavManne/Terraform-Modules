<!-- BEGIN_TF_DOCS -->
###### Last Updated[DD/MM/YYYY]: 29/11/2022
## Introduction

Creates Watchlist and Watchlist Item for Microsoft Sentinel Workspace.

## File Structure 

This particular module is having the following configuration files.
- watchlist.tf : This file is having the terraform code to provision the resource as per requirements.
- variables.tf : This file consists of all the variable definitions needed for the terraform code mentioned in watchlist.tf
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
| [azurerm_sentinel_watchlist.watchlist](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/sentinel_watchlist) | resource |
| [azurerm_sentinel_watchlist_item.watchlist_item](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/sentinel_watchlist_item) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
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
| <a name="input_watchlist_config"></a> [watchlist\_config](#input\_watchlist\_config) | Manages a Sentinel Watchlist. It is mandatory to pass all the arguments in the object. However, if you do not wish to pass custom values to the following optional parameters, please pass 'null' as input. <br>Optional Arguments<br> <li><b><i>default_duration</i></b></li> <li><b><i>description</i></b></li> <li><b><i>labels</i></b></li> | <pre>object({<br>    name             = string<br>    display_name     = string<br>    item_search_key  = string<br>    default_duration = string<br>    description      = string<br>    labels           = list(string)<br>  })</pre> | n/a | no |
| <a name="input_watchlist_item_config"></a> [watchlist\_item\_config](#input\_watchlist\_item\_config) | Manages a Sentinel Watchlist Item. It is mandatory to pass all the arguments in the object. However, if you do not wish to pass custom values to the following optional parameters, please pass 'null' as input. <br>Optional Arguments<br> <li><b><i>name</i></b></li> | <pre>object({<br>    properties = map(string)<br>    name       = string<br>  })</pre> | n/a | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_watchlist_id"></a> [watchlist\_id](#output\_watchlist\_id) | The ID of the Sentinel Watchlist. |
| <a name="output_watchlist_item_id"></a> [watchlist\_item\_id](#output\_watchlist\_item\_id) | The ID of the Sentinel Watchlist Item. |

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

module "sentinel_watchlist_module" {
  source = "../../../modules/module_sentinel/sentinel_watchlist"

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

  watchlist_config = {
    name             = var.watchlist_config.name
    log_analytics_workspace_id = module.log_analytics_module.log_id
    display_name     = var.watchlist_config.display_name
    item_search_key  = var.watchlist_config.item_search_key
    default_duration = var.watchlist_config.default_duration
    description      = var.watchlist_config.description
    labels           = var.watchlist_config.labels
  }

  watchlist_item_config = {
    name       = var.watchlist_item_config.name
    properties = var.watchlist_item_config.properties
  }
}
```
<!-- END_TF_DOCS -->