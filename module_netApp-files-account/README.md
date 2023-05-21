<!-- BEGIN_TF_DOCS -->
Last Updated[DD/MM/YYYY]: 26/10/2022
# <u> Introduction </u>
* This module provides the facility to provision Netapp files account. In this module we have included all possible argument for  Netapp files account.

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
| [azurerm_netapp_account.netapp_account](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/netapp_account) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dns_servers"></a> [dns\_servers](#input\_dns\_servers) | A list of DNS server IP addresses for the Active Directory domain. Only allows IPv4 address. | `list(any)` | n/a | yes |
| <a name="input_domain"></a> [domain](#input\_domain) | he name of the Active Directory domain | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Specifies the supported Azure location where the resource exists. | `string` | n/a | yes |
| <a name="input_netapp_account_name"></a> [netapp\_account\_name](#input\_netapp\_account\_name) | The name of the NetApp Account. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_organizational_unit"></a> [organizational\_unit](#input\_organizational\_unit) | The Organizational Unit (OU) within the Active Directory Domain. | `string` | n/a | no |
| <a name="input_password"></a> [password](#input\_password) | The password associated with the username. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group where the NetApp Account should be created | `string` | n/a | yes |
| <a name="input_smb_server_name"></a> [smb\_server\_name](#input\_smb\_server\_name) | The NetBIOS name which should be used for the NetApp SMB Server, which will be registered as a computer account in the AD and used to mount volumes. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags | `map(any)` | n/a | yes |
| <a name="input_username"></a> [username](#input\_username) | The Username of Active Directory Domain Administrator. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_azurerm_netapp_account_id"></a> [azurerm\_netapp\_account\_id](#output\_azurerm\_netapp\_account\_id) | ID of azurerm netapp account |


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