<!-- BEGIN_TF_DOCS -->
Last Updated[DD/MM/YYYY]: 03/11/2022
# <u> Introduction </u>
* This module provides the facility to provision kusto cluster principal assignment. In this module we have included all possible argument for kusto cluster principal assignment .

## File Structure 
This particular module is having the following configuration files.
- kcpa.tf : This file is having the terraform code to provision the resources as per requirements.
- variables.tf : This file consist of all the variable definitions needed for the terraform code mentioned in main.tf
- output.tf : This file is having all the resource output details generated.





## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.29.0 |



## Resources

| Name | Type |
|------|------|
| [azurerm_kusto_cluster_principal_assignment.Kusto_cluster_Principal_Assignment](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kusto_cluster_principal_assignment) | resource |
| [azurerm_client_config.identity](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/client_config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_Kusto_cluster_Principal_Assignment"></a> [Kusto\_cluster\_Principal\_Assignment](#input\_Kusto\_cluster\_Principal\_Assignment) | The name of the Kusto cluster principal assignment. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_kusto_cluster"></a> [kusto\_cluster](#input\_kusto\_cluster) | Name of of Data Explorer | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Location for the Data Explorer | `string` | n/a | yes |
| <a name="input_principal_id"></a> [principal\_id](#input\_principal\_id) | The object id of the principal. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_principal_type"></a> [principal\_type](#input\_principal\_type) | The type of the principal. Valid values include App, Group, User. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Resource Group for the Data Explorer | `string` | n/a | yes |
| <a name="input_role"></a> [role](#input\_role) | The cluster role assigned to the principal. Valid values include AllDatabasesAdmin and AllDatabasesViewer. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to be applied to resources | `map(any)` | n/a | yes |
| <a name="input_tenant_id"></a> [tenant\_id](#input\_tenant\_id) | The tenant id in which the principal resides. Changing this forces a new resource to be created. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_Kusto_cluster_Principal_Assignment_id"></a> [Kusto\_cluster\_Principal\_Assignment\_id](#output\_Kusto\_cluster\_Principal\_Assignment\_id) | ID of the created Kusto\_cluster\_Principal\_Assignment |
## Module Usage
```
module "Kusto_cluster_Principal_Assignment" {
  source                             = "../../modules/module_kusto_cluster_Principal_Assignment"
  Kusto_cluster_Principal_Assignment = var.Kusto_cluster_Principal_Assignment
  tenant_id                          = var.tenant_id
  principal_id                       = var.principal_id
  principal_type                     = var.principal_type
  role                               = var.role
  kusto_cluster                      = var.kusto_cluster
  location                           = var.location
  resource_group_name                = var.resource_group_name
  tags                               = var.tags
}
```
<!-- END_TF_DOCS -->