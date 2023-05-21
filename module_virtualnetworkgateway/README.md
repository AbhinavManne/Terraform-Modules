<!-- BEGIN_TF_DOCS -->
###### Last Updated[DD/MM/YYYY]: 16/09/2022
##  Introduction 
This module helps us to provision a Virtual Network Gateway.


## File Structure 
This particular module is having the following configuration files.
- vnet_gateway.tf : This file is having the terraform code to provision the resources as per requirements.
- variables.tf : This file consists of all the variable definitions needed for the terraform code mentioned in vnet_gateway.tf
- output.tf : This file will be having the resource output details generated.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.22.0 |


## Resources

| Name | Type |
|------|------|
| [azurerm_virtual_network_gateway.vnet_gateway](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_gateway) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bgp_settings"></a> [bgp\_settings](#input\_bgp\_settings) | In this block the BGP specific settings can be defined. | <pre>list(object({<br>    asn         = string<br>    peer_weight = string<br>    peering_addresses = list(object({<br>      ip_configuration_name = string<br>      apipa_addresses       = list(string)<br>    }))<br>  }))</pre> | `null` | no |
| <a name="input_default_local_network_gateway_id"></a> [default\_local\_network\_gateway\_id](#input\_default\_local\_network\_gateway\_id) | The ID of the local network gateway through which outbound Internet traffic from the virtual network in which the gateway is created will be routed (forced tunnelling). | `string` | `null` | no |
| <a name="input_location"></a> [location](#input\_location) | RG location in Azure | `string` | n/a | yes |
| <a name="input_private_ip_address_enabled"></a> [private\_ip\_address\_enabled](#input\_private\_ip\_address\_enabled) | Should private IP be enabled on this gateway for connections? Changing this forces a new resource to be created. | `bool` | `false` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | RG name in Azure | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the resource. | `map(string)` | n/a | yes |
| <a name="input_virtual_network_gateway_active_active"></a> [virtual\_network\_gateway\_active\_active](#input\_virtual\_network\_gateway\_active\_active) | If true, an active-active Virtual Network Gateway will be created. An active-active gateway requires a HighPerformance or an UltraPerformance SKU. If false, an active-standby gateway will be created. Defaults to false. | `bool` | `false` | no |
| <a name="input_virtual_network_gateway_edge_zone"></a> [virtual\_network\_gateway\_edge\_zone](#input\_virtual\_network\_gateway\_edge\_zone) | Specifies the Edge Zone within the Azure Region where this Virtual Network Gateway should exist. Changing this forces a new Virtual Network Gateway to be created. | `string` | `null` | no |
| <a name="input_virtual_network_gateway_enable_bgp"></a> [virtual\_network\_gateway\_enable\_bgp](#input\_virtual\_network\_gateway\_enable\_bgp) | If true, BGP (Border Gateway Protocol) will be enabled for this Virtual Network Gateway. Defaults to false. | `bool` | `false` | no |
| <a name="input_virtual_network_gateway_generation"></a> [virtual\_network\_gateway\_generation](#input\_virtual\_network\_gateway\_generation) | The Generation of the Virtual Network gateway. Possible values include Generation1, Generation2 or None. | `string` | `"None"` | no |
| <a name="input_virtual_network_gateway_name"></a> [virtual\_network\_gateway\_name](#input\_virtual\_network\_gateway\_name) | The name of the Virtual Network Gateway. | `string` | n/a | yes |
| <a name="input_virtual_network_gateway_sku"></a> [virtual\_network\_gateway\_sku](#input\_virtual\_network\_gateway\_sku) | Configuration of the size and capacity of the virtual network gateway. Valid options are Basic, Standard, HighPerformance, UltraPerformance, ErGw1AZ, ErGw2AZ, ErGw3AZ, VpnGw1, VpnGw2, VpnGw3, VpnGw4,VpnGw5, VpnGw1AZ, VpnGw2AZ, VpnGw3AZ,VpnGw4AZ and VpnGw5AZ and depend on the type, vpn\_type and generation arguments. A PolicyBased gateway only supports the Basic SKU. Further, the UltraPerformance SKU is only supported by an ExpressRoute gateway. | `string` | n/a | yes |
| <a name="input_virtual_network_gateway_type"></a> [virtual\_network\_gateway\_type](#input\_virtual\_network\_gateway\_type) | The type of the Virtual Network Gateway. Valid options are Vpn or ExpressRoute. | `string` | n/a | yes |
| <a name="input_virtual_network_gateway_vpn_type"></a> [virtual\_network\_gateway\_vpn\_type](#input\_virtual\_network\_gateway\_vpn\_type) | The routing type of the Virtual Network Gateway. Valid options are RouteBased or PolicyBased. | `string` | `"RouteBased"` | no |
| <a name="input_vnet_gateway_ip_configuration"></a> [vnet\_gateway\_ip\_configuration](#input\_vnet\_gateway\_ip\_configuration) | One, two or three ip\_configuration blocks documented below. An active-standby gateway requires exactly one ip\_configuration block, an active-active gateway requires exactly two ip\_configuration blocks whereas an active-active zone redundant gateway with P2S configuration requires exactly three ip\_configuration blocks. | <pre>list(object({<br>    name                          = string<br>    public_ip_address_id          = string<br>    private_ip_address_allocation = string<br>    subnet_id                     = string<br>  }))</pre> | n/a | yes |
| <a name="input_vpn_client_configuration"></a> [vpn\_client\_configuration](#input\_vpn\_client\_configuration) | In this block the Virtual Network Gateway can be configured to accept IPSec point-to-site connections. | <pre>list(object({<br>    address_space         = list(string)<br>    aad_tenant            = string<br>    aad_audience          = string<br>    aad_issuer            = string<br>    radius_server_address = string<br>    radius_server_secret  = string<br>    vpn_client_protocols  = list(string)<br>    vpn_auth_types        = list(string)<br>    revoked_certificate = list(object({<br>      name             = string<br>      thumbprint       = string<br>    }))<br>    root_certificate = list(object({<br>      name             = string<br>      public_cert_data = string<br>    }))<br>  }))</pre> | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_virtual_network_gateway_id"></a> [virtual\_network\_gateway\_id](#output\_virtual\_network\_gateway\_id) | The ID of the Virtual Network Gateway. |

## Module Usage
```
module "virtual_network_gateway" {
  source                                = "../../modules/module_virtualnetworkgateway"
  resource_group_name                   = var.resource_group_name
  location                              = var.location
  virtual_network_gateway_name          = var.virtual_network_gateway_name
  virtual_network_gateway_type          = var.virtual_network_gateway_type
  virtual_network_gateway_active_active = var.virtual_network_gateway_active_active
  virtual_network_gateway_sku           = var.virtual_network_gateway_sku
  default_local_network_gateway_id      = var.default_local_network_gateway_id
  virtual_network_gateway_edge_zone     = var.virtual_network_gateway_edge_zone
  virtual_network_gateway_enable_bgp    = var.virtual_network_gateway_enable_bgp
  virtual_network_gateway_generation    = var.virtual_network_gateway_generation
  private_ip_address_enabled            = var.private_ip_address_enabled
  virtual_network_gateway_vpn_type      = var.virtual_network_gateway_vpn_type
  vnet_gateway_ip_configuration         = var.vnet_gateway_ip_configuration
  bgp_settings                          = var.bgp_settings
  vpn_client_configuration              = var.vpn_client_configuration
  tags                                  = var.tags
}

#Reference to module that provisions alerts resources
module "alert" {
  source = "../../modules/module_alert"
  action_group_name        = var.action_group_name
  resource_group_name      = var.resource_group_name
  resource_group_location  = var.location
  short_name               = var.short_name
  action_group_rule_name   = var.action_group_rule_name
  scope_type               = var.scope_type
  resource_id              = module.keyvault.keyvault_id
  activity_log_alert_name  = var.activity_log_alert_name
  resource_group_id        = var.resource_group_id
  operation_name_log_alert = var.operation_name_log_alert
  category_log_alert       = var.category_log_alert
  metric_alert_name        = var.metric_alert_name
  storage_account_id       = var.storage_account_id
  metric_namespace         = var.metric_namespace
  metric_name              = var.metric_name
  aggregation              = var.aggregation
  operator                 = var.operator
  threshold                = var.threshold
  dimension_name           = var.dimension_name
  dimension_operator       = var.dimension_operator
  values                   = var.values
}
```

### Points to be noted :
* Please be aware that provisioning a Virtual Network Gateway takes a long time (between 30 minutes and 1 hour)

* To build a UltraPerformance ExpressRoute Virtual Network gateway, the associated Public IP needs to be SKU "Basic" not "Standard"

* Not all SKUs (e.g. ErGw1AZ) are available in all regions. If you see StatusCode=400 -- Original Error: Code="InvalidGatewaySkuSpecifiedForGatewayDeploymentType" please try another region.

* Generation of virtual network gateway: The available values depend on the type and sku arguments - where Generation2 is only value for a sku larger than VpnGw2 or VpnGw2AZ.

* The valid range for the reserved APIPA address in Azure Public is from 169.254.21.0 to 169.254.22.255.

## Virtual Network Gateway : MSDOC
* Please refer this link to explore more about Virtual Network Gateway: [Virtual_Network_Gateway](https://docs.microsoft.com/en-us/azure/virtual-network/ip-services/configure-public-ip-vpn-gateway)

## Virtual Network Gateway : Terraform
* Please refer this link to understand more about Virtual Network Gateway configurations through terraform: [Virtual_Network_Gateway_Terraform_Registry](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_gateway#example-usage)

<!-- END_TF_DOCS -->