<!-- BEGIN_TF_DOCS -->
###### Last Updated[DD/MM/YYYY]: 07/10/2022
##  Introduction 
A resource group is a container that holds related resources for an Azure solution. The resource group can include all the resources for the solution, or only those resources that you want to manage as a group. You decide how you want to add resources to resource groups based on what makes the most sense for your goal. 

##  Resources used in the module: 
* Resource Group

## File Structure 
This particular module is having the following configuration files.
- resource-group.tf : This file is having the terraform code to provision the resource group.
- Variables.tf : This file consist of all the variable definitions of variables used in resource-group.tf file.
- Output.tf : This file is having the resource group output details.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.26.0 |


## Resources

| Name | Type |
|------|------|
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_resource_group.rgrp](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_resource_group"></a> [create\_resource\_group](#input\_create\_resource\_group) | Whether to create resource group and use it for all networking resources | `bool` | false | yes |
| <a name="input_location"></a> [location](#input\_location) | The location/region to keep all your resources. To get the list of all locations with table format from azure cli, run 'az account list-locations -o table' | `string` | East US | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Resource group name | `string` | rg-cil-test | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags | `map(any)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_resource_group_id"></a> [resource\_group\_id](#output\_resource\_group\_id) | Resource group ID |
| <a name="output_resource_group_location"></a> [resource\_group\_location](#output\_resource\_group\_location) | Resource group location |
| <a name="output_resource_group_name"></a> [resource\_group\_name](#output\_resource\_group\_name) | Resource group name |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_module_create_resource_group"></a> [module\_create\_resource\_group](#module\_module\_create\_resource\_group) | ../../modules/module_resource-group-creation/resource_group | n/a |

## Module Usage
* You can call the specified Resource Group module in any script where you want to use it.
```
#Reference to resource group creation module
module "module_create_resource_group" {
  source                           = "../../modules/module_resource-group-creation/resource_group"
  create_resource_group            = var.create_resource_group
  resource_group_name              = var.resource_group_name
  location                         = var.location
  tags                             = var.tags

}
```

## Locals
We have used locals to give a name to the result of any Terraform expression, and re-use that name throughout our configuration. Unlike input variables, locals are not set directly by users.
```
locals {
  resource_group_name = element(coalescelist(data.azurerm_resource_group.rgrp.*.name, azurerm_resource_group.rg.*.name, [""]), 0)
  location            = element(coalescelist(data.azurerm_resource_group.rgrp.*.location, azurerm_resource_group.rg.*.location, [""]), 0)
}
```

## Resoure Group
Azure automatically deletes any Resources nested within the Resource Group when a Resource Group is deleted.

* <u>'var.create_resource_group'</u>: If you want to create a resource group then you can give the bool value 'true' otherwise 'false' to use an existing resource group.

* <u>'name'</u>:(Required) The Name which should be used for this Resource Group. Changing this forces a new Resource Group to be created.

* <u>'location'</u>:(Required) The Azure Region where the Resource Group should exist. Changing this forces a new Resource Group to be created.

* <u>'tags'</u>:(Optional) A mapping of tags which should be assigned to the Resource Group.

#### Refer this link to know more about Resource Group: [Resource_Group](https://docs.microsoft.com/en-us/azure/azure-resource-manager/management/manage-resource-groups-portal)


<!-- END_TF_DOCS -->