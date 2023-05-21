<!-- BEGIN_TF_DOCS -->
##### last updated on : 07/11/2022

## Introduction

* This module helps to provision application security group resource.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.29.1 |



## Resources

| Name | Type |
|------|------|
| [azurerm_application_security_group.asg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/application_security_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_application_security_group"></a> [application\_security\_group](#input\_application\_security\_group) | Name of the Application Security Group | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The location/region to keep all your network resources. To get the list of all locations with table format from azure cli, run 'az account list-locations -o table' | `string` | `""` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Name of the resource group in which to create the Application Security Group | `string` | `""` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags | `map` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_resource_id"></a> [resource\_id](#output\_resource\_id) | The resource ID of the MySQL Server |

## Modules Usage

```
#Reference to application security group module
module "application_security_group_module" {
  source = "../../modules/module_application-security-group/asg"

  resource_group_name             = var.resource_group_name
  location                        = var.location
  application_security_group      = var.application_security_group
  tags                            = var.tags
}

```


<!-- END_TF_DOCS -->