<!-- BEGIN_TF_DOCS -->
###### Last Updated[DD/MM/YYYY]: 13/10/2022

## Introduction

This module helps us to provision a network interface with multiple ip configuration blocks.

## File Structure 

This particular module is having the following configuration files.
- networkinterface.tf : This file is having the terraform code to provision the resources as per requirements.
- Variables.tf : This file consists of all the variable definitions needed for the terraform code mentioned in networkinterface.tf
- Outputs.tf : This file will be having the resource output details generated.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.19.0 |

## Resources

| Name | Type |
|------|------|
| [azurerm_network_interface.nic](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dns_servers"></a> [dns\_servers](#input\_dns\_servers) | dns servers | `list(string)` | <pre>[<br>  "10.0.0.2",<br>  "10.0.0.3"<br>]</pre> | no |
| <a name="input_edge_zone"></a> [edge\_zone](#input\_edge\_zone) | It specifies the Edge Zone, where this Network Interface should exist | `string` | `null` | no |
| <a name="input_enable_accelerated_networking"></a> [enable\_accelerated\_networking](#input\_enable\_accelerated\_networking) | Should Accelerated Networking be enabled? | `bool` | `false` | no |
| <a name="input_enable_ip_forwarding"></a> [enable\_ip\_forwarding](#input\_enable\_ip\_forwarding) | Should IP Forwarding be enabled? | `bool` | `false` | no |
| <a name="input_internal_dns_name_label"></a> [internal\_dns\_name\_label](#input\_internal\_dns\_name\_label) | The (relative) DNS Name used for internal communications between Virtual Machines in the same Virtual Network. | `string` | `null` | no |
| <a name="input_ip_configuration"></a> [ip\_configuration](#input\_ip\_configuration) | IP configuration block. It is mandatory to pass all the parameters in the object. However, if you do not wish to pass custom values to the following optional parameter, please pass 'null' as input. <br>Optional Arguments:<br><li>***gateway_load_balancer_frontend_ip_configuration_id***<br><li>***private_ip_address_version***<br><li>***public_ip_address_id***<br><li>***primary***<br><li>***private_ip_address*** | <pre>map(object({<br>    ip_configuration_name                 = string<br>    gateway_load_balancer_frontend_ip_configuration_id = string<br>    subnet_id         = string<br>    private_ip_address_version = string<br>    private_ip_address_allocation = string<br>    public_ip_address_id = string<br>    primary = bool<br>    private_ip_address = string<br>  }))</pre> | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | resource group location in Azure | `string` | n/a | yes |
| <a name="input_network_interface_name"></a> [network\_interface\_name](#input\_network\_interface\_name) | Network interface name in Azure | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | resource group name in Azure | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | tags for the resource | `map(any)` | n/a | yes |

## Vulnerabilities Scanned using Kics
- Network Interfaces IP Forwarding should be disabled (recommended)

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_network_interface_id"></a> [network\_interface\_id](#output\_network\_interface\_id) | The ID of the Network Interface |
| <a name="output_network_interface_name"></a> [network\_interface\_name](#output\_network\_interface\_name) | The Name of the Network Interface |
| <a name="output_nic_applied_dns_servers"></a> [nic\_applied\_dns\_servers](#output\_nic\_applied\_dns\_servers) | dns servers |
| <a name="output_nic_internal_domain_name_suffix"></a> [nic\_internal\_domain\_name\_suffix](#output\_nic\_internal\_domain\_name\_suffix) | internal domain name suffix of the network interface |
| <a name="output_nic_mac_address"></a> [nic\_mac\_address](#output\_nic\_mac\_address) | The Media Access Control (MAC) Address of the Network Interface. |
| <a name="output_nic_private_ip_address"></a> [nic\_private\_ip\_address](#output\_nic\_private\_ip\_address) | The first private IP address of the network interface. |
| <a name="output_nic_private_ip_addresses"></a> [nic\_private\_ip\_addresses](#output\_nic\_private\_ip\_addresses) | The private IP addresses of the network interface. |

## Module
```
module "networkinterface_module" {
  source                        = "../../modules/module_networkinterface/network-interface_module"
  network_interface_name        = var.network_interface_name
  location                      = var.location
  resource_group_name           = var.resource_group_name
  dns_servers                   = var.dns_servers
  edge_zone                     = var.edge_zone
  enable_ip_forwarding          = var.enable_ip_forwarding
  enable_accelerated_networking = var.enable_accelerated_networking
  internal_dns_name_label       = var.internal_dns_name_label
  tags                          = var.tags
  ip_configuration              = var.ip_configuration
}
```
<!-- END_TF_DOCS -->