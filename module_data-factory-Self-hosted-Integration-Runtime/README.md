<!-- BEGIN_TF_DOCS -->
#### last updated on :02-11-2022

## Introduction

* This module helps us to create a data factory Self Hosted Integration Runtime.
* Some of the arguments and blocks are optional by default so we have used lookup and dynamic blocks.


## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | =3.24.0|

## Resources

| Name | Type |
|------|------|
| [azurerm_data_factory_integration_runtime_self_hosted.integration_runtime](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/data_factory_integration_runtime_self_hosted) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_data_factory_id"></a> [data\_factory\_id](#input\_data\_factory\_id) | Data factory id | `string` | n/a | yes |
| <a name="input_integration_runtime_custom_name"></a> [integration\_runtime\_custom\_name](#input\_integration\_runtime\_custom\_name) | Name of the integration\_runtime resource | `string` | n/a | yes |
| <a name="input_integration_runtime_description"></a> [integration\_runtime\_description](#input\_integration\_runtime\_description) | Integration runtime description | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_data_factory_integration_runtime_id"></a> [data\_factory\_integration\_runtime\_id](#output\_data\_factory\_integration\_runtime\_id) | Azure Data factory integration runtime id |

## Module Usage

```
module "df-self-hosted" {
    source ="../../modules/module_data-factory-Self-hosted-Integration-Runtime"
  
  data_factory_id                 = var.data_factory_id
  integration_runtime_description = var.integration_runtime_description
  integration_runtime_custom_name = var.integration_runtime_custom_name
  resource_id                     = var.resource_id
}

```
<!-- END_TF_DOCS -->