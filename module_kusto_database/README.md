<!-- BEGIN_TF_DOCS -->
Last Updated[DD/MM/YYYY]: 03/11/2022
# <u> Introduction </u>
* This module provides the facility to provision kusto database. In this module we have included all possible argument for kusto database.

## File Structure 
This particular module is having the following configuration files.
- kustodatabase.tf : This file is having the terraform code to provision the resources as per requirements.
- variables.tf : This file consist of all the variable definitions needed for the terraform code mentioned in main.tf
- output.tf : This file is having all the resource output details generated.





## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.29.0 |



## Resources

| Name | Type |
|------|------|
| [azurerm_kusto_database.kusto_database](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kusto_database) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_hot_cache_period"></a> [hot\_cache\_period](#input\_hot\_cache\_period) | The time the data that should be kept in cache for fast queries as ISO 8601 timespan. Default is unlimited. For more information see: ISO 8601 Timespan | `string` | `null` | no |
| <a name="input_kusto_cluster"></a> [kusto\_cluster](#input\_kusto\_cluster) | Name of of Data Explorer | `string` | n/a | yes |
| <a name="input_kusto_database"></a> [kusto\_database](#input\_kusto\_database) | The name of the Kusto Database to create. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Location for the Data Explorer | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Resource Group for the Data Explorer | `string` | n/a | yes |
| <a name="input_soft_delete_period"></a> [soft\_delete\_period](#input\_soft\_delete\_period) | The time the data should be kept before it stops being accessible to queries as ISO 8601 timespan. Default is unlimited. For more information see: ISO 8601 Timespan | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to be applied to resources | `map(any)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_kusto_database_id"></a> [kusto\_database\_id](#output\_kusto\_database\_id) | ID of the created kusto database |

## Module Usage
```
module "kusto_database" {
  source              = "../../modules/module_kusto_database"
  kusto_database      = var.kusto_database
  hot_cache_period    = var.hot_cache_period
  soft_delete_period  = var.soft_delete_period
  kusto_cluster       = var.kusto_cluster
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags
}
```
<!-- END_TF_DOCS -->