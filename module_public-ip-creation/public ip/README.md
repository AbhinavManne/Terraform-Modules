<!-- BEGIN_TF_DOCS -->

##### last updated:17-08-2022

## Introduction
 This module provisions a public ip .By default some of the properties are optional .

 * ``` Dynamic``` Public IP Addresses aren't allocated until they're assigned to a resource (such as a Virtual Machine or a Load Balancer) by design within Azure.
 * IP Tag ``` RoutingPreference``` requires multiple zones and ```Standard``` SKU to be set.
 * Only ```static IP address allocation``` is supported for ```IPv6```.
 * Public IP Standard SKUs require allocation_method to be set to ```Static```.
 * When sku_tier is set to ```Global```, sku must be set to ```Standard```.
 * Availability Zones are only supported with a ```Standard ```SKU and in select regions at this time. Standard SKU Public IP Addresses that do not specify a zone are not zone-redundant by default.
 *  reverse_fqdn can only be set after a DNS record has been created .

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.26.0 |



## Resources

| Name | Type |
|------|------|
| [azurerm_public_ip.public_ip](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allocation_method"></a> [allocation\_method](#input\_allocation\_method) | (Required) Defines the allocation method for this IP addres | `string` | n/a | yes |
| <a name="input_domain_name_label"></a> [domain\_name\_label](#input\_domain\_name\_label) | (Optional) Label for the Domain Name. Will be used to make up the FQDN. If a domain name label is specified, an A DNS record is created for the public IP in the Microsoft Azure DNS system. | `string` | `null` | no |
| <a name="input_edge_zone"></a> [edge\_zone](#input\_edge\_zone) | (optional) Specifies the Edge Zone within the Azure Region where this Public IP should exist. | `string` | `"null"` | no |
| <a name="input_generate_domain_name_label"></a> [generate\_domain\_name\_label](#input\_generate\_domain\_name\_label) | Generate automatically the domain name label, if set to true, automatically generate a domain name label with the name | `bool` | `false` | no |
| <a name="input_idle_timeout_in_minutes"></a> [idle\_timeout\_in\_minutes](#input\_idle\_timeout\_in\_minutes) | (Optional) Specifies the timeout for the TCP idle connection. The value can be set between 4 and 30 minutes. | `number` | `null` | no |
| <a name="input_ip_tags"></a> [ip\_tags](#input\_ip\_tags) | (Optional) A mapping of IP tags to assign to the public IP. | `map(any)` | `{}` | no |
| <a name="input_ip_version"></a> [ip\_version](#input\_ip\_version) | (Optional) The IP Version to use, IPv6 or IPv4. | `string` | `"IPv4"` | no |
| <a name="input_location"></a> [location](#input\_location) | (Required) Location of the public IP to be created | `string` | n/a | yes |
| <a name="input_public_ip_name"></a> [public\_ip\_name](#input\_public\_ip\_name) | (Required) Name of the public IP to be created | `string` | n/a | yes |
| <a name="input_public_ip_prefix_id"></a> [public\_ip\_prefix\_id](#input\_public\_ip\_prefix\_id) | (Optional) If specified then public IP address allocated will be provided from the public IP prefix resource. | `string` | `""` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | (Required) Resource group of the public IP to be created | `string` | n/a | yes |
| <a name="input_reverse_fqdn"></a> [reverse\_fqdn](#input\_reverse\_fqdn) | (Optional) A fully qualified domain name that resolves to this public IP address. If the reverseFqdn is specified, then a PTR DNS record is created pointing from the IP address in the in-addr.arpa domain to the reverse FQDN. | `bool` | `null` | no |
| <a name="input_sku"></a> [sku](#input\_sku) | (Optional) The SKU of the Public IP. Accepted values are Basic and Standard. Defaults to Basic. | `string` | `"Basic"` | no |
| <a name="input_sku_tier"></a> [sku\_tier](#input\_sku\_tier) | (optional)The SKU Tier that should be used for the Public IP. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) Tags for the resource to be deployed. | `map(any)` | `null` | no |
| <a name="input_zones"></a> [zones](#input\_zones) | (Optional) The availability zone to allocate the Public IP in. Possible values are Zone-Redundant, 1, 2, 3, and No-Zone. Defaults to Zone-Redundant. | `list(string)` | <pre>[<br>  "Zone-Redundant"<br>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_public_ip_id"></a> [public\_ip\_id](#output\_public\_ip\_id) | ID of public ip |

## Module Usage
```
module "public_ip_module" {
  source = "../../modules/module_public-ip-creation/public ip"

  resource_group_name     = module.module_create_resource_group.resource_group_name
  location                = module.module_create_resource_group.resource_group_location
  public_ip_name          = var.public_ip_name
  allocation_method       = var.allocation_method
  sku                     = var.sku
  ip_version              = var.ip_version
  domain_name_label       = var.domain_name_label
  idle_timeout_in_minutes = var.idle_timeout_in_minutes
  zones                   = var.zones
  reverse_fqdn            = var.reverse_fqdn
  public_ip_prefix_id     = var.public_ip_prefix_id
  edge_zone               = var.edge_zone
  sku_tier                = var.sku_tier
  ip_tags                 = var.ip_tags
  tags                    = var.tags
}

```
<!-- END_TF_DOCS -->