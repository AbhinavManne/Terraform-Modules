<!-- BEGIN_TF_DOCS -->

###### Last Updated[DD/MM/YYYY]: 26/10/2022

## Introduction
A NAT gateway allows flows to be created from the virtual network to the services outside your virtual network.
Virtual Network NAT is a fully managed and highly resilient Network Address Translation (NAT) service. Virtual Network NAT simplifies outbound Internet connectivity for virtual networks. When configured on a subnet, all outbound connectivity uses the Virtual Network NAT's static public IP addresses.

## File Structure 

This particular module is having the following configuration files.
- natgateway.tf : This file is having the terraform code to provision the resources as per requirements.
- variables.tf : This file consists of all the variable definitions needed for the terraform code mentioned in natgateway.tf
- outputs.tf : This file will be having the resource output details generated.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.24.0 |

## Resources

| Name | Type |
|------|------|
| [azurerm_nat_gateway.natgateway](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/nat_gateway) | resource |
| [azurerm_nat_gateway_public_ip_association.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/nat_gateway_public_ip_association) | resource |
| [azurerm_nat_gateway_public_ip_prefix_association.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/nat_gateway_public_ip_prefix_association) | resource |
| [azurerm_subnet_nat_gateway_association.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_nat_gateway_association) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_idle_timeout_in_minutes"></a> [idle\_timeout\_in\_minutes](#input\_idle\_timeout\_in\_minutes) | Idle timeout in minutes | `number` | `4` | no |
| <a name="input_location"></a> [location](#input\_location) | Location where NAT gateway should exist | `string` | n/a | no |
| <a name="input_nat_gateway_name"></a> [nat\_gateway\_name](#input\_nat\_gateway\_name) | NAT gateway name | `string` | n/a | yes |
| <a name="input_public_ip_address_id"></a> [public\_ip\_address\_id](#input\_public\_ip\_address\_id) | ID of the public ip address | `string` | n/a | yes |
| <a name="input_public_ip_prefix_id"></a> [public\_ip\_prefix\_id](#input\_public\_ip\_prefix\_id) | ID of the public ip prefix id | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | RG name in Azure | `string` | n/a | yes |
| <a name="input_sku_name"></a> [sku\_name](#input\_sku\_name) | The SKU which should be used | `string` | `"Standard"` | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | ID of the subnet | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags | `map(any)` | n/a | yes |
| <a name="input_zones"></a> [zones](#input\_zones) | Specifies a list of Availability Zones in which this NAT Gateway should be located. | `list(string)` | n/a | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_NAT_gateway_guid"></a> [NAT\_gateway\_guid](#output\_NAT\_gateway\_guid) | The resource ID of the MySQL Server |
| <a name="output_NAT_gateway_id"></a> [NAT\_gateway\_id](#output\_NAT\_gateway\_id) | The resource ID of the MySQL Server |
| <a name="output_public_ip_address_id"></a> [public\_ip\_address\_id](#output\_public\_ip\_address\_id) | The ID of the Public IP which this NAT Gateway which should be connected to |
| <a name="output_public_ip_prefix_id"></a> [public\_ip\_prefix\_id](#output\_public\_ip\_prefix\_id) | The (Terraform specific) ID of the Association between the NAT Gateway and the Public IP Prefix |
| <a name="output_subnet_id"></a> [subnet\_id](#output\_subnet\_id) | The ID of the Subnet |

## Module Usage

```
module "natgateway_module" {
  source                  = "../../modules/module_nat_gateway"
  resource_group_name     = var.resource_group_name
  location                = var.location
  nat_gateway_name        = var.nat_gateway_name
  sku_name                = var.sku_name
  idle_timeout_in_minutes = var.idle_timeout_in_minutes
  zones                   = var.zones
  tags                    = var.tags
  public_ip_address_id    = var.public_ip_address_id
  public_ip_prefix_id     = var.public_ip_prefix_id
  subnet_id               = var.subnet_id
}
```
<!-- END_TF_DOCS -->