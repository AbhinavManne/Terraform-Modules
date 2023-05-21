<!-- BEGIN_TF_DOCS -->
###### Last Updated[DD/MM/YYYY]: 7/11/2022

## Introduction

This module helps us to provision a Resource Lock to apply on any resource.

## File Structure 

This particular module is having the following configuration files.
- resource-lock.tf : This file is having the terraform code to provision the resources as per requirements.
- variables.tf : This file consists of all the variable definitions needed for the terraform code mentioned in resource-lock.tf
- outputs.tf : This file will be having the resource output details generated.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.27.0 |


## Resources

| Name | Type |
|------|------|
| [azurerm_management_lock.mgmtlock](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/management_lock) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_lock_level"></a> [lock\_level](#input\_lock\_level) | Specifies the Level to be used for the Lock | `string` | n/a | yes |
| <a name="input_notes"></a> [notes](#input\_notes) | Specifies some notes about the lock. | `string` | `"Default Note"` | no |
| <a name="input_resource_id"></a> [resource\_id](#input\_resource\_id) | Id of the resource on which resource lock needs to be applied | `string` | n/a | yes |
| <a name="input_resource_lock_name"></a> [resource\_lock\_name](#input\_resource\_lock\_name) | Name of the Resource Lock | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_resource_lock_id"></a> [resource\_lock\_id](#output\_resource\_lock\_id) | The ID of the resource lock |

## Modules
```
module "resource_lock_module" {
  source             = "../../modules/module_resource-lock"
  resource_lock_name = var.resource_lock_name
  resource_id        = var.resource_id
  lock_level         = var.lock_level
  notes              = var.notes
}
```
<!-- END_TF_DOCS -->