<!-- BEGIN_TF_DOCS -->
##### last updated on :28/10/2022

## Introduction

* This module helps to provision application gateway resource.

* backend_address_pool,backend_http_settings,frontend_ip_configuration,frontend_port,gateway_ip_configuration,http_listener -> these are by default required blocks . except sku block all the blocks can be created one or more times.

* Apart from above mentioned blocks other blocks are optional we can make it optional just by giving the values of arguments/variables as null.

* The host_names and host_name are mutually exclusive and cannot both be set.

* Priority is required when sku.0.tier is set to *_v2.

* backend_address_pool_name, backend_http_settings_name, redirect_configuration_name, and rewrite_rule_set_name are applicable only when rule_type is Basic.

* For ssl certificate pfx file needs to available in the path.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.28.0 |


## Resources

| Name | Type |
|------|------|
| [azurerm_application_gateway.app_gateway](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/application_gateway) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_gateway_name"></a> [app\_gateway\_name](#input\_app\_gateway\_name) | The name of the application gateway | `string` | `""` | no |
| <a name="input_authentication_certificates"></a> [authentication\_certificates](#input\_authentication\_certificates) | Authentication certificates to allow the backend with Azure Application Gateway | <pre>list(object({<br>    name = string<br>    data = string<br>  }))</pre> | `[]` | no |
| <a name="input_autoscale_configuration"></a> [autoscale\_configuration](#input\_autoscale\_configuration) | Minimum or Maximum capacity for autoscaling. Accepted values are for Minimum in the range 0 to 100 and for Maximum in the range 2 to 125. <br>It is mandatory to pass all the parameters in the object. However, if you do not wish to pass custom values to the following optional parameter, please pass 'null' as input.<br>Optional Arguments: <br><li>***max_capacity***| <pre>object({<br>    min_capacity = number<br>    max_capacity = optional(number)<br>  })</pre> | `null` | no |
| <a name="input_backend_address_pools"></a> [backend\_address\_pools](#input\_backend\_address\_pools) | List of backend address pools <br>It is mandatory to pass all the parameters in the object. However, if you do not wish to pass custom values to the following optional parameter, please pass 'null' as input.<br>Optional Arguments: <br><li>***fqdns***<br><li>***ip_addresses***| <pre>list(object({<br>    name         = string<br>    fqdns        = optional(list(string))<br>    ip_addresses = optional(list(string))<br>  }))</pre> | n/a | yes |
| <a name="input_backend_http_settings"></a> [backend\_http\_settings](#input\_backend\_http\_settings) | List of backend HTTP settings.<br>It is mandatory to pass all the parameters in the object. However, if you do not wish to pass custom values to the following optional parameter, please pass 'null' as input.<br>Optional Arguments: <br><li>***affinity_cookie_name***<br><li>***path***<br<li>***probe_name***<br><li>***host_name***<br><li>***pick_host_name_from_backend_address***<br><li>***authentication_certificate***<br><li>***trusted_root_certificate_names***<br><li>***connection_draining*** | <pre>list(object({<br>    name                                = string<br>    cookie_based_affinity               = string<br>    affinity_cookie_name                = optional(string)<br>    path                                = optional(string)<br>    enable_https                        = bool<br>    probe_name                          = optional(string)<br>    request_timeout                     = number<br>    host_name                           = optional(string)<br>    pick_host_name_from_backend_address = optional(bool)<br>    authentication_certificate = optional(object({<br>      name = string<br>    }))<br>    trusted_root_certificate_names = optional(list(string))<br>    connection_draining = optional(object({<br>      enable_connection_draining = bool<br>      drain_timeout_sec          = number<br>    }))<br>  }))</pre> | n/a | yes |
| <a name="input_custom_error_configuration"></a> [custom\_error\_configuration](#input\_custom\_error\_configuration) | Global level custom error configuration for application gateway | `list(map(string))` | `[]` | no |
| <a name="input_enable_http2"></a> [enable\_http2](#input\_enable\_http2) | Is HTTP2 enabled on the application gateway resource? | `bool` | `false` | no |
| <a name="input_firewall_policy_id"></a> [firewall\_policy\_id](#input\_firewall\_policy\_id) | (Optional)The ID of the Web Application Firewall Policy which can be associated with app gateway | `any` | `null` | no |
| <a name="input_frontend_ip_configuration"></a> [frontend\_ip\_configuration](#input\_frontend\_ip\_configuration) | frontend ip config block can be created one or more times | `map(map(string))` | `null` | no |
| <a name="input_frontend_port"></a> [frontend\_port](#input\_frontend\_port) | frontend port block -one or more can be created | <pre>list(object({<br>    //name=string<br>    port=number<br>  }))</pre> | `[]` | no |
| <a name="input_gateway_ip_configuration"></a> [gateway\_ip\_configuration](#input\_gateway\_ip\_configuration) | One or more gateway\_ip\_configuration blocks can be defined | `map(map(string))` | `null` | no |
| <a name="input_health_probes"></a> [health\_probes](#input\_health\_probes) | List of Health probes used to test backend pools health.<br>It is mandatory to pass all the parameters in the object. However, if you do not wish to pass custom values to the following optional parameter, please pass 'null' as input.<br>Optional Arguments: <br><li>***port***<br><li>***pick_host_name_from_backend_http_settings***<br><li>***minimum_servers***<br><li>***match***| <pre>list(object({<br>    name                                      = string<br>    host                                      = string<br>    interval                                  = number<br>    path                                      = string<br>    timeout                                   = number<br>    unhealthy_threshold                       = number<br>    port                                      = optional(number)<br>    pick_host_name_from_backend_http_settings = optional(bool)<br>    minimum_servers                           = optional(number)<br>    match = optional(object({<br>      body        = optional(string)<br>      status_code = optional(list(string))<br>    }))<br>  }))</pre> | `[]` | no |
| <a name="input_http_listeners"></a> [http\_listeners](#input\_http\_listeners) | List of HTTP/HTTPS listeners. SSL Certificate name is required.<br>It is mandatory to pass all the parameters in the object. However, if you do not wish to pass custom values to the following optional parameter, please pass 'null' as input<br>Optional Arguments: <br><li>***host_name***<br><li>***host_names***<br><li>***require_sni***<br><li>***ssl_certificate_name***<br><li>***firewall_policy_id***<br><li>***ssl_profile_name***<br><li>***custom_error_configuration***|    <pre>list(object({<br>    name                 = string<br>    //frontend_ip_configuration_name = string<br>    //frontend_port_name  = string<br>    host_name            = optional(string)<br>    host_names           = optional(list(string))<br>    require_sni          = optional(bool)<br>    ssl_certificate_name = optional(string)<br>    firewall_policy_id   = optional(string)<br>    ssl_profile_name     = optional(string)<br>    custom_error_configuration = optional(list(object({<br>      status_code           = string<br>      custom_error_page_url = string<br>    })))<br>  }))</pre> | n/a | yes |
| <a name="input_identity_ids"></a> [identity\_ids](#input\_identity\_ids) | Specifies a list with a single user managed identity id to be assigned to the Application Gateway | `list(string)` | `null` | no |
| <a name="input_identity_type"></a> [identity\_type](#input\_identity\_type) | Specifies the type of Managed Service Identity that should be configured on this Application Gateway. Only possible value is UserAssigned. | `string` | `null` | no |
| <a name="input_location"></a> [location](#input\_location) | The location/region to keep all your network resources. To get the list of all locations with table format from azure cli, run 'az account list-locations -o table' | `string` | `""` | no |
| <a name="input_redirect_configuration"></a> [redirect\_configuration](#input\_redirect\_configuration) | list of maps for redirect configurations | `list(map(string))` | `[]` | no |
| <a name="input_request_routing_rules"></a> [request\_routing\_rules](#input\_request\_routing\_rules) | List of Request routing rules to be used for listeners.<br>It is mandatory to pass all the parameters in the object. However, if you do not wish to pass custom values to the following optional parameter, please pass 'null' as input<br>Optional Arguments: <br><li>***priority***<br><li>***backend_address_pool_name***<br><li>***backend_http_settings_name***<br><li>***redirect_configuration_name***<br><li>***rewrite_rule_set_name***<br><li>***url_path_map_name*** | <pre>list(object({<br>    name                        = string<br>    rule_type                   = string<br>    http_listener_name          = string<br>    backend_address_pool_name   = optional(string)<br>    backend_http_settings_name  = optional(string)<br>    redirect_configuration_name = optional(string)<br>    rewrite_rule_set_name       = optional(string)<br>    url_path_map_name           = optional(string)<br>  }))</pre> | `[]` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | A container that holds related resources for an Azure solution | `string` | `""` | no |
| <a name="input_rewrite_rule_set"></a> [rewrite\_rule\_set](#input\_rewrite\_rule\_set) | List of rewrite rule set including rewrite rules | `any` | `[]` | no |
| <a name="input_sku"></a> [sku](#input\_sku) | The sku pricing model of v1 and v2 | <pre>object({<br>    name     = string<br>    tier     = string<br>    capacity = optional(number)<br>  })</pre> | n/a | yes |
| <a name="input_ssl_certificates"></a> [ssl\_certificates](#input\_ssl\_certificates) | List of SSL certificates data for Application gateway<br>It is mandatory to pass all the parameters in the object. However, if you do not wish to pass custom values to the following optional parameter, please pass 'null' as input<br>Optional Arguments: <br><li>***data***<br><li>***password***<br><li>***key_vault_secret_id*** | <pre>list(object({<br>    name                = string<br>    data                = optional(string)<br>    password            = optional(string)<br>    key_vault_secret_id = optional(string)<br>  }))</pre> | `[]` | no |
| <a name="input_ssl_policy"></a> [ssl\_policy](#input\_ssl\_policy) | Application Gateway SSL configuration <br>It is mandatory to pass all the parameters in the object. However, if you do not wish to pass custom values to the following optional parameter, please pass 'null' as input<br>Optional Arguments: <br><li>***disabled_protocols***<br><li>***policy_type***<br><li>***policy_name***<br><li>***cipher_suites***<br><li>***min_protocol_version*** | <pre>object({<br>    disabled_protocols   = optional(list(string))<br>    policy_type          = optional(string)<br>    policy_name          = optional(string)<br>    cipher_suites        = optional(list(string))<br>    min_protocol_version = optional(string)<br>  })</pre> | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to all resources | `map(string)` | `{}` | no |
| <a name="input_trusted_root_certificates"></a> [trusted\_root\_certificates](#input\_trusted\_root\_certificates) | Trusted root certificates to allow the backend with Azure Application Gateway | <pre>list(object({<br>    name = string<br>    data = string<br>  }))</pre> | `[]` | no |
| <a name="input_url_path_maps"></a> [url\_path\_maps](#input\_url\_path\_maps) | List of URL path maps associated to path-based rules.<br>It is mandatory to pass all the parameters in the object. However, if you do not wish to pass custom values to the following optional parameter, please pass 'null' as input.

<br>Optional Arguments: <br><li>***default_backend_http_settings_name***<br><li>***default_backend_address_pool_name***<br><li>***default_redirect_configuration_name***<br><li>***default_rewrite_rule_set_name***<br><li>***backend_address_pool_name***<br><li>***backend_http_settings_name***<br><li>***redirect_configuration_name***<br><li>***rewrite_rule_set_name***<br><li>***firewall_policy_id***<br><li>***default_redirect_configuration_name***<br><li>***default_rewrite_rule_set_name***     | <pre>list(object({<br>    name                                = string<br>    default_backend_http_settings_name  = optional(string)<br>    default_backend_address_pool_name   = optional(string)<br>    default_redirect_configuration_name = optional(string)<br>    default_rewrite_rule_set_name       = optional(string)<br>    path_rules = list(object({<br>      name                        = string<br>      backend_address_pool_name   = optional(string)<br>      backend_http_settings_name  = optional(string)<br>      paths                       = list(string)<br>      redirect_configuration_name = optional(string)<br>      rewrite_rule_set_name       = optional(string)<br>      firewall_policy_id          = optional(string)<br>    }))<br>  }))</pre> | `[]` | no |
| <a name="input_waf_configuration"></a> [waf\_configuration](#input\_waf\_configuration) | Web Application Firewall support for your Azure Application Gateway<br>It is mandatory to pass all the parameters in the object. However, if you do not wish to pass custom values to the following optional parameter, please pass 'null' as input.<br>Optional Arguments: <br><li>***file_upload_limit_mb***<br><li>***request_body_check***<br><li>***max_request_body_size_kb***<br><li>***disabled_rule_group***<br><li>***rules***<br><li>***exclusion***<br><li>***selector_match_operator***<br><li>***selector***|<pre>object({<br>    enabled                  = bool<br>    firewall_mode            = string<br>    rule_set_version         = string<br>    file_upload_limit_mb     = optional(number)<br>    request_body_check       = optional(bool)<br>    max_request_body_size_kb = optional(number)<br>    disabled_rule_group = optional(list(object({<br>      rule_group_name = string<br>      rules           = optional(list(string))<br>    })))<br>    exclusion = optional(list(object({<br>      match_variable          = string<br>      selector_match_operator = optional(string)<br>      selector                = optional(string)<br>    })))<br>  })</pre> | `null` | no |
| <a name="input_zones"></a> [zones](#input\_zones) | A collection of availability zones to spread the Application Gateway over. | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_resource_id"></a> [resource\_id](#output\_resource\_id) | The resource ID of the MySQL Server |

## Module Usage

```
module "app_gateway" {

  source = "../../modules/module_applicationgateway/application_gateway"

  resource_group_name         = var.resource_group_name
  location                    = var.location
  app_gateway_name            = var.app_gateway_name
  enable_http2                = var.enable_http2
  zones                       = var.zones
  firewall_policy_id          = var.firewall_policy_id
  sku                         = var.sku
  autoscale_configuration     = var.autoscale_configuration
  gateway_ip_configuration    = var.gateway_ip_configuration
  frontend_ip_configuration   = var.frontend_ip_configuration
  request_routing_rules       = var.request_routing_rules
  frontend_port               = var.frontend_port
  http_listeners              = var.http_listeners
  backend_http_settings       = var.backend_http_settings
  backend_address_pools       = var.backend_address_pools
  identity_type               = var.identity_type
  identity_ids                = var.identity_ids
  authentication_certificates = var.authentication_certificates
  trusted_root_certificates   = var.trusted_root_certificates
  ssl_policy                  = var.ssl_policy
  ssl_certificates            = var.ssl_certificates
  health_probes               = var.health_probes
  url_path_maps               = var.url_path_maps
  redirect_configuration      = var.redirect_configuration
  custom_error_configuration  = var.custom_error_configuration
  rewrite_rule_set            = var.rewrite_rule_set
  waf_configuration           = var.waf_configuration
  tags                        = var.tags
 
}

```
<!-- END_TF_DOCS -->