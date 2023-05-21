<!-- BEGIN_TF_DOCS -->
#### last updated on :02-11-2022

## Introduction

* This module helps us to create a data factory Azure SSIS Integration Runtime.
* Some of the arguments and blocks are optional by default so we have used lookup and dynamic blocks.


## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | =3.24.0|


## Resources

| Name | Type |
|------|------|
| [azurerm_data_factory_integration_runtime_azure_ssis.integration_runtime](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/data_factory_integration_runtime_azure_ssis) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_catalog_info"></a> [catalog\_info](#input\_catalog\_info) | A catalog\_info block in azure SSIS | `map(string)` | `null` | no |
| <a name="input_custom_setup_script"></a> [custom\_setup\_script](#input\_custom\_setup\_script) | A custom\_setup\_script block Azure SSIS | `map(string)` | `null` | no |
| <a name="input_data_factory_id"></a> [data\_factory\_id](#input\_data\_factory\_id) | Data factory id | `string` | n/a | yes |
| <a name="input_integration_runtime_configuration"></a> [integration\_runtime\_configuration](#input\_integration\_runtime\_configuration) | Parameters used to configure `AzureSSIS` integration runtime:<br>     `node_size` (optional, defaults to `Standard_D2_v3`)<br>    `number_of_nodes` (optional, defaults to `1`)<br>    `max_parallel_executions_per_nodes` (optional, defaults to `1`)<br>    `edition` (optional, defaults to `Standard`)<br>    `license_type` (optional, defaults to `LicenseIncluded`) | `map(any)` | `{}` | no |
| <a name="input_integration_runtime_custom_name"></a> [integration\_runtime\_custom\_name](#input\_integration\_runtime\_custom\_name) | Name of the integration\_runtime resource | `string` | n/a | yes |
| <a name="input_integration_runtime_description"></a> [integration\_runtime\_description](#input\_integration\_runtime\_description) | Integration runtime description | `string` | `null` | no |
| <a name="input_location"></a> [location](#input\_location) | Resource group location | `string` | n/a | yes |
| <a name="input_package_store"></a> [package\_store](#input\_package\_store) | package store block in azure ssis | `map(map(string))` | `null` | no |
| <a name="input_proxy"></a> [proxy](#input\_proxy) | A proxy block in Azure SSIS | `map(string)` | `null` | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | ID of subnet | `string` | n/a | yes |
| <a name="input_vnet_integration"></a> [vnet\_integration](#input\_vnet\_integration) | A vnet integration block for azure SSIS | <pre>object({<br>      vnet_id   = string <br>      subnet_name = string<br>      subnet_id  = string<br>      public_ips = list(string)<br><br>  })</pre> | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_data_factory_integration_runtime_id"></a> [data\_factory\_integration\_runtime\_id](#output\_data\_factory\_integration\_runtime\_id) | Azure Data factory integration runtime id |

## Module Usage
```
module "df-azure-ssis" {
  source = "../../modules/module_data-factory-SSIS-Integration-Runtime"

  data_factory_id                   = var.data_factory_id
  location                          = var.location
  integration_runtime_description   = var.integration_runtime_description
  integration_runtime_custom_name   = var.integration_runtime_custom_name
  integration_runtime_configuration = var.integration_runtime_configuration
  catalog_info                      = var.catalog_info
  custom_setup_script               = var.custom_setup_script
  express_custom_setup              = var.express_custom_setup
  package_store                     = var.package_store
  proxy                             = var.proxy
  vnet_integration                  = var.vnet_integration
  key_vault_password                = var.key_vault_password
  key_vault_license                 = var.key_vault_license
  linked_service_name               = var.linked_service_name
  secret_name                       = var.secret_name
  secret_version                    = var.secret_version
  parameters                        = var.parameters
  linked_service_name_1               = var.linked_service_name_1
  secret_name_1                       = var.secret_name_1
  secret_version_1                    = var.secret_version_1
  parameters_1                        = var.parameters_1
  subnet_id                          = var.subnet_id
}
```
<!-- END_TF_DOCS -->