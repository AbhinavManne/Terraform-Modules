<!-- BEGIN_TF_DOCS -->
Last Updated[DD/MM/YYYY]: 10/11/2022
# <u> Introduction </u>
* This module provides the facility to provision databricks workspace. In this module we have included all possible argument for databricks workspace.

## File Structure 
This particular module is having the following configuration files.
- databricks_workspace.tf : This file is having the terraform code to provision the resources as per requirements.
- variables.tf : This file consist of all the variable definitions needed for the terraform code mentioned in network_watcher.tf
- output.tf : This file is having all the resource output details generated.




## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) |3.30.0 |



## Resources

| Name | Type |
|------|------|
| [azurerm_databricks_workspace.workspace](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/databricks_workspace) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_custom_parameters"></a> [custom\_parameters](#input\_custom\_parameters) | A custom\_parameters block as documented below. | `string` | `null` | no |
| <a name="input_customer_managed_key_enabled"></a> [customer\_managed\_key\_enabled](#input\_customer\_managed\_key\_enabled) | Is the workspace enabled for customer managed key encryption? If true this enables the Managed Identity for the managed storage account. Possible values are true or false. Defaults to false. This field is only valid if the Databricks Workspace sku is set to premium. Changing this forces a new resource to be created. | `bool` | `false` | no |
| <a name="input_infrastructure_encryption_enabled"></a> [infrastructure\_encryption\_enabled](#input\_infrastructure\_encryption\_enabled) | Is the Databricks File System root file system enabled with a secondary layer of encryption with platform managed keys? Possible values are true or false. Defaults to false. This field is only valid if the Databricks Workspace sku is set to premium. Changing this forces a new resource to be created. | `bool` | `false` | no |
| <a name="input_load_balancer_backend_address_pool_id"></a> [load\_balancer\_backend\_address\_pool\_id](#input\_load\_balancer\_backend\_address\_pool\_id) | Resource ID of the Outbound Load balancer Backend Address Pool for Secure Cluster Connectivity (No Public IP) workspace. Changing this forces a new resource to be created. | `string` | `null` | no |
| <a name="input_location"></a> [location](#input\_location) | location of the resources | `string` | n/a | yes |
| <a name="input_machine_learning_workspace_id"></a> [machine\_learning\_workspace\_id](#input\_machine\_learning\_workspace\_id) | The ID of a Azure Machine Learning workspace to link with Databricks workspace. Changing this forces a new resource to be created. | `string` | `null` | no |
| <a name="input_managed_services_cmk_key_vault_key_id"></a> [managed\_services\_cmk\_key\_vault\_key\_id](#input\_managed\_services\_cmk\_key\_vault\_key\_id) | Customer managed encryption properties for the Databricks Workspace managed resources(e.g. Notebooks and Artifacts). Changing this forces a new resource to be created. | `string` | `null` | no |
| <a name="input_mrg"></a> [mrg](#input\_mrg) | The name of the resource group where Azure should place the managed Databricks resources. Changing this forces a new resource to be created. | `string` | `null` | no |
| <a name="input_nat_gateway_name"></a> [nat\_gateway\_name](#input\_nat\_gateway\_name) | Name of the NAT gateway for Secure Cluster Connectivity (No Public IP) workspace subnets. Defaults to nat-gateway. Changing this forces a new resource to be created | `string` | `null` | no |
| <a name="input_network_security_group_rules_required"></a> [network\_security\_group\_rules\_required](#input\_network\_security\_group\_rules\_required) | Does the data plane (clusters) to control plane communication happen over private link endpoint only or publicly? Possible values AllRules, NoAzureDatabricksRules or NoAzureServiceRules. Required when public\_network\_access\_enabled is set to false. Changing this forces a new resource to be created. | `string` | `null` | no |
| <a name="input_no_public_ip"></a> [no\_public\_ip](#input\_no\_public\_ip) | Are public IP Addresses not allowed? Possible values are true or false. Defaults to false. Changing this forces a new resource to be created. | `bool` | `false` | no |
| <a name="input_private_subnet_name"></a> [private\_subnet\_name](#input\_private\_subnet\_name) | The name of the Private Subnet within the Virtual Network. Required if virtual\_network\_id is set. Changing this forces a new resource to be created. | `string` | `null` | no |
| <a name="input_private_subnet_network_security_group_association_id"></a> [private\_subnet\_network\_security\_group\_association\_id](#input\_private\_subnet\_network\_security\_group\_association\_id) | The resource ID of the azurerm\_subnet\_network\_security\_group\_association resource which is referred to by the private\_subnet\_name field. This is the same as the ID of the subnet referred to by the private\_subnet\_name field. Required if virtual\_network\_id is set. | `string` | `null` | no |
| <a name="input_public_network_access_enabled"></a> [public\_network\_access\_enabled](#input\_public\_network\_access\_enabled) | Allow public access for accessing workspace. Set value to false to access workspace only via private link endpoint. Possible values include true or false. Defaults to true. Changing this forces a new resource to be created. | `bool` | `false` | no |
| <a name="input_public_subnet_name"></a> [public\_subnet\_name](#input\_public\_subnet\_name) | he name of the Public Subnet within the Virtual Network. Required if virtual\_network\_id is set. Changing this forces a new resource to be created. | `string` | `null` | no |
| <a name="input_public_subnet_network_security_group_association_id"></a> [public\_subnet\_network\_security\_group\_association\_id](#input\_public\_subnet\_network\_security\_group\_association\_id) | The resource ID of the azurerm\_subnet\_network\_security\_group\_association resource which is referred to by the public\_subnet\_name field. This is the same as the ID of the subnet referred to by the public\_subnet\_name field. Required if virtual\_network\_id is set. | `string` | `null` | no |
| <a name="input_rg"></a> [rg](#input\_rg) | Resource group name in Azure | `string` | n/a | yes |
| <a name="input_sku"></a> [sku](#input\_sku) | databricks sku type | `string` | n/a | yes |
| <a name="input_storage_account_name"></a> [storage\_account\_name](#input\_storage\_account\_name) | Default Databricks File Storage account name. Defaults to a randomized name(e.g. dbstoragel6mfeghoe5kxu). Changing this forces a new resource to be created. | `string` | `null` | no |
| <a name="input_storage_account_sku_name"></a> [storage\_account\_sku\_name](#input\_storage\_account\_sku\_name) | Storage account SKU name. Possible values include Standard\_LRS, Standard\_GRS, Standard\_RAGRS, Standard\_GZRS, Standard\_RAGZRS, Standard\_ZRS, Premium\_LRS or Premium\_ZRS. Defaults to Standard\_GRS. Changing this forces a new resource to be created. | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | The tags to associate with the resource. | `map(string)` | n/a | yes |
| <a name="input_virtual_network_id"></a> [virtual\_network\_id](#input\_virtual\_network\_id) | The ID of a Virtual Network where this Databricks. | `string` | `null` | no |
| <a name="input_vnet_address_prefix"></a> [vnet\_address\_prefix](#input\_vnet\_address\_prefix) | Address prefix for Managed virtual network. Defaults to 10.139 | `string` | `null` | no |
| <a name="input_workspace"></a> [workspace](#input\_workspace) | Azure databricks workspace name | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_workspace_id"></a> [workspace\_id](#output\_workspace\_id) | ID of Azure Data bricks |

## Module Usage
```
  module "databricks_workspace" {
  source                                               = "../../modules/module_azure_databricks_workspace/databricks"
  rg                                                   = var.rg
  location                                             = var.location
  workspace                                            = var.workspace
  sku                                                  = var.sku
  tags                                                 = var.tags
  load_balancer_backend_address_pool_id                = var.load_balancer_backend_address_pool_id
  managed_services_cmk_key_vault_key_id                = var.managed_services_cmk_key_vault_key_id
  mrg                                                  = var.mrg
  customer_managed_key_enabled                         = var.customer_managed_key_enabled
  infrastructure_encryption_enabled                    = var.infrastructure_encryption_enabled
  public_network_access_enabled                        = var.public_network_access_enabled
  network_security_group_rules_required                = var.network_security_group_rules_required
  machine_learning_workspace_id                        = var.machine_learning_workspace_id
  nat_gateway_name                                     = var.nat_gateway_name
  no_public_ip                                         = var.no_public_ip
  public_subnet_name                                   = var.public_subnet_name
  public_subnet_network_security_group_association_id  = var.public_subnet_network_security_group_association_id
  private_subnet_name                                  = var.private_subnet_name
  private_subnet_network_security_group_association_id = var.private_subnet_network_security_group_association_id
  storage_account_name                                 = var.storage_account_name
  storage_account_sku_name                             = var.storage_account_sku_name
  virtual_network_id                                   = var.virtual_network_id
  vnet_address_prefix                                  = var.vnet_address_prefix
  custom_parameters                                    = var.custom_parameters

}

```
<!-- END_TF_DOCS -->