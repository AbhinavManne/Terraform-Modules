<!-- BEGIN_TF_DOCS -->
Last Updated[DD/MM/YYYY]: 03/11/2022
# <u> Introduction </u>
* This module provides the facility to provision vnet to vnet vpn connection. In this module we have included all possible argument for vnet to vnet vpn connection.

## File Structure 
This particular module is having the following configuration files.
- vnettovnetvpn.tf : This file is having the terraform code to provision the resources as per requirements.
- variables.tf : This file consist of all the variable definitions needed for the terraform code mentioned in main.tf
- output.tf : This file is having all the resource output details generated.


## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.29.0 |



## Resources

| Name | Type |
|------|------|
| [azurerm_virtual_network_gateway_connection.vnettovnetvpn](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_gateway_connection) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_authorization_key"></a> [authorization\_key](#input\_authorization\_key) | The authorization key associated with the Express Route Circuit. This field is required only if the type is an ExpressRoute connection. | `string` | `null` | no |
| <a name="input_connection_mode"></a> [connection\_mode](#input\_connection\_mode) | Connection mode to use. Possible values are Default, InitiatorOnly and ResponderOnly. Defaults to Default. Changing this value will force a resource to be created. | `string` | `"default"` | no |
| <a name="input_connection_protocol"></a> [connection\_protocol](#input\_connection\_protocol) | The IKE protocol version to use. Possible values are IKEv1 and IKEv2. Defaults to IKEv2. Changing this value will force a resource to be created. -> Note: Only valid for IPSec connections on virtual network gateways with SKU VpnGw1, VpnGw2, VpnGw3, VpnGw1AZ, VpnGw2AZ or VpnGw3AZ. | `string` | `null` | no |
| <a name="input_custom_bgp_addresses"></a> [custom\_bgp\_addresses](#input\_custom\_bgp\_addresses) | custom\_bgp\_addresses | `list(string)` | `null` | no |
| <a name="input_dh_group"></a> [dh\_group](#input\_dh\_group) | The DH group used in IKE phase 1 for initial SA. Valid options are DHGroup1, DHGroup14, DHGroup2, DHGroup2048, DHGroup24, ECP256, ECP384, or None. | `string` | n/a | yes |
| <a name="input_dpd_timeout_seconds"></a> [dpd\_timeout\_seconds](#input\_dpd\_timeout\_seconds) | The dead peer detection timeout of this connection in seconds. Changing this forces a new resource to be created. | `number` | `null` | no |
| <a name="input_egress_nat_rule_ids"></a> [egress\_nat\_rule\_ids](#input\_egress\_nat\_rule\_ids) | A list of the egress NAT Rule Ids. | `list(string)` | `null` | no |
| <a name="input_enable_bgp"></a> [enable\_bgp](#input\_enable\_bgp) | If true, BGP (Border Gateway Protocol) is enabled for this connection. Defaults to false | `bool` | `false` | no |
| <a name="input_express_route_circuit_id"></a> [express\_route\_circuit\_id](#input\_express\_route\_circuit\_id) | The ID of the Express Route Circuit when creating an ExpressRoute connection (i.e. when type is ExpressRoute). The Express Route Circuit can be in the same or in a different subscription. | `string` | `null` | no |
| <a name="input_express_route_gateway_bypass"></a> [express\_route\_gateway\_bypass](#input\_express\_route\_gateway\_bypass) | If true, data packets will bypass ExpressRoute Gateway for data forwarding This is only valid for ExpressRoute connections. | `bool` | `false` | no |
| <a name="input_ike_encryption"></a> [ike\_encryption](#input\_ike\_encryption) | The IKE encryption algorithm. Valid options are AES128, AES192, AES256, DES, DES3, GCMAES128, or GCMAES256. | `string` | n/a | yes |
| <a name="input_ike_integrity"></a> [ike\_integrity](#input\_ike\_integrity) | The IKE integrity algorithm. Valid options are GCMAES128, GCMAES256, MD5, SHA1, SHA256, or SHA384. | `string` | n/a | yes |
| <a name="input_ingress_nat_rule_ids"></a> [ingress\_nat\_rule\_ids](#input\_ingress\_nat\_rule\_ids) | A list of the ingress NAT Rule Ids. | `list(string)` | `null` | no |
| <a name="input_ipsec_encryption"></a> [ipsec\_encryption](#input\_ipsec\_encryption) | The IPSec encryption algorithm. Valid options are AES128, AES192, AES256, DES, DES3, GCMAES128, GCMAES192, GCMAES256, or None. | `string` | n/a | yes |
| <a name="input_ipsec_integrity"></a> [ipsec\_integrity](#input\_ipsec\_integrity) | The IPSec integrity algorithm. Valid options are GCMAES128, GCMAES192, GCMAES256, MD5, SHA1, or SHA256. | `string` | n/a | yes |
| <a name="input_ipsec_policy"></a> [ipsec\_policy](#input\_ipsec\_policy) | A ipsec\_policy block which is documented below. Only a single policy can be defined for a connection. For details on custom policies refer to the relevant section in the Azure documentation. | `string` | `null` | no |
| <a name="input_local_address_cidrs"></a> [local\_address\_cidrs](#input\_local\_address\_cidrs) | List of local CIDRs | `list(string)` | `null` | no |
| <a name="input_local_azure_ip_address_enabled"></a> [local\_azure\_ip\_address\_enabled](#input\_local\_azure\_ip\_address\_enabled) | Use private local Azure IP for the connection. Changing this forces a new resource to be created. | `bool` | `false` | no |
| <a name="input_local_network_gateway_id"></a> [local\_network\_gateway\_id](#input\_local\_network\_gateway\_id) | The ID of the local network gateway when creating Site-to-Site connection (i.e. when type is IPsec). | `string` | `null` | no |
| <a name="input_location"></a> [location](#input\_location) | RG location in Azure | `string` | n/a | yes |
| <a name="input_location1"></a> [location1](#input\_location1) | location of second rg | `string` | `null` | no |
| <a name="input_peer_virtual_network_gateway_id"></a> [peer\_virtual\_network\_gateway\_id](#input\_peer\_virtual\_network\_gateway\_id) | peer\_virtual\_network\_gateway\_id | `string` | n/a | yes |
| <a name="input_pfs_group"></a> [pfs\_group](#input\_pfs\_group) | The DH group used in IKE phase 2 for new child SA. Valid options are ECP256, ECP384, PFS1, PFS14, PFS2, PFS2048, PFS24, PFSMM, or None. | `string` | n/a | yes |
| <a name="input_primary"></a> [primary](#input\_primary) | single IP address that is part of the azurerm\_virtual\_network\_gateway ip\_configuration (first one) | `string` | `null` | no |
| <a name="input_remote_address_cidrs"></a> [remote\_address\_cidrs](#input\_remote\_address\_cidrs) | List of remote CIDRs. | `list(string)` | `null` | no |
| <a name="input_rg"></a> [rg](#input\_rg) | RG name in Azure | `string` | n/a | yes |
| <a name="input_rg1"></a> [rg1](#input\_rg1) | RG name in Azure | `string` | `null` | no |
| <a name="input_routing_weight"></a> [routing\_weight](#input\_routing\_weight) | The routing weight. Defaults to 10 | `number` | `10` | no |
| <a name="input_sa_datasize"></a> [sa\_datasize](#input\_sa\_datasize) | The IPSec SA payload size in KB. Must be at least 1024 KB. Defaults to 102400000 KB. | `string` | n/a | yes |
| <a name="input_sa_lifetime"></a> [sa\_lifetime](#input\_sa\_lifetime) | The IPSec SA lifetime in seconds. Must be at least 300 seconds. Defaults to 27000 seconds. | `string` | n/a | yes |
| <a name="input_secondary"></a> [secondary](#input\_secondary) | single IP address that is part of the azurerm\_virtual\_network\_gateway ip\_configuration (second one) | `string` | `null` | no |
| <a name="input_shared_key"></a> [shared\_key](#input\_shared\_key) | Gatewayconnection name in Azure | `string` | `"null"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | The tags to associate with the resource. | `map(string)` | n/a | yes |
| <a name="input_traffic_selector_policy"></a> [traffic\_selector\_policy](#input\_traffic\_selector\_policy) | One or more traffic\_selector\_policy blocks which are documented below. A traffic\_selector\_policy allows to specify a traffic selector policy proposal to be used in a virtual network gateway connection. | `string` | `null` | no |
| <a name="input_type"></a> [type](#input\_type) | type of connection | `string` | n/a | yes |
| <a name="input_use_policy_based_traffic_selectors"></a> [use\_policy\_based\_traffic\_selectors](#input\_use\_policy\_based\_traffic\_selectors) | If true, policy-based traffic selectors are enabled for this connection. Enabling policy-based traffic selectors requires an ipsec\_policy block. Defaults to false | `bool` | `false` | no |
| <a name="input_virtual_network_gateway_id"></a> [virtual\_network\_gateway\_id](#input\_virtual\_network\_gateway\_id) | Gatewayconnection name in Azure | `string` | n/a | yes |
| <a name="input_vnet1_to_vnet2"></a> [vnet1\_to\_vnet2](#input\_vnet1\_to\_vnet2) | Gatewayconnection name in Azure | `string` | n/a | yes |
| <a name="input_vnet2_to_vnet1"></a> [vnet2\_to\_vnet1](#input\_vnet2\_to\_vnet1) | name of connection | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_vnet1_to_vnet2_id"></a> [vnet1\_to\_vnet2\_id](#output\_vnet1\_to\_vnet2\_id) | vnet1 to vnet2 connection |
| <a name="output_vnet2_to_vnet1_id"></a> [vnet2\_to\_vnet1\_id](#output\_vnet2\_to\_vnet1\_id) | vnet2 to vnet1 connection |

## Module usage
```
module "vnet1tovnet2vpn_module" {
  source         = "../../modules/module_vnettovnetvpn/vpn"
  vnet1_to_vnet2 = var.vnet1_to_vnet2
  location       = var.location
  rg             = var.rg2

  type                            = var.type
  virtual_network_gateway_id      = var.virtual_network_gateway_id
  peer_virtual_network_gateway_id = var.peer_virtual_network_gateway_id

  shared_key                     = var.shared_key
  tags                           = var.tags
  authorization_key              = var.authorization_key
  dpd_timeout_seconds            = var.dpd_timeout_seconds
  express_route_circuit_id       = var.express_route_circuit_id
  local_azure_ip_address_enabled = var.local_azure_ip_address_enabled
  local_network_gateway_id       = var.local_network_gateway_id
  routing_weight                 = var.routing_weight
  connection_mode                = var.connection_mode
  connection_protocol            = var.connection_protocol
  enable_bgp                     = var.enable_bgp

  express_route_gateway_bypass       = var.express_route_gateway_bypass
  egress_nat_rule_ids                = var.egress_nat_rule_ids
  ingress_nat_rule_ids               = var.ingress_nat_rule_ids
  use_policy_based_traffic_selectors = var.use_policy_based_traffic_selectors
  ipsec_policy                       = var.ipsec_policy
  dh_group                           = var.dh_group
  ike_encryption                     = var.ike_encryption
  ike_integrity                      = var.ike_integrity
  ipsec_encryption                   = var.ipsec_encryption
  ipsec_integrity                    = var.ipsec_integrity
  pfs_group                          = var.pfs_group
  sa_datasize                        = var.sa_datasize
  sa_lifetime                        = var.sa_lifetime
  traffic_selector_policy            = var.traffic_selector_policy
  local_address_cidrs                = var.local_address_cidrs
  remote_address_cidrs               = var.remote_address_cidrs
  custom_bgp_addresses               = var.custom_bgp_addresses
  primary                            = var.primary
  secondary                          = var.secondary
  
}
module "vnet2tovnet1vpn_module" {
  source         = "../../modules/module_vnettovnetvpn/vpn"
  vnet1_to_vnet2 = var.vnet2_to_vnet1
  location       = var.location1
  rg             = var.rg1

  type                            = var.type
  virtual_network_gateway_id      = var.peer_virtual_network_gateway_id
  peer_virtual_network_gateway_id = var.virtual_network_gateway_id

  shared_key                     = var.shared_key
  tags                           = var.tags
  authorization_key              = var.authorization_key
  dpd_timeout_seconds            = var.dpd_timeout_seconds
  express_route_circuit_id       = var.express_route_circuit_id
  local_azure_ip_address_enabled = var.local_azure_ip_address_enabled
  local_network_gateway_id       = var.local_network_gateway_id
  routing_weight                 = var.routing_weight
  connection_mode                = var.connection_mode
  connection_protocol            = var.connection_protocol
  enable_bgp                     = var.enable_bgp

  express_route_gateway_bypass       = var.express_route_gateway_bypass
  egress_nat_rule_ids                = var.egress_nat_rule_ids
  ingress_nat_rule_ids               = var.ingress_nat_rule_ids
  use_policy_based_traffic_selectors = var.use_policy_based_traffic_selectors
  ipsec_policy                       = var.ipsec_policy
  dh_group                           = var.dh_group
  ike_encryption                     = var.ike_encryption
  ike_integrity                      = var.ike_integrity
  ipsec_encryption                   = var.ipsec_encryption
  ipsec_integrity                    = var.ipsec_integrity
  pfs_group                          = var.pfs_group
  sa_datasize                        = var.sa_datasize
  sa_lifetime                        = var.sa_lifetime
  traffic_selector_policy            = var.traffic_selector_policy
  local_address_cidrs                = var.local_address_cidrs
  remote_address_cidrs               = var.remote_address_cidrs
  custom_bgp_addresses               = var.custom_bgp_addresses
  primary                            = var.primary
  secondary                          = var.secondary
```
<!-- END_TF_DOCS -->