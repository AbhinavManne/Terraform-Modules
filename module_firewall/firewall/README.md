<!-- BEGIN_TF_DOCS -->
###### Last Updated[DD/MM/YYYY]: 10/10/2022

## Introduction

This module helps us to provision the firewall. This module can be called and used with different kind of Firewall rules i.e., :
- Application rules
- NAT rules
- Network rules

## File Structure 

This particular module is having the following configuration files.
- firewall.tf : This file is having the terraform code to provision the resources as per requirements.
- Variables.tf : This file consists of all the variable definitions needed for the terraform code mentioned in firewall.tf
- Outputs.tf : This file will be having the resource output details generated.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.23.0 |

## Resources

| Name | Type |
|------|------|
| [azurerm_firewall.firewall](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/firewall) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dns_servers"></a> [dns\_servers](#input\_dns\_servers) | A list of DNS servers that the Azure Firewall will direct DNS traffic to the for name resolution | `list(string)` | `null` | no |
| <a name="input_firewall_name"></a> [firewall\_name](#input\_firewall\_name) | Firewall name in Azure | `string` | n/a | yes |
| <a name="input_firewall_policy_id"></a> [firewall\_policy\_id](#input\_firewall\_policy\_id) | The ID of the Firewall Policy applied to the Firewall | `string` | `null` | no |
| <a name="input_ip_config_name"></a> [ip\_config\_name](#input\_ip\_config\_name) | Specifies the name of the IP Configuration. | `string` | n/a | no |
| <a name="input_ip_config_public_ip_address_id"></a> [ip\_config\_public\_ip\_address\_id](#input\_ip\_config\_public\_ip\_address\_id) | The ID of the Public IP Address associated with the firewall. | `string` | n/a | yes |
| <a name="input_ip_config_subnet_id"></a> [ip\_config\_subnet\_id](#input\_ip\_config\_subnet\_id) | Reference to the subnet associated with the IP Configuration. | `string` | n/a | no |
| <a name="input_location"></a> [location](#input\_location) | Resource group location | `string` | n/a | yes |
| <a name="input_mgmt_ip_config_name"></a> [mgmt\_ip\_config\_name](#input\_mgmt\_ip\_config\_name) | Specifies the name of the IP Configuration. | `string` | n/a | yes |
| <a name="input_mgmt_ip_config_public_ip_address_id"></a> [mgmt\_ip\_config\_public\_ip\_address\_id](#input\_mgmt\_ip\_config\_public\_ip\_address\_id) | The ID of the Public IP Address associated with the firewall. | `string` | n/a | yes |
| <a name="input_mgmt_ip_config_subnet_id"></a> [mgmt\_ip\_config\_subnet\_id](#input\_mgmt\_ip\_config\_subnet\_id) | Reference to the subnet associated with the IP Configuration. | `string` | n/a | no |
| <a name="input_private_ip_ranges"></a> [private\_ip\_ranges](#input\_private\_ip\_ranges) | A list of SNAT private CIDR IP ranges, or the special string IANAPrivateRanges | `list(string)` | `null` | no |
| <a name="input_public_ip_count"></a> [public\_ip\_count](#input\_public\_ip\_count) | Specifies the number of public IPs to assign to the Firewall. | `number` | `1` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Resource group name | `string` | n/a | yes |
| <a name="input_sku_name"></a> [sku\_name](#input\_sku\_name) | sku name in Azure | `string` | n/a | yes |
| <a name="input_sku_tier"></a> [sku\_tier](#input\_sku\_tier) | Sku tier in Azure | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags | `map(any)` | n/a | yes |
| <a name="input_threat_intel_mode"></a> [threat\_intel\_mode](#input\_threat\_intel\_mode) | The operation mode for threat intelligence-based filtering. Possible values are: Off, Alert,Deny and (empty string (generally used by double quotes)). | `string` | `"Alert"` | no |
| <a name="input_virtual_hub_id"></a> [virtual\_hub\_id](#input\_virtual\_hub\_id) | Specifies the ID of the Virtual Hub where the Firewall resides in. | `string` | n/a | no |
| <a name="input_zones"></a> [zones](#input\_zones) | Specifies a list of Availability Zones in which this Azure Firewall should be located. | `list(string)` | `null` | no |


## Module Usage

```
module "firewall_module" {
  source                                           = "../../modules/module_firewall/firewall"
  resource_group_name                              = var.resource_group_name
  location                                         = var.location
  firewall_name                                    = var.firewall_name
  tags                                             = var.tags
  sku_name                                         = var.sku_name
  sku_tier                                         = var.sku_tier
  firewall_policy_id                               = var.firewall_policy_id
  dns_servers                                      = var.dns_servers
  private_ip_ranges                                = var.private_ip_ranges
  threat_intel_mode                                = var.threat_intel_mode
  zones                                            = var.zones
  ip_configuration_name                            = var.ip_configuration_name
  subnet_id_ip_configuration                       = var.subnet_id_ip_configuration
  public_ip_address_id_ip_configuration            = var.public_ip_address_id_ip_configuration
  management_ip_configuration_name                 = var.management_ip_configuration_name
  subnet_id_management_ip_configuration            = var.subnet_id_management_ip_configuration
  public_ip_address_id_management_ip_configuration = var.public_ip_address_id_management_ip_configuration
  virtual_hub_id                                   = var.virtual_hub_id
  public_ip_count                                  = var.public_ip_count
}

```
<!-- END_TF_DOCS -->