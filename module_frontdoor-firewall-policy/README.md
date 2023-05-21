<!-- BEGIN_TF_DOCS -->

###### Last Updated[DD/MM/YYYY]: 17/10/2022

## Introduction
This module manages an Azure Front Door Web Application Firewall Policy instance, Along with Custom and, Managed Rules. 

## File Structure 

This particular module is having the following configuration files.
- frontdoor-firewall-policy.tf : This file is having the terraform code to provision the resources as per requirements.
- Variables.tf : This file consists of all the variable definitions needed for the terraform code mentioned in frontdoor-firewall-policy.tf
- Outputs.tf : This file will be having the resource output details generated.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.24.0 |

## Resources

| Name | Type |
|------|------|
| [azurerm_frontdoor_firewall_policy.ffp](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/frontdoor_firewall_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_custom_block_response_body"></a> [custom\_block\_response\_body](#input\_custom\_block\_response\_body) | Response status code for block action type | `string` | n/a | no |
| <a name="input_custom_block_response_status_code"></a> [custom\_block\_response\_status\_code](#input\_custom\_block\_response\_status\_code) | Name of the frontdoor web application firewall policy | `number` | `200` | no |
| <a name="input_custom_rule"></a> [custom\_rule](#input\_custom\_rule) | One or more Custom rules in azure. It is mandatory to pass all the parameters in the object. However, if you do not wish to pass custom values to the following optional parameter, please pass 'null' as input.<br>Optional Arguments: <br><li>***enabled***<br><li>***rate_limit_duration_in_minutes***<br><li>***rate_limit_threshold***<br><li>***selector***<br><li>***negation_condition***<br><li>***transforms*** <br>| <pre>list(object({<br>    name                           = string<br>    action                         = string<br>    enabled                        = bool<br>    priority                       = number<br>    type                           = string<br>    rate_limit_duration_in_minutes = number<br>    rate_limit_threshold           = number<br><br>    match_condition = list(object({<br>      match_variable     = string<br>      match_values       = list(string)<br>      operator           = string<br>      selector           = string<br>      negation_condition = bool<br>      transforms         = list(string)<br>    }))<br>  }))</pre> | n/a | no |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Enabled state | `bool` | `true` | no |
| <a name="input_frontdoor_firewall_policy_name"></a> [frontdoor\_firewall\_policy\_name](#input\_frontdoor\_firewall\_policy\_name) | Name of the frontdoor web application firewall policy | `string` | n/a | yes |
| <a name="input_managed_rule"></a> [managed\_rule](#input\_managed\_rule) | One or more Managed rules in azure. It is mandatory to pass all the parameters in the object. However, if you do not wish to pass custom values to the following optional parameter, please pass 'null' as input.<br>Optional Arguments: <br><li>***enabled*** | <pre>list(object({<br>    type    = string<br>    version = string<br><br>    exclusion = list(object({<br>      match_variable = string<br>      operator       = string<br>      selector       = string<br>    }))<br><br>    override = list(object({<br>      rule_group_name = string<br><br>      exclusion = list(object({<br>        match_variable = string<br>        operator       = string<br>        selector       = string<br>      }))<br><br>      rule = list(object({<br>        rule_id = string<br>        action  = string<br>        enabled = bool<br><br>        exclusion = list(object({<br>          match_variable = string<br>          operator       = string<br>          selector       = string<br>        }))<br>      }))<br>    }))<br>  }))</pre> | n/a | no |
| <a name="input_mode"></a> [mode](#input\_mode) | firewall policy mode | `string` | `"Prevention"` | no |
| <a name="input_redirect_url"></a> [redirect\_url](#input\_redirect\_url) | Redirect URL | `string` | n/a | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | RG name in Azure | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | tags | `map(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_frontdoor_firewall_policy_id"></a> [frontdoor\_firewall\_policy\_id](#output\_frontdoor\_firewall\_policy\_id) | ID of the frontdoor firewall policy |
| <a name="output_frontdoor_firewall_policy_location"></a> [frontdoor\_firewall\_policy\_location](#output\_frontdoor\_firewall\_policy\_location) | location of the frontdoor firewall policy |
| <a name="output_frontend_endpoint_ids"></a> [frontend\_endpoint\_ids](#output\_frontend\_endpoint\_ids) | The Frontend Endpoints associated with this Front Door Web Application Firewall policy. |

## Module Usage

```
module "FrontdoorFirewallPolicy_module" {
  source  = "../../modules/module_frontdoor-firewall-policy"
  resource_group_name               = var.resource_group_name
  frontdoor_firewall_policy_name    = var.frontdoor_firewall_policy_name
  enabled                           = var.enabled
  mode                              = var.mode
  redirect_url                      = var.redirect_url
  custom_block_response_status_code = var.custom_block_response_status_code
  custom_block_response_body        = var.custom_block_response_body
  tags                              = var.tags
  custom_rule                       = var.custom_rule
  managed_rule                      = var.managed_rule
  
}
```
<!-- END_TF_DOCS -->