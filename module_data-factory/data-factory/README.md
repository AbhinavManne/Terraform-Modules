<!-- BEGIN_TF_DOCS -->
#### last updated on :28-09-2022

## Introduction

* This module helps us to create a data factory.
* All the blocks in df is optional so we declared the block as dynamic.


## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | =3.24.0|


## Resources

| Name | Type |
|------|------|
| [azurerm_data_factory.df](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/data_factory) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_customer_managed_key_id"></a> [customer\_managed\_key\_id](#input\_customer\_managed\_key\_id) | Specifies the Azure Key Vault Key ID to be used as the Customer Managed Key (CMK) for double encryption. Required with user assigned identity. | `string` | `null` | no |
| <a name="input_customer_managed_key_identity_id"></a> [customer\_managed\_key\_identity\_id](#input\_customer\_managed\_key\_identity\_id) | Specifies the ID of the user assigned identity associated with the Customer Managed Key. | `string` | `null` | no |
| <a name="input_data_factory_name"></a> [data\_factory\_name](#input\_data\_factory\_name) | Specifies the name of the Data Factory | `string` | n/a | yes |
| <a name="input_github_configuration"></a> [github\_configuration](#input\_github\_configuration) | github\_configuration block | `map(any)` | `null` | no |
| <a name="input_global_parameter"></a> [global\_parameter](#input\_global\_parameter) | n/a | <pre>list(object ({<br>      name  = string<br>      type  = string<br>      value = number<br>  }))</pre> | `null` | no |
| <a name="input_identity_ids"></a> [identity\_ids](#input\_identity\_ids) | id of user assigned managed identity | `list(string)` | `null` | no |
| <a name="input_identity_type"></a> [identity\_type](#input\_identity\_type) | Identity type (system assigned or user assigned) | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Resource group location | `string` | n/a | yes |
| <a name="input_managed_virtual_network_enabled"></a> [managed\_virtual\_network\_enabled](#input\_managed\_virtual\_network\_enabled) | Is Managed Virtual Network enabled? | `bool` | `false` | no |
| <a name="input_public_network_enabled"></a> [public\_network\_enabled](#input\_public\_network\_enabled) | Is the Data Factory visible to the public network? | `bool` | `true` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Resource group name | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags | `map(any)` | n/a | yes |
| <a name="input_vsts_configuration"></a> [vsts\_configuration](#input\_vsts\_configuration) | vsts\_configuration block . | `map(any)` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_data_factory_id"></a> [data\_factory\_id](#output\_data\_factory\_id) | n/a |


## Module Usage

```
module "data_factory" {
  source                           = "../../modules/module_data-factory/data-factory"
  resource_group_name              = var.resource_group_name
  location                         = var.location
  data_factory_name                = var.data_factory_name
  tags                             = var.tags
  identity_type                    = var.identity_type
  identity_ids                     = var.identity_ids
  github_configuration             = var.github_configuration
  vsts_configuration               = var.vsts_configuration
  global_parameter                 = var.global_parameter
  managed_virtual_network_enabled  = var.managed_virtual_network_enabled
  public_network_enabled           = var.public_network_enabled
  customer_managed_key_id          = var.customer_managed_key_id
  customer_managed_key_identity_id = var.customer_managed_key_identity_id
}

```
<!-- END_TF_DOCS -->