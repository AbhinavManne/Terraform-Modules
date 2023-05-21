<!-- BEGIN_TF_DOCS -->
Last Updated[DD/MM/YYYY]: 20/10/2022
# <u> Introduction </u>
* This module provides the facility to provision point to site vpn gateway. In this module we have included all possible argument for point to site vpn gateway.

## File Structure 
This particular module is having the following configuration files.
- point_to_site.tf : This file is having the terraform code to provision the resources as per requirements.
- variables.tf : This file consist of all the variable definitions needed for the terraform code mentioned in main.tf
- output.tf : This file is having all the resource output details generated.


## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |


## Resources

| Name | Type |
|------|------|
| [azurerm_point_to_site_vpn_gateway.example](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/point_to_site_vpn_gateway) | resource |
| [azurerm_vpn_server_configuration.example](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/vpn_server_configuration) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_address_prefixes"></a> [address\_prefixes](#input\_address\_prefixes) | A list of CIDR Ranges which should be used as Address Prefixes | `list(string)` | n/a | yes |
| <a name="input_associated_route_table_id"></a> [associated\_route\_table\_id](#input\_associated\_route\_table\_id) | The Virtual Hub Route Table resource id associated with this Routing Configuration. | `string` | n/a | yes |
| <a name="input_connection_configuration"></a> [connection\_configuration](#input\_connection\_configuration) | The Name which should be used for this Connection Configuration name | `string` | n/a | yes |
| <a name="input_internet_security_enabled"></a> [internet\_security\_enabled](#input\_internet\_security\_enabled) | Should Internet Security be enabled to secure internet traffic? Changing this forces a new resource to be created. Defaults to false. | `bool` | `false` | no |
| <a name="input_location"></a> [location](#input\_location) | Specifies the supported Azure location where the resource exists | `string` | n/a | yes |
| <a name="input_point_to_site_vpn_gateway"></a> [point\_to\_site\_vpn\_gateway](#input\_point\_to\_site\_vpn\_gateway) | Specifies the name of the Point-to-Site VPN Gateway | `string` | n/a | yes |
| <a name="input_propagated_route_table"></a> [propagated\_route\_table](#input\_propagated\_route\_table) | Whether to enable propagated route table block | `bool` | n/a | yes |
| <a name="input_propagated_route_table_ids"></a> [propagated\_route\_table\_ids](#input\_propagated\_route\_table\_ids) | The list of Virtual Hub Route Table resource id which the routes will be propagated to. | `list(string)` | n/a | yes |
| <a name="input_propagated_route_table_labels"></a> [propagated\_route\_table\_labels](#input\_propagated\_route\_table\_labels) | The list of labels to logically group Virtual Hub Route Tables which the routes will be propagated to. | `set(string)` | `null` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | RG name in Azure | `string` | n/a | yes |
| <a name="input_scale_unit"></a> [scale\_unit](#input\_scale\_unit) | The Scale Unit for this Point-to-Site VPN Gateway | `number` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the Point-to-Site VPN Gateway | `map(string)` | `null` | no |
| <a name="input_virtual_hub_id"></a> [virtual\_hub\_id](#input\_virtual\_hub\_id) | The ID of the Virtual Hub where this Point-to-Site VPN Gateway should exist | `string` | n/a | yes |
| <a name="input_vpn_authentication_types"></a> [vpn\_authentication\_types](#input\_vpn\_authentication\_types) | The name of vpn authentication types | `list(string)` | n/a | yes |
| <a name="input_vpn_server_configuration"></a> [vpn\_server\_configuration](#input\_vpn\_server\_configuration) | The name of vpn server configuration | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_point_to_site_vpn_gateway_id"></a> [point\_to\_site\_vpn\_gateway\_id](#output\_point\_to\_site\_vpn\_gateway\_id) | n/a |
## Module Usage

```
module "point_to_site_vpn_gateway" {
  source = "../../modules/module_point_to_site_vpn_gateway/point-to-site"

  resource_group_name            = var.resource_group_name
  point_to_site_vpn_gateway      = var.point_to_site_vpn_gateway
  location                       = var.location
  connection_configuration       = var.connection_configuration
  tags                           = var.tags
  scale_unit                     = var.scale_unit
  virtual_hub_id                 = var.virtual_hub_id
  #vpn_server_configuration_id   = var.vpn_server_configuration_id
  vpn_server_configuration       = var.vpn_server_configuration
  vpn_authentication_types       = var.vpn_authentication_types
  #client_root_certificate       = var.client_root_certificate
  #public_cert_data              = var.public_cert_data
  address_prefixes               = var.address_prefixes
  internet_security_enabled      = var.internet_security_enabled
 # enable_route                  = var.enable_route
  associated_route_table_id      = var.associated_route_table_id
  propagated_route_table         = var.propagated_route_table
  propagated_route_table_ids     = var.propagated_route_table_ids
  propagated_route_table_labels  = var.propagated_route_table_labels

}
```
<!-- END_TF_DOCS -->
