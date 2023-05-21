<!-- BEGIN_TF_DOCS -->

###### Last Updated[DD/MM/YYYY]: 09/09/2022

## Introduction
IP Groups allow you to group and manage IP addresses for Azure Firewall rules in the following ways:

* As a source address in DNAT rules
* As a source or destination address in network rules
* As a source address in application rules
* An IP Group can have a single IP address, multiple IP addresses, or one or more IP address ranges.

IP Groups can be reused in Azure Firewall DNAT, network, and application rules for multiple firewalls across regions and subscriptions in Azure. Group names must be unique. You can configure an IP Group in the Azure portal, Azure CLI, or REST API. A sample template is provided to help you get started.


## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.19.0 |

## Resources

| Name | Type |
|------|------|
| [azurerm_ip_group.ipgroup](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/ip_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cidrs"></a> [cidrs](#input\_cidrs) | cidr block | `list(string)` | n/a | no |
| <a name="input_ip_group"></a> [ip\_group](#input\_ip\_group) | IP Group Name | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Resource group name | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Resource group name | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags | `map(any)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ip-group_id"></a> [ip-group\_id](#output\_ip-group\_id) | The ID of the ip group |

## Module Usage

```
module "ip_groups" {
  source                = "../../modules/module_ip-groups/ip-groups"
  resource_group_name   = var.resource_group_name
  location              = var.location
  ip_group              = var.ip_group
  cidrs                 = var.cidrs
  tags                  = var.tags
}
```
<!-- END_TF_DOCS -->