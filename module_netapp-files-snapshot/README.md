<!-- BEGIN_TF_DOCS -->
Last Updated[DD/MM/YYYY]: 28/10/2022
# <u> Introduction </u>
* This module provides the facility to provision Netapp files shapshot. In this module we have included all possible argument for Netapp files snapshot

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
| [azurerm_netapp_snapshot.example](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/netapp_snapshot) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_name"></a> [account\_name](#input\_account\_name) | netapp account name in Azure | `string` | n/a | yes |
| <a name="input_actions"></a> [actions](#input\_actions) | A list of Actions which should be delegated. | `list` | n/a | yes |
| <a name="input_address_prefixes"></a> [address\_prefixes](#input\_address\_prefixes) | The address prefix to use for the subnet. | `list(string)` | n/a | yes |
| <a name="input_address_space"></a> [address\_space](#input\_address\_space) | The address space that is used the virtual network. | `list(string)` | n/a | yes |
| <a name="input_delegation_name"></a> [delegation\_name](#input\_delegation\_name) | delegation name | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Specifies the supported Azure location where the resource exists. | `string` | n/a | yes |
| <a name="input_netapp_snapshot"></a> [netapp\_snapshot](#input\_netapp\_snapshot) | The name of the NetApp Snapshot | `string` | n/a | yes |
| <a name="input_pool_name"></a> [pool\_name](#input\_pool\_name) | netapp pool name in Azure | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | RG name in Azure | `string` | n/a | yes |
| <a name="input_security_style"></a> [security\_style](#input\_security\_style) | Volume security style, accepted values are Unix or Ntfs | `string` | n/a | no |
| <a name="input_service_delegation_name"></a> [service\_delegation\_name](#input\_service\_delegation\_name) | service delegation for subnet | `string` | n/a | yes |
| <a name="input_service_level"></a> [service\_level](#input\_service\_level) | the target performance of the file system. | `string` | n/a | yes |
| <a name="input_size_in_tb"></a> [size\_in\_tb](#input\_size\_in\_tb) | Provisioned size of the pool in TB | `number` | n/a | yes |
| <a name="input_storage_quota_in_gb"></a> [storage\_quota\_in\_gb](#input\_storage\_quota\_in\_gb) | The maximum Storage Quota allowed for a file system in Gigabytes. | `number` | n/a | yes |
| <a name="input_subnet_name"></a> [subnet\_name](#input\_subnet\_name) | subnet name in Azure | `string` | n/a | yes |
| <a name="input_virtual_network_name"></a> [virtual\_network\_name](#input\_virtual\_network\_name) | vnet name in Azure | `string` | n/a | yes |
| <a name="input_volume_name"></a> [volume\_name](#input\_volume\_name) | The name of the NetApp Volume. | `string` | n/a | yes |
| <a name="input_volume_path"></a> [volume\_path](#input\_volume\_path) | A unique file path for the volume. | `string` | n/a | yes |

<!-- END_TF_DOCS -->
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_azurerm_netapp_snapshot"></a> [azurerm\_netapp\_snapshot](#output\_azurerm\_netapp\_snapshot) | ID of azurerm netapp snapshot |

## module
```

module "azurerm_netapp_snapshot" {
  source                  = "../../modules/module_netapp-files-snapshot"
  location                = var.location
  resource_group_name     = var.resource_group_name
  virtual_network_name    = var.virtual_network_name
  subnet_name             = var.subnet_name
  account_name            = var.account_name
  pool_name               = var.pool_name
  service_level           = var.service_level
  size_in_tb              = var.size_in_tb
  security_style          = var.security_style
  volume_path             = var.volume_path
  volume_name             = var.volume_name
  storage_quota_in_gb     = var.storage_quota_in_gb
  address_space           = var.address_space
  address_prefixes        = var.address_prefixes
  delegation_name         = var.delegation_name
  service_delegation_name = var.service_delegation_name
  actions                 = var.actions
  netapp_snapshot         = var.netapp_snapshot
  tags                    =var.tags
}
```
<!-- END_TF_DOCS -->