<!-- BEGIN_TF_DOCS -->
###### Last Updated[DD/MM/YYYY]: 26/08/2022
##  Introduction 
This module provisions an availability set with proximity placement group.(Proximity placement group is optional.) 

## File Structure 
This particular module is having the following configuration files.
- availability_set.tf : This file is having the terraform code to provision the resources as per requirements.
- variables.tf : This file consist of all the variable definitions needed for the terraform code mentioned in availability_set.tf
- output.tf : This file is having all the resource output details generated.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 2.81.0 |

## Resources

| Name | Type |
|------|------|
| [azurerm_availability_set.avail_set](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/availability_set) | resource |
| [azurerm_proximity_placement_group.appgrp](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/proximity_placement_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_availability_set"></a> [availability\_set](#input\_availability\_set) | Name of the availability set in azure | `string` | n/a | yes |
| <a name="input_enable_proximity_placement_group"></a> [enable\_proximity\_placement\_group](#input\_enable\_proximity\_placement\_group) | Want to enable proximity\_placement\_group? | `bool` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The location/region to keep all your network resources. To get the list of all locations with table format from azure cli, run 'az account list-locations -o table' | `any` | n/a | yes |
| <a name="input_managed"></a> [managed](#input\_managed) | Specifies whether the availability set is managed or not. Possible values are true (to specify aligned) or false (to specify classic). Default is true. | `string` | "true" | no |
| <a name="input_platform_fault_domain_count"></a> [platform\_fault\_domain\_count](#input\_platform\_fault\_domain\_count) | Specifies the number of fault domains that are used. Defaults to 3. Changing this forces a new resource to be created. | `string` | "3" | no |
| <a name="input_platform_update_domain_count"></a> [platform\_update\_domain\_count](#input\_platform\_update\_domain\_count) | Specifies the number of update domains that are used. Defaults to 5. Changing this forces a new resource to be created. | `string` | "5" | no |
| <a name="input_proximity_placement_group_name"></a> [proximity\_placement\_group\_name](#input\_proximity\_placement\_group\_name) | Name of proximity placement group | `string` | n/a | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | A container that holds related resources for an Azure solution | `any` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags | `map(any)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_availability_set_id"></a> [availability\_set\_id](#output\_availability\_set\_id) | Availability set ID |
| <a name="output_proximity_placement_group_id"></a> [proximity\_placement\_group\_id](#output\_proximity\_placement\_group\_id) | proximity placement group id |

## Module Usage
```
#Reference to resource group creation module
module "resource_group" {
  source                           = "../../modules/module_resource-group-creation/resource_group"
  create_resource_group            = var.create_resource_group
  resource_group_name              = var.resource_group_name
  location                         = var.location
  tags                             = var.tags

}

#Reference to azure availability set creation module
module "availability_set" {
  source                       = "../../modules/module_availability_set/availability_set"
  resource_group_name          = module.resource_group.resource_group_name
  location                     = module.resource_group.resource_group_location
  availability_set             = var.availability_set
  platform_fault_domain_count  = var.platform_fault_domain_count
  platform_update_domain_count = var.platform_update_domain_count
  managed                      = var.managed
  tags                         = var.tags
  enable_proximity_placement_group = var.enable_proximity_placement_group
  proximity_placement_group_name   = var.proximity_placement_group_name
}
```

#### Refer this link to know more about Availability Sets: [Availability_Set_MSDOC](https://docs.microsoft.com/en-us/azure/virtual-machines/availability-set-overview)


#### Refer this link to know more about Availability Sets: [Availability_Set_Terraform](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/availability_set)

<!-- END_TF_DOCS -->