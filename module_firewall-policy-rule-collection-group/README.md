<!-- BEGIN_TF_DOCS -->

###### Last Updated[DD/MM/YYYY]: 18/10/2022

## Introduction
This module manages a Firewall Policy Rule Collection Group, different Application rule collection, Network rule collection and NAT rule collection can be used as per the requirement.

## File Structure 

This particular module is having the following configuration files.
- firewall-policy-rule-collection-group.tf : This file is having the terraform code to provision the resources as per requirements.
- variables.tf : This file consists of all the variable definitions needed for the terraform code mentioned in firewall-policy-rule-collection-group.tf
- outputs.tf : This file will be having the resource output details generated.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.24.0 |

## Resources

| Name | Type |
|------|------|
| [azurerm_firewall_policy_rule_collection_group.fprcg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/firewall_policy_rule_collection_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_application_rule_collection"></a> [application\_rule\_collection](#input\_application\_rule\_collection) | Application rule collection block in firewall policy rule collection group. It is mandatory to pass all the parameters in the object. However, if you do not wish to pass custom values to the following optional parameter, please pass 'null' as input. <br>Optional Arguments:<br><li>***description***<br><li>***source\_addresses***<br><li>***source\_ip\_groups***<br><li>***destination\_addresses***<br><li>***destination\_urls***<br><li>***destination\_fqdns***<br><li>***destination\_fqdn\_tags***<br><li>***terminate\_tls***<br><li>***web\_categories*** | <pre>list(object({<br>    name     = string<br>    priority = number<br>    action   = string<br><br>    rule = list(object({<br>      name                   = string<br>      description            = string<br>      source_addresses       = list(string)<br>      source_ip_groups       = list(string)<br>      destination_addresses  = list(string)<br>      destination_urls       = list(string)<br>      destination_fqdns      = list(string)<br>      destination_fqdn_tags  = list(string)<br>      terminate_tls          = bool<br>      web_categories         = list(string)<br><br>      protocols = list(object({<br>        type = string<br>        port = number<br>      }))<br>    }))<br>  }))</pre> | n/a | no |
| <a name="input_firewall_policy_id"></a> [firewall\_policy\_id](#input\_firewall\_policy\_id) | The ID of the Firewall Policy where the Firewall Policy Rule Collection Group should exist | `string` | n/a | yes |
| <a name="input_firewall_policy_rule_collection_group_name"></a> [firewall\_policy\_rule\_collection\_group\_name](#input\_firewall\_policy\_rule\_collection\_group\_name) | firewall policy rule collection group name in Azure | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Resource group location | `string` | n/a | yes |
| <a name="input_nat_rule_collection"></a> [nat\_rule\_collection](#input\_nat\_rule\_collection) | Nat rule collection block in firewall policy rule collection group. It is mandatory to pass all the parameters in the object. However, if you do not wish to pass custom values to the following optional parameter, please pass 'null' as input. <br>Optional Arguments:<br><li>***source\_addresses***<br><li>***source\_ip\_groups***<br><li>***destination\_address***<br><li>***destination\_ports***<br><li>***translated\_address***<br><li>***translated\_fqdn***<br><li>***translated\_port*** | <pre>list(object({<br>    name     = string<br>    priority = number<br>    action   = string<br><br>    rule = object({<br>      name      = string<br>      protocols = list(string)<br>      source_addresses      = list(string)<br>      source_ip_groups      = list(string)<br>      destination_address   = string<br>      destination_ports     = list(string)<br>      translated_address    = string<br>      translated_fqdn       = string<br>      translated_port       = string<br>    })<br>  }))</pre> | n/a | no |
| <a name="input_network_rule_collection"></a> [network\_rule\_collection](#input\_network\_rule\_collection) | Network rule collection block in firewall policy rule collection group. It is mandatory to pass all the parameters in the object. However, if you do not wish to pass custom values to the following optional parameter, please pass 'null' as input. <br>Optional Arguments:<br><li>***source\_addresses***<br><li>***source\_ip\_groups***<br><li>***destination\_addresses***<br><li>***destination\_ip\_groups***<br><li>***destination\_fqdns*** | <pre>list(object({<br>    name     = string<br>    priority = number<br>    action   = string<br><br>    rule = list(object({<br>      name                  = string<br>      protocols             = list(string)<br>      destination_ports     = list(string)<br>      source_addresses      = list(string)<br>      source_ip_groups      = list(string)<br>      destination_addresses = list(string)<br>      destination_ip_groups = list(string)<br>      destination_fqdns     = list(string)<br>    }))<br>  }))</pre> | n/a | no |
| <a name="input_priority"></a> [priority](#input\_priority) | The priority of the Firewall Policy Rule Collection Group | `number` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Resource group name | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_firewall_policy_rule_collection_group_id"></a> [firewall\_policy\_rule\_collection\_group\_id](#output\_firewall\_policy\_rule\_collection\_group\_id) | The ID of the Firewall Policy Rule Collection Group |

## Module
```
module "FirewallPolicyRuleCollectionGroup_module" {
  source                                     = "../../modules/module_firewall-policy-rule-collection-group"
  firewall_policy_rule_collection_group_name = var.firewall_policy_rule_collection_group_name
  firewall_policy_id                         = module.FirewallPolicy_module.firewall_policy_id
  priority                                   = var.priority
  application_rule_collection                = var.application_rule_collection
  network_rule_collection                    = var.network_rule_collection
  nat_rule_collection                        = var.nat_rule_collection
}
```
<!-- END_TF_DOCS -->