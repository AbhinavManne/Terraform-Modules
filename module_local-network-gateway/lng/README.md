<!-- BEGIN_TF_DOCS -->

###### Last Updated[DD/MM/YYYY]: 21/10/2022

## Introduction
The local network gateway represents your local (on-premises) network and holds all configuration information on your local network settings. It's an essential component for creating the VPN connection that is needed to create a Site-to-Site connection between the Azure VNet and the local network.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.24.0 |

## Resources

| Name | Type |
|------|------|
| [azurerm_local_network_gateway.lng](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/local_network_gateway) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_address_space"></a> [address\_space](#input\_address\_space) | list of string CIDRs representing the address spaces the gateway exposes | `list(string)` | null | no |
| <a name="input_bgp_settings"></a> [bgp\_settings](#input\_bgp\_settings) | bgp settings block. It is mandatory to pass all the parameters in the object. However, if you do not wish to pass custom values to the following optional parameter, please pass 'null' as input. <br>Optional Arguments:<br><li>peer_weight | <pre>list(object({<br>    asn                 = string<br>    bgp_peering_address = string<br>    peer_weight         = string<br>  }))</pre> | n/a | no |
| <a name="input_gateway_address"></a> [gateway\_address](#input\_gateway\_address) | The gateway IP address to connect with | `string` | null | no |
| <a name="input_gateway_fqdn"></a> [gateway\_fqdn](#input\_gateway\_fqdn) | The gateway FQDN to connect with | `string` | null | no |
| <a name="input_local_network_gateway_name"></a> [local\_network\_gateway\_name](#input\_local\_network\_gateway\_name) | The name of the local network gateway | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Location where the local network gateway is created | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Resource group name | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags for the resource | `map(any)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_local_network_gateway_id"></a> [local\_network\_gateway\_id](#output\_local\_network\_gateway\_id) | The ID of the Local Network Gateway |

## Module Usage

```
module "local_network_gateway" {
  source                     = "../../modules/module_local-network-gateway/lng"
  resource_group_name        = var.resource_group_name
  location                   = var.location
  local_network_gateway_name = var.local_network_gateway_name
  address_space              = var.address_space
  gateway_address            = var.gateway_address
  gateway_fqdn               = var.gateway_fqdn
  tags                       = var.tags
  bgp_settings               = var.bgp_settings
}
```
<!-- END_TF_DOCS -->