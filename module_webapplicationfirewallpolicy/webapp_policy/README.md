<!-- BEGIN_TF_DOCS -->
###### Last Updated[DD/MM/YYYY]: 17/10/2022
## Introduction

Manages a Azure Web Application Firewall Policy instance. We can add a managed rule, and multiple custom rules to it. 

## File Structure 

This particular module is having the following configuration files.
- webapplicationfirewall.tf : This file is having the terraform code to provision the resources as per requirements.
- variables.tf : This file consists of all the variable definitions needed for the terraform code mentioned in webapplicationfirewall.tf
- outputs.tf : This file will be having the resource output details generated.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 3.23.0 |

## Resources

| Name | Type |
|------|------|
| [azurerm_web_application_firewall_policy.wafp](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/web_application_firewall_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_custom_rules"></a> [custom\_rules](#input\_custom\_rules) | One or more Custom rules in azure. It is mandatory to pass all the parameters in the object. However, if you do not wish to pass custom values to the following optional parameter, please pass 'null' as input. <br>Optional Arguments:<br><li>***name***<br><li>***negation_condition***<br><li>***transforms***<br><li>***selector*** | <pre>list(object({<br>    name      = string<br>    priority  = number<br>    rule_type = string<br>    action    = string<br><br>    match_conditions = list(object({<br>      match_values       = list(string)<br>      operator           = string<br>      negation_condition = bool<br>      transforms         = list(string)<br><br>      match_variables = list(object({<br>        variable_name = string<br>        selector      = string<br>      }))<br>    }))<br>  }))</pre> | n/a | no |
| <a name="input_enable_policy_settings"></a> [enable\_policy\_settings](#input\_enable\_policy\_settings) | whether to enable policy settings block | `bool` | n/a | no |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Describes if the policy is in enabled state or disabled state | `bool` | `true` | no |
| <a name="input_exclusion"></a> [exclusion](#input\_exclusion) | One or more exclusion block in azure. It is mandatory to pass all the parameters in the object. However, if you do not wish to pass custom values to the following optional parameter, please pass 'null' as input. <br>Optional Arguments:<br><li>***selector***<br><li>***type***<br><li>***version***<br><li>***excluded_rules*** | <pre>list(object({<br>    match_variables         = string<br>    selector                = string<br>    selector_match_operator = string<br><br>    excluded_rule_set = list(object({<br>      type    = string<br>      version = string<br><br>      rule_group = list(object({<br>        rule_group_name = string<br>        excluded_rules  = list(string)<br>      }))<br>    }))<br>  }))</pre> | n/a | no |
| <a name="input_file_upload_limit_in_mb"></a> [file\_upload\_limit\_in\_mb](#input\_file\_upload\_limit\_in\_mb) | The File Upload Limit in MB. | `number` | `100` | no |
| <a name="input_location"></a> [location](#input\_location) | RG location in Azure | `string` | n/a | no |
| <a name="input_managed_rule_set"></a> [managed\_rule\_set](#input\_managed\_rule\_set) | One or more Managed rule set in azure. It is mandatory to pass all the parameters in the object. However, if you do not wish to pass custom values to the following optional parameter, please pass 'null' as input. <br>Optional Arguments:<br><li>***type***<br><li>***version***<br><li>***disabled_rules*** | <pre>list(object({<br>    type    = string<br>    version = string<br><br>    rule_group_override = list(object({<br>      rule_group_name = string<br>      disabled_rules  = list(string)<br><br>    }))<br>  }))</pre> | n/a | yes |
| <a name="input_max_request_body_size_in_kb"></a> [max\_request\_body\_size\_in\_kb](#input\_max\_request\_body\_size\_in\_kb) | The Maximum Request Body Size in KB. | `number` | `128` | no |
| <a name="input_mode"></a> [mode](#input\_mode) | Describes if it is in detection mode or prevention mode at the policy level. | `string` | `"Prevention"` | no |
| <a name="input_request_body_check"></a> [request\_body\_check](#input\_request\_body\_check) | Is Request Body Inspection enabled? | `bool` | `true` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | RG name in Azure | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | tags | `map(string)` | n/a | yes |
| <a name="input_web_application_firewall_policy_name"></a> [web\_application\_firewall\_policy\_name](#input\_web\_application\_firewall\_policy\_name) | Web application firewall policy name in Azure | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_web_application_firewall_policy_id"></a> [web\_application\_firewall\_policy\_id](#output\_web\_application\_firewall\_policy\_id) | The ID of the web application firewall policy |

## ## Module Usage

```
module "WebApplicationFirewallPolicy_module" {
  source                               = "../../modules/module_webapplicationfirewallpolicy/webapp_policy"
  resource_group_name                  = var.resource_group_name
  location                             = var.location
  web_application_firewall_policy_name = var.web_application_firewall_policy_name
  tags                                 = var.tags
  custom_rules                         = var.custom_rules
  exclusion                            = var.exclusion
  managed_rule_set                     = var.managed_rule_set
  enable_policy_settings               = var.enable_policy_settings
  enabled                              = var.enabled
  file_upload_limit_in_mb              = var.file_upload_limit_in_mb
  max_request_body_size_in_kb          = var.max_request_body_size_in_kb
  mode                                 = var.mode
  request_body_check                   = var.request_body_check
}
```
<!-- END_TF_DOCS -->