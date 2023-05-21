<!-- BEGIN_TF_DOCS -->

Last Updated[DD/MM/YYYY]: 26/10/2022
# <u> Introduction </u>
* This module provides the facility to provision Netapp files account. In this module we have included all possible argument for private service link.

## File Structure 
This particular module is having the following configuration files.
- main.tf : This file is having the terraform code to provision the resources as per requirements.
- variables.tf : This file consist of all the variable definitions needed for the terraform code mentioned in main.tf
- output.tf : This file is having all the resource output details generated.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.28.0 |



## Resources

| Name | Type |
|------|------|
| [azurerm_netapp_volume.example_primary](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/netapp_volume) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_name"></a> [account\_name](#input\_account\_name) | netapp account name in Azure | `string` | n/a | yes |
| <a name="input_actions"></a> [actions](#input\_actions) | A list of Actions which should be delegated. | `list` | n/a | yes |
| <a name="input_address_prefixes1"></a> [address\_prefixes1](#input\_address\_prefixes1) | The address prefix to use for the subnet. | `list(string)` | n/a | yes |
| <a name="input_address_prefixes2"></a> [address\_prefixes2](#input\_address\_prefixes2) | The address prefix to use for the subnet. | `list(string)` | n/a | yes |
| <a name="input_allowed_clients"></a> [allowed\_clients](#input\_allowed\_clients) | A list of allowed clients IPv4 addresses. | `any` | n/a | yes |
| <a name="input_delegation_name"></a> [delegation\_name](#input\_delegation\_name) | delegation name | `string` | n/a | no |
| <a name="input_endpoint_type"></a> [endpoint\_type](#input\_endpoint\_type) | The endpoint type, default value is dst for destination. | `any` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The Azure location where the secondary volume will be created. | `any` | n/a | yes |
| <a name="input_netapp_volume_primary"></a> [netapp\_volume\_primary](#input\_netapp\_volume\_primary) | The name of the NetApp Volume. | `string` | n/a | no |
| <a name="input_pool_name"></a> [pool\_name](#input\_pool\_name) | netapp pool name in Azure | `string` | n/a | yes |
| <a name="input_primary_subnet"></a> [primary\_subnet](#input\_primary\_subnet) | subnet name in Azure | `string` | n/a | yes |
| <a name="input_protocols"></a> [protocols](#input\_protocols) | The target volume protocol expressed as a list. | `list` | n/a | yes |
| <a name="input_protocols_enabled"></a> [protocols\_enabled](#input\_protocols\_enabled) | The target volume protocol expressed as a list. | `list` | <pre>[<br>  "NFSv3"<br>]</pre> | no |
| <a name="input_replication_frequency"></a> [replication\_frequency](#input\_replication\_frequency) | Replication frequency, supported values are '10minutes', 'hourly', 'daily', values are case sensitive. | `any` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | RG name in Azure | `string` | n/a | yes |
| <a name="input_rule_index"></a> [rule\_index](#input\_rule\_index) | The index number of the rule. | `any` | n/a | yes |
| <a name="input_security_style"></a> [security\_style](#input\_security\_style) | Volume security style, accepted values are Unix or Ntfs | `string` | n/a | no |
| <a name="input_service_delegation_name"></a> [service\_delegation\_name](#input\_service\_delegation\_name) | service delegation for subnet | `string` | n/a | yes |
| <a name="input_service_level"></a> [service\_level](#input\_service\_level) | the target performance of the file system. | `string` | n/a | yes |
| <a name="input_size_in_tb"></a> [size\_in\_tb](#input\_size\_in\_tb) | Provisioned size of the pool in TB | `number` | n/a | yes |
| <a name="input_storage_quota_in_gb"></a> [storage\_quota\_in\_gb](#input\_storage\_quota\_in\_gb) | The maximum Storage Quota allowed for a file system in Gigabytes. | `number` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags | `map(any)` | n/a | no |
| <a name="input_unix_read_only"></a> [unix\_read\_only](#input\_unix\_read\_only) | Is the file system on unix read only? | `any` | n/a | no |
| <a name="input_unix_read_write"></a> [unix\_read\_write](#input\_unix\_read\_write) | Is the file system on unix read and write? | `any` | n/a | no |
| <a name="input_virtual_network_primary"></a> [virtual\_network\_primary](#input\_virtual\_network\_primary) | vnet name in Azure | `string` | n/a | yes |
| <a name="input_volume_path"></a> [volume\_path](#input\_volume\_path) | A unique file path for the volume. | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_azurerm_netapp_volume"></a> [azurerm\_netapp\_volume](#output\_azurerm\_netapp\_volume) | ID of netapp volume |

## module 

```
module "NetApp_files_volume" {
  source                  = "../../modules/module_netapp-files-volume"
  resource_group_name     = var.resource_group_name
  virtual_network_primary = var.virtual_network_primary
  primary_subnet          = var.primary_subnet
  account_name            = var.account_name
  pool_name               = var.pool_name
  service_level           = var.service_level
  size_in_tb              = var.size_in_tb
  volume_path             = var.volume_path
  netapp_volume_primary   = var.netapp_volume_primary
  protocols               = var.protocols
  security_style          = var.security_style
  storage_quota_in_gb     = var.storage_quota_in_gb
  address_prefixes1       = var.address_prefixes1
  address_prefixes2       = var.address_prefixes2
  delegation_name         = var.delegation_name
  service_delegation_name = var.service_delegation_name
  actions                 = var.actions
  location                = var.location
  rule_index              = var.rule_index
  allowed_clients         = var.allowed_clients
  unix_read_only          = var.unix_read_only
  unix_read_write         = var.unix_read_write
  endpoint_type           = var.endpoint_type
  replication_frequency   = var.replication_frequency
  tags                    = var.tags
}

```
<!-- END_TF_DOCS -->