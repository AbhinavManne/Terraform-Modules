<!-- BEGIN_TF_DOCS -->
## last updated :

## Introduction
* This module helps us to create management group module.
* In our subscription we are not allowed to create/test management group.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_management_group.mg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/management_group) | resource |
| [azurerm_subscription.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subscription) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_children"></a> [children](#input\_children) | n/a | `any` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | n/a | `any` | n/a | yes |
| <a name="input_parent_management_group_id"></a> [parent\_management\_group\_id](#input\_parent\_management\_group\_id) | n/a | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_azurerm_management_group"></a> [azurerm\_management\_group](#output\_azurerm\_management\_group) | ID of management group |

## Module Usage
```
module "azure-management-group" {
  source                     = "../../modules/module_azure-management-group"
  name                       = var.name
  display_name               = var.display_name
  parent_management_group_name = var.parent_management_group_name
  subscription_ids           = var.subscription_ids
}
```
<!-- END_TF_DOCS -->