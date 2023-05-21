<!-- BEGIN_TF_DOCS -->
###### Last Updated[DD/MM/YYYY]: 10/11/2022
##  Introduction 

This module provisions following resource- Manages a Virtual WAN.

   a)Azure Virtual WAN is a networking service that brings many networking, security, and routing functionalities together to provide a single operational interface. 

## File Structure 

This particular module is having the following configuration files.
- virtual_wan.tf : This file is having the terraform code to provision the resource as per requirements.
- variables.tf : This file consists of all the variable definitions needed for the terraform code mentioned in virtual_wan.tf
- outputs.tf : This file will be having the resource output details generated.

## Requirements

1. Resource group

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |


## Resources

| Name | Type |
|------|------|
| [azurerm_virtual_wan.virtual_wan](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_wan) | resource |
| [Microsoft.virtual_wan](https://learn.microsoft.com/en-us/azure/virtual-wan/virtual-wan-about) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allow_branch_to_branch_traffic"></a> [allow\_branch\_to\_branch\_traffic](#input\_allow\_branch\_to\_branch\_traffic) | Boolean flag to specify whether branch to branch traffic is allowed. | `string` | `"true"` | no |
| <a name="input_disable_vpn_encryption"></a> [disable\_vpn\_encryption](#input\_disable\_vpn\_encryption) | Boolean flag to specify whether VPN encryption is disabled. | `string` | `"false"` | no |
| <a name="input_location"></a> [location](#input\_location) | Specifies the supported Azure location where the resource exists. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Specifies the name of the Virtual WAN. | `string` | n/a | yes |
| <a name="input_office365_local_breakout_category"></a> [office365\_local\_breakout\_category](#input\_office365\_local\_breakout\_category) | Specifies the Office365 local breakout category. Possible values include: Optimize, OptimizeAndAllow, All, None. | `string` | `"None"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which to create the Virtual WAN | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the Virtual WAN. | `map(string)` | n/a | yes |
| <a name="input_type"></a> [type](#input\_type) | Specifies the Virtual WAN type. Possible Values include: Basic and Standard. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_virtual_wan_id"></a> [virtual\_wan\_id](#output\_virtual\_wan\_id) | The ID of the Virtual WAN. |
<!-- END_TF_DOCS -->