<!-- BEGIN_TF_DOCS -->
#### last updated : 05-09-2022

## Introduction
This module helps us to provision synapse analytics workspace along with the sql pool and spark pool resources.

* By default all the dynamic blocks inside synapse workspace is optional.

* The identity block should not be uncommented .

* We can create multiple sql pool and spark pool ,also by default they are optional .

* Firewall rule is optional by default ,we can add multiple firewall rules.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) |  |


## Resources

| Name | Type |
|------|------|
| [azurerm_storage_data_lake_gen2_filesystem.egen2](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_data_lake_gen2_filesystem) | resource |
| [azurerm_synapse_firewall_rule.synapsefwrule](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/synapse_firewall_rule) | resource |
| [azurerm_synapse_spark_pool.sparkpool](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/synapse_spark_pool) | resource |
| [azurerm_synapse_sql_pool.sqlpool](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/synapse_sql_pool) | resource |
| [azurerm_synapse_workspace.azsynapse](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/synapse_workspace) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aad_admin"></a> [aad\_admin](#input\_aad\_admin) | AzureAD Admin block | `map(any)` | `null` | no |
| <a name="input_adminlogin"></a> [adminlogin](#input\_adminlogin) | Specifies The Login Name of the SQL administrator. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_adminpassword"></a> [adminpassword](#input\_adminpassword) | The Password associated with the sql\_administrator\_login for the SQL administrator. | `string` | n/a | yes |
| <a name="input_azure_devops_repo"></a> [azure\_devops\_repo](#input\_azure\_devops\_repo) | azure\_devops\_repo configuration block. | `map(any)` | `null` | no |
| <a name="input_compute_subnet_id"></a> [compute\_subnet\_id](#input\_compute\_subnet\_id) | Subnet ID used for computes in workspace | `string` | `null` | no |
| <a name="input_data_exfiltration_protection_enabled"></a> [data\_exfiltration\_protection\_enabled](#input\_data\_exfiltration\_protection\_enabled) | s data exfiltration protection enabled in synapse workspace? | `any` | n/a | yes |
| <a name="input_filesystem_name"></a> [filesystem\_name](#input\_filesystem\_name) | filesystem name | `string` | n/a | yes |
| <a name="input_firewall_rules"></a> [firewall\_rules](#input\_firewall\_rules) | Range of IP addresses to allow firewall connections. | <pre>map(object({<br><br>    start_ip_address = string<br>    end_ip_address   = string<br><br>  }))</pre> | n/a | yes |
| <a name="input_github_repo"></a> [github\_repo](#input\_github\_repo) | github\_repo configuration block | `map(any)` | `null` | no |
| <a name="input_linking_allowed_for_aad_tenant_ids"></a> [linking\_allowed\_for\_aad\_tenant\_ids](#input\_linking\_allowed\_for\_aad\_tenant\_ids) | Allowed AAD Tenant Ids For Linking. | `list(string)` | `null` | no |
| <a name="input_location"></a> [location](#input\_location) | The location/region to keep all your network resources. To get the list of all locations with table format from azure cli, run 'az account list-locations -o table' | `any` | n/a | yes |
| <a name="input_managed_resource_group_name"></a> [managed\_resource\_group\_name](#input\_managed\_resource\_group\_name) | value | `string` | n/a | yes |
| <a name="input_managed_virtual_network_enabled"></a> [managed\_virtual\_network\_enabled](#input\_managed\_virtual\_network\_enabled) | Is Virtual Network enabled for all computes in this workspace? Defaults to false. | `bool` | n/a | yes |
| <a name="input_public_network_access_enabled"></a> [public\_network\_access\_enabled](#input\_public\_network\_access\_enabled) | Whether public network access is allowed for the Cognitive Account | `string` | `true` | no |
| <a name="input_purview_id"></a> [purview\_id](#input\_purview\_id) | The ID of purview account. | `string` | `null` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Name of the resource group to be imported. | `string` | n/a | yes |
| <a name="input_sql_aad_admin"></a> [sql\_aad\_admin](#input\_sql\_aad\_admin) | AzureAD Admin block | `map(any)` | `null` | no |
| <a name="input_sql_identity_control_enabled"></a> [sql\_identity\_control\_enabled](#input\_sql\_identity\_control\_enabled) | Are pipelines (running as workspace's system assigned identity) allowed to access SQL pools? Defaults to false. | `bool` | n/a | yes |
| <a name="input_storage_account_id"></a> [storage\_account\_id](#input\_storage\_account\_id) | storage account id | `string` | n/a | yes |
| <a name="input_synapse_name"></a> [synapse\_name](#input\_synapse\_name) | Specifies the name which should be used for this synapse Workspace. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_synapse_spark_pool"></a> [synapse\_spark\_pool](#input\_synapse\_spark\_pool) | describe your variable | `any` | n/a | yes |
| <a name="input_synapse_sql_pool"></a> [synapse\_sql\_pool](#input\_synapse\_sql\_pool) | describe your variable | `any` | n/a | yes |
| <a name="input_synapsesql"></a> [synapsesql](#input\_synapsesql) | The name which should be used for this Synapse Sql Pool. Changing this forces a new synapse SqlPool to be created. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | value | `map(any)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_azurerm_synapse_sql_pool"></a> [azurerm\_synapse\_sql\_pool](#output\_azurerm\_synapse\_sql\_pool) | The ID of the synapse sql pool |
| <a name="output_synapse_spark_pool"></a> [synapse\_spark\_pool](#output\_synapse\_spark\_pool) | spark pool ID |
| <a name="output_synapse_workspace_id"></a> [synapse\_workspace\_id](#output\_synapse\_workspace\_id) | n/a |

## Module Usage

```
module "azsynapse" {

  source                               = "../../modules/module_synapse-analytics/Azure_Synapse_module"
  resource_group_name                  = var.resource_group_name
  location                             = var.location
  synapse_name                         = var.synapse_name
  firewall_rules                       = var.firewall_rules
  adminlogin                           = var.adminlogin
  adminpassword                        = var.adminpassword
  tags                                 = var.tags
  synapse_sql_pool                     = var.synapse_sql_pool
  synapse_spark_pool                   = var.synapse_spark_pool
  managed_virtual_network_enabled      = var.managed_virtual_network_enabled
  sql_identity_control_enabled         = var.sql_identity_control_enabled
  managed_resource_group_name          = var.managed_resource_group_name
  synapsesql                           = var.synapsesql
  filesystem_name                      = var.filesystem_name
  storage_account_id                   = var.storage_account_id
  data_exfiltration_protection_enabled = var.data_exfiltration_protection_enabled

}



```
<!-- END_TF_DOCS -->