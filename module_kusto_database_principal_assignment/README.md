<!-- BEGIN_TF_DOCS -->
Last Updated[DD/MM/YYYY]: 03/11/2022
# <u> Introduction </u>
* This module provides the facility to provision kusto database principal assignment. In this module we have included all possible argument for kusto database principal assignment.

## File Structure 
This particular module is having the following configuration files.
- kdpa.tf : This file is having the terraform code to provision the resources as per requirements.
- variables.tf : This file consist of all the variable definitions needed for the terraform code mentioned in main.tf
- output.tf : This file is having all the resource output details generated.




## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.29.0 |


## Resources

| Name | Type |
|------|------|
| [azurerm_kusto_database_principal_assignment.kusto_database_principal_assignment](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kusto_database_principal_assignment) | resource |
| [azurerm_client_config.identity](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/client_config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_kusto_cluster"></a> [kusto\_cluster](#input\_kusto\_cluster) | Name of of Data Explorer | `string` | n/a | yes |
| <a name="input_kusto_database"></a> [kusto\_database](#input\_kusto\_database) | The name of the Kusto Database to create. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_kusto_database_principal_assignment"></a> [kusto\_database\_principal\_assignment](#input\_kusto\_database\_principal\_assignment) | name of kusto database principal assignment | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Location for the Data Explorer | `string` | n/a | yes |
| <a name="input_principal_type"></a> [principal\_type](#input\_principal\_type) | The type of the principal. Valid values include App, Group, User. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Resource Group for the Data Explorer | `string` | n/a | yes |
| <a name="input_role"></a> [role](#input\_role) | The cluster role assigned to the principal. Valid values include AllDatabasesAdmin and AllDatabasesViewer. Changing this forces a new resource to be created. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_kusto_database_principal_assignment_id"></a> [kusto\_database\_principal\_assignment\_id](#output\_kusto\_database\_principal\_assignment\_id) | ID of the created kusto\_database\_principal\_assignment |

## Module Usage
```
module "kusto_database_principal_assignment" {
  source              = "../../modules/module_kusto_databasee_principal_assignment"
  kusto_cluster       = var.kusto_cluster
  location            = var.location
  resource_group_name = var.resource_group_name
  #tenant_id                           = var.tenant_id
  #principal_id                        = var.principal_id
  principal_type                      = var.principal_type
  role                                = var.role
  kusto_database_principal_assignment = var.kusto_database_principal_assignment
  kusto_database                      = var.kusto_database
  tags                                = var.tags
}
```
<!-- END_TF_DOCS -->