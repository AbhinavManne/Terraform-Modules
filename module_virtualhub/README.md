<!-- BEGIN_TF_DOCS -->
Last Updated[DD/MM/YYYY]: 14/11/2022
# <u> Introduction </u>
* This module provides the facility to provision virtual hub. In this module we have included all possible argument for virtual hub.

## File Structure 
This particular module is having the following configuration files.
- virtualhub.tf : This file is having the terraform code to provision the resources as per requirements.
- variables.tf : This file consist of all the variable definitions needed for the terraform code mentioned in main.tf
- output.tf : This file is having all the resource output details generated.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.30.0 |



## Resources

| Name | Type |
|------|------|
| [azurerm_virtual_hub.virtualhub](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_hub) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_address_prefix"></a> [address\_prefix](#input\_address\_prefix) | The Address Prefix which should be used for this Virtual Hub. | `string` | `null` | no |
| <a name="input_location"></a> [location](#input\_location) | Specifies the supported Azure location where the Virtual Hub should exist. | `string` | n/a | yes |
| <a name="input_next_hop_ip_address"></a> [next\_hop\_ip\_address](#input\_next\_hop\_ip\_address) | The IP Address that Packets should be forwarded to as the Next Hop. | `string` | `null` | no |
| <a name="input_rg"></a> [rg](#input\_rg) | Specifies the name of the Resource Group where the Virtual Hub should exist. | `string` | n/a | yes |
| <a name="input_route"></a> [route](#input\_route) | One or more route blocks as defined below. | `string` | `null` | no |
| <a name="input_sku"></a> [sku](#input\_sku) | The SKU of the Virtual Hub. Possible values are Basic and Standard. | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the Virtual Hub. | `map(string)` | `null` | no |
| <a name="input_virtual_wan_id"></a> [virtual\_wan\_id](#input\_virtual\_wan\_id) | The ID of a Virtual WAN within which the Virtual Hub should be created. | `string` | `null` | no |
| <a name="input_virtualhub"></a> [virtualhub](#input\_virtualhub) | The name of the Virtual Hub. Changing this forces a new resource to be created. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_virtualhub_id"></a> [virtualhub\_id](#output\_virtualhub\_id) | The ID of the Virtual hub. |

## Module Usage
```
module "virtualhub" {
  source = "../../modules/module_virtualhub"

  virtualhub          = var.virtualhub
  rg                  = var.rg
  location            = var.location
  virtual_wan_id      = var.virtual_wan_id
  address_prefix      = "10.0.0.0/23"
  sku                 = var.sku
  tags                = var.tags
  next_hop_ip_address = var.next_hop_ip_address
  route               = var.route
}
```
<!-- END_TF_DOCS -->