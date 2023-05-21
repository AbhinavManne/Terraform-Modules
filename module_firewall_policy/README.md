<!-- BEGIN_TF_DOCS -->

###### Last Updated[DD/MM/YYYY]: 18/10/2022

## Introduction
This module manages a Firewall Policy, Along with different blocks such as, Identity, dns, Insights etc,.

## File Structure 

This particular module is having the following configuration files.
- firewall-policy.tf : This file is having the terraform code to provision the resources as per requirements.
- Variables.tf : This file consists of all the variable definitions needed for the terraform code mentioned in firewall-policy.tf
- Outputs.tf : This file will be having the resource output details generated.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.24.0 |

## Resources

| Name | Type |
|------|------|
| [azurerm_firewall_policy.fp](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/firewall_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_base_policy_id"></a> [base\_policy\_id](#input\_base\_policy\_id) | The ID of the base Firewall Policy | `string` | n/a | no |
| <a name="input_default_log_analytics_workspace_id"></a> [default\_log\_analytics\_workspace\_id](#input\_default\_log\_analytics\_workspace\_id) | The ID of the default Log Analytics Workspace that the Firewalls associated with this Firewall Policy will send their logs to, when there is no location matches in the log\_analytics\_workspace | `string` | n/a | yes |
| <a name="input_enable_dns"></a> [enable\_dns](#input\_enable\_dns) | Whether to enable DNS block | `bool` | n/a | no |
| <a name="input_enable_intrusion_detection"></a> [enable\_intrusion\_detection](#input\_enable\_intrusion\_detection) | Whether to enable intrusion\_detection | `bool` | n/a | no |
| <a name="input_enable_threat_intelligence_allowlist"></a> [enable\_threat\_intelligence\_allowlist](#input\_enable\_threat\_intelligence\_allowlist) | Whether to enable threat intelligence allowlist | `bool` | n/a | no |
| <a name="input_enable_tls_certificate"></a> [enable\_tls\_certificate](#input\_enable\_tls\_certificate) | Whether to enable tls certificate block | `bool` | n/a | no |
| <a name="input_firewall_policy_name"></a> [firewall\_policy\_name](#input\_firewall\_policy\_name) | Firewall policy name in Azure | `string` | n/a | yes |
| <a name="input_firewall_policy_sku"></a> [firewall\_policy\_sku](#input\_firewall\_policy\_sku) | The SKU Tier of the Firewall Policy. | `string` | `"Standard"` | no |
| <a name="input_fqdns"></a> [fqdns](#input\_fqdns) | A list of FQDNs that will be skipped for threat detection | `list(string)` | `null` | no |
| <a name="input_identity_ids"></a> [identity\_ids](#input\_identity\_ids) | Specifies a list of User Assigned Managed Identity IDs to be assigned to this Firewall Policy | `list(string)` | n/a | yes |
| <a name="input_identity_type"></a> [identity\_type](#input\_identity\_type) | Specifies the type of Managed Service Identity that should be configured on this Firewall Policy | `string` | n/a | yes |
| <a name="input_insights_enabled"></a> [insights\_enabled](#input\_insights\_enabled) | Whether the insights functionality is enabled for this Firewall Policy | `bool` | n/a | yes |
| <a name="input_ip_addresses"></a> [ip\_addresses](#input\_ip\_addresses) | A list of IP addresses or CIDR ranges that will be skipped for threat detection. | `list(string)` | `null` | no |
| <a name="input_key_vault_secret_id"></a> [key\_vault\_secret\_id](#input\_key\_vault\_secret\_id) | The ID of the Key Vault, where the secret or certificate is stored. | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Resource group location | `string` | n/a | yes |
| <a name="input_log_analytics_workspace"></a> [log\_analytics\_workspace](#input\_log\_analytics\_workspace) | log analytics workspace block. It is mandatory to pass all the parameters in the object. However, if you do not wish to pass custom values to the following optional parameter, please pass 'null' as input. | <pre>map(object({<br>    id                = string<br>    firewall_location = string<br>  }))</pre> | n/a | no |
| <a name="input_mode"></a> [mode](#input\_mode) | n which mode you want to run intrusion detection | `string` | `"Off"` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the certificate | `string` | n/a | yes |
| <a name="input_private_ip_ranges"></a> [private\_ip\_ranges](#input\_private\_ip\_ranges) | A list of private IP ranges to which traffic will not be SNAT. | `list(string)` | n/a | yes |
| <a name="input_private_ranges"></a> [private\_ranges](#input\_private\_ranges) | A list of Private IP address ranges to identify traffic direction. | `list(string)` | `null` | no |
| <a name="input_proxy_enabled"></a> [proxy\_enabled](#input\_proxy\_enabled) | Whether to enable DNS proxy on Firewalls attached to this Firewall Policy | `bool` | `false` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Resource group name | `string` | n/a | yes |
| <a name="input_retention_in_days"></a> [retention\_in\_days](#input\_retention\_in\_days) | The log retention period in days. | `number` | `null` | no |
| <a name="input_servers"></a> [servers](#input\_servers) | A list of custom DNS servers' IP addresses | `list(string)` | `null` | no |
| <a name="input_signature_overrides"></a> [signature\_overrides](#input\_signature\_overrides) | Signature Overrides block. It is mandatory to pass all the parameters in the object. However, if you do not wish to pass custom values to the following optional parameter, please pass 'null' as input.<br>Optional Arguments: <br><li>***id***<br><li>***state*** | <pre>list(object({<br>    id    = number<br>    state = string<br>  }))</pre> | n/a | no |
| <a name="input_sql_redirect_allowed"></a> [sql\_redirect\_allowed](#input\_sql\_redirect\_allowed) | Whether SQL Redirect traffic filtering is allowed. | `bool` | `false` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags | `map(any)` | n/a | yes |
| <a name="input_threat_intelligence_mode"></a> [threat\_intelligence\_mode](#input\_threat\_intelligence\_mode) | The operation mode for Threat Intelligence. | `string` | `"Alert"` | no |
| <a name="input_traffic_bypass"></a> [traffic\_bypass](#input\_traffic\_bypass) | Traffic bypass block. It is mandatory to pass all the parameters in the object. However, if you do not wish to pass custom values to the following optional parameter, please pass 'null' as input.<br>Optional Arguments:<br><li>***description***<br><li>***destination_addresses***<br><li>***destination_ip_groups***<br><li>***destination_ports***<br><li>***source_addresses***<br><li>***source_ip_groups*** | <pre>list(object({<br>    name                  = string<br>    protocol              = string<br>    description           = string<br>    destination_addresses = list(string)<br>    destination_ip_groups = list(string)<br>    destination_ports     = list(string)<br>    source_addresses      = list(string)<br>    source_ip_groups      = list(string)<br>  }))</pre> | n/a | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_firewall_policy_child_policies"></a> [firewall\_policy\_child\_policies](#output\_firewall\_policy\_child\_policies) | A list of reference to child Firewall Policies of this Firewall Policy. |
| <a name="output_firewall_policy_firewalls"></a> [firewall\_policy\_firewalls](#output\_firewall\_policy\_firewalls) | A list of references to Azure Firewalls that this Firewall Policy is associated with. |
| <a name="output_firewall_policy_id"></a> [firewall\_policy\_id](#output\_firewall\_policy\_id) | ID of the  firewall policy |
| <a name="output_firewall_policy_rule_collection_groups"></a> [firewall\_policy\_rule\_collection\_groups](#output\_firewall\_policy\_rule\_collection\_groups) | A list of references to Firewall Policy Rule Collection Groups that belongs to this Firewall Policy. |

## Module
```
module "FirewallPolicy_module" {
  source                               = "../../modules/module_firewall_policy"
  resource_group_name                  = var.resource_group_name
  location                             = var.location
  firewall_policy_name                 = var.firewall_policy_name
  base_policy_id                       = var.base_policy_id
  private_ip_ranges                    = var.private_ip_ranges
  firewall_policy_sku                  = var.firewall_policy_sku
  tags                                 = var.tags
  threat_intelligence_mode             = var.threat_intelligence_mode
  sql_redirect_allowed                 = var.sql_redirect_allowed
  enable_dns                           = var.enable_dns
  proxy_enabled                        = var.proxy_enabled
  servers                              = var.servers
  identity_type                        = var.identity_type
  identity_ids                         = var.identity_ids
  insights_enabled                     = var.insights_enabled
  default_log_analytics_workspace_id   = var.default_log_analytics_workspace_id
  retention_in_days                    = var.retention_in_days
  log_analytics_workspace              = var.log_analytics_workspace
  enable_intrusion_detection           = var.enable_intrusion_detection
  mode                                 = var.mode
  private_ranges                       = var.private_ip_ranges
  signature_overrides                  = var.signature_overrides
  traffic_bypass                       = var.traffic_bypass
  enable_threat_intelligence_allowlist = var.enable_threat_intelligence_allowlist
  fqdns                                = var.fqdns
  ip_addresses                         = var.ip_addresses
  enable_tls_certificate               = var.enable_tls_certificate
  key_vault_secret_id                  = var.key_vault_secret_id
  name                                 = var.name

}
```
<!-- END_TF_DOCS -->