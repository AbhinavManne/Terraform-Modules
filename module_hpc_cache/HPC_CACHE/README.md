<!-- BEGIN_TF_DOCS -->
###### Last Updated[DD/MM/YYYY]: 21/11/2022
##  Introduction 
This module provisions following resource- HPC_CACHE.

## File Structure 

This particular module is having the following configuration files.
- hpc_cache.tf : This file is having the terraform code to provision the resource as per requirements.
- variables.tf : This file consists of all the variable definitions needed for the terraform code mentioned in hpc_cache.tf
- outputs.tf : This file will be having the resource output details generated.

## Requirements

a)Resource Group

b)Subnet

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |


## Resources

| Name | Type |
|------|------|
| [azurerm_hpc_cache.hpc_cache](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/hpc_cache) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_automatically_rotate_key_to_latest_enabled"></a> [automatically\_rotate\_key\_to\_latest\_enabled](#input\_automatically\_rotate\_key\_to\_latest\_enabled) | Specifies whether the HPC Cache automatically rotates Encryption Key to the latest version. | `string` | `null` | no |
| <a name="input_cache_size_in_gb"></a> [cache\_size\_in\_gb](#input\_cache\_size\_in\_gb) | The size of the HPC Cache, in GB. Possible values are 3072, 6144, 12288, 21623, 24576, 43246, 49152 and 86491. | `number` | n/a | yes |
| <a name="input_default_access_policy_config"></a> [default\_access\_policy\_config](#input\_default\_access\_policy\_config) | Default access policy parameteres values | <pre>list(object({<br>     access_rule_config = list(object({<br>            scope                   = string<br>            access                  = string <br>            filter                  = string<br>            suid_enabled            = bool<br>            submount_access_enabled = bool<br>            root_squash_enabled     = bool<br>            anonymous_uid           = string<br>            anonymous_gid           = string<br>     }))<br>     }))</pre> | n/a | no |
| <a name="input_directory_active_directory_config"></a> [directory\_active\_directory\_config](#input\_directory\_active\_directory\_config) | directory active directory parameteres values | <pre>list(object({<br>      dns_primary_ip      = string<br>      domain_name         = string<br>      cache_netbios_name  = string<br>      domain_netbios_name = string<br>      username            = string<br>      password            = string<br>      dns_secondary_ip    = string<br>   }))</pre> | n/a | no |
| <a name="input_dns_config"></a> [dns\_config](#input\_dns\_config) | DNS parameteres values | <pre>list(object({<br>      servers       = list(string)<br>      search_domain = string<br>   }))</pre> | n/a | no |
| <a name="input_identity_config"></a> [identity\_config](#input\_identity\_config) | identity parameteres values | <pre>list(object({<br>        type                    = string<br>        identity_ids            = string<br>      }))</pre> | n/a | no |
| <a name="input_key_vault_key_id"></a> [key\_vault\_key\_id](#input\_key\_vault\_key\_id) | The ID of the Key Vault Key which should be used to encrypt the data in this HPC Cache | `string` | `null` | no |
| <a name="input_location"></a> [location](#input\_location) | Specifies the supported Azure Region where the HPC Cache should be created. | `string` | n/a | yes |
| <a name="input_mtu"></a> [mtu](#input\_mtu) | The IPv4 maximum transmission unit configured for the subnet of the HPC Cache. Possible values range from 576 - 1500. | `number` | `1500` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the HPC Cache | `string` | n/a | yes |
| <a name="input_ntp_server"></a> [ntp\_server](#input\_ntp\_server) | The NTP server IP Address or FQDN for the HPC Cache. | `string` | `"time.windows.com"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the Resource Group in which to create the HPC Cache. | `string` | n/a | yes |
| <a name="input_sku_name"></a> [sku\_name](#input\_sku\_name) | The SKU of HPC Cache to use. Possible values are (ReadWrite) - Standard\_2G, Standard\_4G Standard\_8G or (ReadOnly) - Standard\_L4\_5G, Standard\_L9G, and Standard\_L16G. | `string` | n/a | yes |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | The ID of the Subnet for the HPC Cache. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the HPC Cache. | `map(any)` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_hpc_cache_id"></a> [hpc\_cache\_id](#output\_hpc\_cache\_id) | The id of the HPC Cache. |
<!-- END_TF_DOCS -->