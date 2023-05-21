<!-- BEGIN_TF_DOCS -->
###### Last Updated[DD/MM/YYYY]: 11/11/2022
## Introduction

Manages a Linux Function App.

## File Structure 

This particular module is having the following configuration files.
- function_app.tf : This file is having the terraform code to provision the resource as per requirements.
- variables.tf : This file consists of all the variable definitions needed for the terraform code mentioned in function_app.tf
- outputs.tf : This file will be having the resource output details generated.

## Requirements

1. Resource group
2. Storage account for the function app
3. Storage account for backup
4. App insights

NOTE: 
1. Link to storage account module that could be used as part of this module: 
module folder: [https://dev.azure.com/EYFSDigitalEngineering/AzureLandingZone/_git/Azure_CIL?path=/modules/module_storage-account&version=GBdevelop&_a=contents] 
project folder: [https://dev.azure.com/EYFSDigitalEngineering/AzureLandingZone/_git/Azure_CIL?path=/projects/create_storage-account&version=GBdevelop&_a=contents])

2. Link to app insights module that could be used as part of this module: 
module folder: [https://dev.azure.com/EYFSDigitalEngineering/AzureLandingZone/_git/Azure_CIL?path=/modules/module_application-insights-creation&version=GBdevelop&_a=contents]
project folder: [https://dev.azure.com/EYFSDigitalEngineering/AzureLandingZone/_git/Azure_CIL?path=/projects/create_application-insights&version=GBdevelop&_a=contents]

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.28.0 |

## Resources

| Name | Type |
|------|------|
| [azurerm_app_service_plan.app_service_plan](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/app_service_plan) | resource |
| [azurerm_linux_function_app.linux_function_app](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_function_app) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_service_id"></a> [app\_service\_id](#input\_app\_service\_id) | The ID of the App Service Plan within which to create this Function App. | `string` | n/a | yes |
| <a name="input_app_settings"></a> [app\_settings](#input\_app\_settings) | A map of key-value pairs for App Settings and custom values. | `map(any)` | n/a | no |
| <a name="input_auth_settings_config"></a> [auth\_settings\_config](#input\_auth\_settings\_config) | Authentication settings for the function app. It is mandatory to pass all the arguments in the object. However, if you do not wish to pass custom values to the following optional parameters, please pass 'null' as input. <br>Optional Arguments<br> <li><b><i>active_directory</i></b></li> <li><b><i>additional_login_parameters</i></b></li> <li><b><i>allowed_external_redirect_urls</i></b></li> <li><b><i>default_provider</i></b></li> <li><b><i>facebook</i></b></li>- <li><b><i>google</i></b></li> <li><b><i>github</i></b></li> <li><b><i>microsoft</i></b></li> <li><b><i>twitter</i></b></li> <li><b><i>issuer</i></b></li> <li><b><i>runtime_version</i></b></li> <li><b><i>token_refresh_extension_hours</i></b></li> <li><b><i>token_store_enabled</i></b></li> <li><b><i>unauthenticated_client_action</i></b></li> | <pre>list(object({<br>    enabled                        = bool<br>    additional_login_parameters    = map(string)<br>    allowed_external_redirect_urls = list(string)<br>    default_provider               = string<br>    facebook = list(object({<br>      app_id       = string<br>      app_secret   = string<br>      oauth_scopes = list(string)<br>    }))<br>    google = list(object({<br>      client_id     = string<br>      client_secret = string<br>      oauth_scopes  = list(string)<br>    }))<br>    github = list(object({<br>      client_id     = string<br>      client_secret = string<br>      oauth_scopes  = list(string)<br>    }))<br>    microsoft = list(object({<br>      client_id     = string<br>      client_secret = string<br>      oauth_scopes  = list(string)<br>    }))<br>    twitter = list(object({<br>      consumer_key    = string<br>      consumer_secret = string<br>    }))<br>    issuer                        = string<br>    runtime_version               = string<br>    token_refresh_extension_hours = number<br>    token_store_enabled           = bool<br>    unauthenticated_client_action = string<br>    active_directory = list(object({<br>      client_id         = string<br>      client_secret     = string<br>      allowed_audiences = list(string)<br>    }))<br>  }))</pre> | n/a | no |
| <a name="input_facebook"></a> [facebook](#input\_facebook) | Facebook settings if default provider is Facebook when using multiple providers. It is mandatory to pass all the arguments in the object. However, if you do not wish to pass custom values to the following optional parameters, please pass 'null' as input. <br>Optional Arguments<br> <li><b><i>app_secret</i></b></li> <li><b><i>oauth_scopes</i></b></li> | <pre>list(object({<br>      app_id     = string<br>      app_secret     = string<br>      oauth_scopes     = list(string)}))</pre> | n/a | no |
| <a name="input_google"></a> [google](#input\_google) | Google settings if default provider is Google when using multiple providers. It is mandatory to pass all the arguments in the object. However, if you do not wish to pass custom values to the following optional parameters, please pass 'null' as input. <br>Optional Arguments<br> <li><b><i>client_secret</i></b></li> <li><b><i>oauth_scopes</i></b></li> | <pre>list(object({<br>      client_id     = string<br>      client_secret     = string<br>      oauth_scopes     = list(string)}))</pre> | n/a | no |
| <a name="input_github"></a> [github](#input\_github) | Github settings if default provider is Github when using multiple providers. It is mandatory to pass all the arguments in the object. However, if you do not wish to pass custom values to the following optional parameters, please pass 'null' as input. <br>Optional Arguments<br> <li><b><i>client_secret</i></b></li> <li><b><i>oauth_scopes</i></b></li> | <pre>list(object({<br>      client_id     = string<br>      client_secret     = string<br>      oauth_scopes     = list(string)}))</pre> | n/a | no |
| <a name="input_microsoft"></a> [microsoft](#input\_microsoft) | Microsoft settings if default provider is Microsoft when using multiple providers. It is mandatory to pass all the arguments in the object. However, if you do not wish to pass custom values to the following optional parameters, please pass 'null' as input. <br>Optional Arguments<br> <li><b><i>client_secret</i></b></li> <li><b><i>oauth_scopes</i></b></li> | <pre>list(object({<br>      client_id     = string<br>      client_secret     = string<br>      oauth_scopes     = list(string)}))</pre> | n/a | no |
| <a name="input_twitter"></a> [twitter](#input\_twitter) | Twitter settings if default provider is Twitter when using multiple providers. It is mandatory to pass all the arguments in the object. However, if you do not wish to pass custom values to the following optional parameters, please pass 'null' as input. <br>Optional Arguments<br> <li><b><i>consumer_secret</i></b></li> | <pre>list(object({<br>      consumer_key     = string<br>      consumer_secret     = string}))</pre> | n/a | no |
| <a name="input_active_directory"></a> [active_directory](#input\_active\_directory) | Active directory settings for AD authentication. It is mandatory to pass all the arguments in the object. However, if you do not wish to pass custom values to the following optional parameters, please pass 'null' as input. <br>Optional Arguments<br> <li><b><i>allowed_audiences</i></b></li> <li><b><i>client_secret</i></b></li> | <pre>list(object({<br>      client_id     = string<br>      client_secret     = string<br>      allowed_audiences     = list(string)}))</pre> | n/a | no |
| <a name="input_backup_config"></a> [backup\_config](#input\_backup\_config) | Backup settings for the function app. It is mandatory to pass all the arguments in the object. However, if you do not wish to pass custom values to the following optional parameters, please pass 'null' as input. <br>Optional Arguments<br> <li><b><i>enabled</i></b></li> | <pre>list(object({<br>    name = string<br>    schedule = list(object({<br>      frequency_interval       = number<br>      frequency_unit           = string<br>      keep_at_least_one_backup = bool<br>      retention_period_days    = number<br>      start_time               = string<br>    }))<br>    storage_account_url = string<br>    enabled             = bool<br>  }))</pre> | n/a | no |
| <a name="input_client_certificate_exclusion_paths"></a> [client\_certificate\_exclusion\_paths](#input\_client\_certificate\_exclusion\_paths) | Paths to exclude when using client certificates, separated by ; | `string` | n/a | no |
| <a name="input_client_certificate_mode"></a> [client\_certificate\_mode](#input\_client\_certificate\_mode) | The mode of the Function App's client certificates requirement for incoming requests. Possible values are Required, Optional, and OptionalInteractiveUser. | `string` | n/a | no |
| <a name="input_connection_string_config"></a> [connection\_string\_config](#input\_connection\_string\_config) | Connection string settings for the function app. It is mandatory to pass all the arguments in the object. | <pre>list(object({<br>    name  = string<br>    type  = string<br>    value = string<br>  }))</pre> | n/a | no |
| <a name="input_content_share_force_disabled"></a> [content\_share\_force\_disabled](#input\_content\_share\_force\_disabled) | Should the settings for linking the Function App to storage be suppressed. | `bool` | `false` | no |
| <a name="input_daily_memory_time_quota"></a> [daily\_memory\_time\_quota](#input\_daily\_memory\_time\_quota) | The amount of memory in gigabyte-seconds that your application is allowed to consume per day. Setting this value only affects function apps under the consumption plan. | `number` | `0` | no |
| <a name="input_enable_builtin_logging"></a> [enable\_builtin\_logging](#input\_enable\_builtin\_logging) | Should built in logging be enabled. Configures AzureWebJobsDashboard app setting based on the configured storage setting. | `bool` | n/a | no |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Is the Function App enabled? | `bool` | n/a | no |
| <a name="input_function_app_name"></a> [function\_app\_name](#input\_function\_app\_name) | Name of the Function App | `string` | n/a | yes |
| <a name="input_functions_extension_version"></a> [functions\_extension\_version](#input\_functions\_extension\_version) | The runtime version associated with the Function App. | `string` | `~4` | no |
| <a name="input_https_only"></a> [https\_only](#input\_https\_only) | Can the Function App only be accessed via HTTPS? | `bool` | `false` | no |
| <a name="input_identity_config"></a> [identity\_config](#input\_identity\_config) | Identity settings for the function app. It is mandatory to pass all the arguments in the object. However, if you do not wish to pass custom values to the following optional parameters, please pass 'null' as input. <br>Optional Arguments<br> <li><b><i>identity_ids</i></b></li> | <pre>list(object({<br>    type         = string<br>    identity_ids = list(string)<br>  }))</pre> | n/a | no |
| <a name="input_key_vault_reference_identity_id"></a> [key\_vault\_reference\_identity\_id](#input\_key\_vault\_reference\_identity\_id) | The User Assigned Identity ID used for accessing KeyVault secrets. The identity must be assigned to the application in the identity block. | `string` | n/a | no |
| <a name="input_location"></a> [location](#input\_location) | Location of the Function App | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Name of the resource group | `string` | n/a | yes |
| <a name="input_site_config_config"></a> [site\_config\_config](#input\_site\_config\_config) | Site configuration settings for the function app. It is mandatory to pass all the arguments in the object. However, if you do not wish to pass custom values to the following optional parameters, please pass 'null' as input. <br>Optional Arguments<br> <li><b><i>always_on</i></b></li> <li><b><i>api_definition_url</i></b></li> <li><b><i>api_management_api_id</i></b></li> <li><b><i></i>app_command_line</b></li> <li><b><i>app_scale_limit</i></b></li> <li><b><i>application_insights_connection_string</i></b></li> <li><b><i>application_insights_key</i></b></li> <li><b><i>application_stack</i></b></li> <li><b><i></i>app_service_logs</b></li>  <li><b><i>container_registry_use_managed_identity</i></b></li> <li><b><i>cors</i></b></li>  <li><b><i>default_documents</i></b></li> <li><b><i>elastic_instance_minimum</i></b></li> <li><b><i>ftps_state</i></b></li> <li><b><i>health_check_path</i></b></li> <li><b><i>health_check_eviction_time_in_min</i></b></li> <li><b><i>http2_enabled</i></b></li> <li><b><i>ip_restriction</i></b></li> <li><b><i>load_balancing_mode</i></b></li> <li><b><i>managed_pipeline_mode</i></b></li> <li><b><i>minimum_tls_version</i></b></li> <li><b><i>pre_warmed_instance_count</i></b></li> <li><b><i>remote_debugging_enabled</i></b></li> <li><b><i>remote_debugging_version</i></b></li> <li><b><i>runtime_scale_monitoring_enabled</i></b></li> <li><b><i>scm_minimum_tls_version</i></b></li> <li><b><i>scm_use_main_ip_restriction</i></b></li> <li><b><i>use_32_bit_worker</i></b></li> <li><b><i>vnet_route_all_enabled</i></b></li> <li><b><i>websockets_enabled</i></b></li> <li><b><i>worker_count</i></b></li> <br> | <pre>list(object({<br>    always_on                              = bool<br>    api_definition_url                     = string<br>    api_management_api_id                  = string<br>    app_command_line                       = string<br>    application_insights_connection_string = string<br>    application_insights_key               = string<br>    app_scale_limit                        = number<br>    application_stack = list(object({<br>      dotnet_version = string<br>    }))<br>    app_service_logs = list(object({<br>      disk_quota_mb         = number<br>      retention_period_days = number<br>    }))<br>    container_registry_managed_identity_client_id = string<br>    container_registry_use_managed_identity       = bool<br>    default_documents                             = list(string)<br>    cors = list(object({<br>      allowed_origins     = list(string)<br>      support_credentials = bool<br>    }))<br>    elastic_instance_minimum          = number<br>    ftps_state                        = string<br>    health_check_path                 = string<br>    health_check_eviction_time_in_min = number<br>    http2_enabled                     = bool<br>    ip_restriction = list(object({<br>      ip_address                = string<br>      service_tag               = string<br>      virtual_network_subnet_id = string<br>      name                      = string<br>      priority                  = number<br>      action                    = string<br>      headers = list(object({<br>        x_azure_fdid      = list(string)<br>        x_fd_health_probe = list(string)<br>        x_forwarded_for   = list(string)<br>        x_forwarded_host  = list(string)<br>      }))<br>    }))<br>    load_balancing_mode              = string<br>    managed_pipeline_mode            = string<br>    minimum_tls_version              = string<br>    pre_warmed_instance_count        = number<br>    remote_debugging_enabled         = bool<br>    remote_debugging_version         = string<br>    runtime_scale_monitoring_enabled = bool<br>    scm_ip_restriction = list(object({<br>      ip_address                = string<br>      service_tag               = string<br>      virtual_network_subnet_id = string<br>      name                      = string<br>      priority                  = number<br>      action                    = string<br>      headers = list(object({<br>        x_azure_fdid      = list(string)<br>        x_fd_health_probe = list(string)<br>        x_forwarded_for   = list(string)<br>        x_forwarded_host  = list(string)<br>      }))<br>    }))<br>    scm_minimum_tls_version     = string<br>    scm_use_main_ip_restriction = bool<br>    use_32_bit_worker           = bool<br>    vnet_route_all_enabled      = bool<br>    websockets_enabled          = bool<br>    worker_count                = number<br>  }))</pre> | n/a | yes |
| <a name="input_application_stack"></a> [application\_stack](#input\_application\_stack) | The runtime stack to use for the function app. Out of all the optional arguments, only one should be set(here, dotnet_version has been used).  It is mandatory to pass the selected argument in the object. However, if you do not wish to pass custom values to the following optional parameters, please pass 'null' as input. <br>Optional Arguments<br> <li><b><i>dotnet_version</i></b></li> <li><b><i>use_dotnet_isolated_runtime</i></b></li> <li><b><i>java_version</i></b></li> <li><b><i>node_version</i></b></li> <li><b><i>python_version</i></b></li> <li><b><i>powershell_core_version</i></b></li> <li><b><i>use_custom_runtime</i></b></li><br> | <pre>list(object({<pre>    docker     = list(object({<br>      registry_url = string<br>      image_name = string<br>      image_tag = string<br>      registry_username = string<br>      registry_password = string<br>  }))</pre>  <br>      dotnet_version     = string <br>      use_dotnet_isolated_runtime     = bool <br>      java_version     = string <br>      node_version     = string <br>      python_version     = string <br>      powershell_core_version     = string <br>      use_custom_runtime     = bool<br>  }))</pre> | n/a | no |
| <a name="input_docker"></a> [docker](#input\_docker) | Docker configuration settings for the application stack if docker is used as runtime. It is mandatory to pass all the arguments in the object. However, if you do not wish to pass custom values to the following optional parameters, please pass 'null' as input. <br>Optional Arguments<br> <li><b><i>registry_username</i></b></li> | <pre>list(object({<br>      registry_url = string<br>      image_name = string<br>      image_tag = string<br>      registry_username = string<br>      registry_password = string<br>  }))</pre> | n/a | no |
| <a name="input_app_service_logs"></a> [app\_service\_logs](#input\_app\_service\_logs) | Application service logs settings. It is mandatory to pass all the arguments in the object. However, if you do not wish to pass custom values to the following optional parameters, please pass 'null' as input. <br>Optional Arguments<br> <li><b><i>retention_period_days</i></b></li> | <pre>list(object({<br>      disk_quota_mb = number<br>      retention_period_days = number<br>  }))</pre> | n/a | no |
| <a name="input_cors"></a> [cors](#input\_cors) |  Settings for cross-origin calls. It is mandatory to pass all the arguments in the object. However, if you do not wish to pass custom values to the following optional parameters, please pass 'null' as input. <br>Optional Arguments<br> <li><b><i>support_credential_or_not</i></b></li><br> | <pre>list(object({<br>      allowed_origin = list(string)<br>      support_credential_or_not = bool<br>    }))</pre> | n/a | no |
| <a name="input_ip_restriction"></a> [ip\_restriction](#input\_ip\_restriction) | IP restriction block. It is mandatory to pass all the arguments in the object. However, if you do not wish to pass custom values to the following optional parameters, please pass 'null' as input. One and only one of ip_address, service_tag or virtual_network_subnet_id must be specified. <br>Optional Arguments<br> <li><b><i>action</i></b></li> <li><b><i>headers</i></b></li> <li><b><i>ip_address</i></b></li> <li><b><i>name</i></b></li> <li><b><i>priority</i></b></li> <li><b><i>service_tag</i></b></li> <li><b><i>virtual_network_subnet_id</i></b></li> | <pre>list(object({<br>      action = string<br>      headers = list(object({<br>      x_azure_fdid = list(string)<br>      x_fd_health_probe = bool<br>      x_forwarded_for = list(string)<br>      x_forwarded_host = list(string)<br>}))<br>      ip_address = string<br>      name = string<br>      priority = number<br>      service_tag = string<br>      virtual_network_subnet_id = string<br>}))</pre> | n/a | no |
| <a name="input_scm_ip_restriction"></a> [scm\_ip\_restriction](#input\_scm\_ip\_restriction) | SCM IP restriction block. It is mandatory to pass all the arguments in the object. However, if you do not wish to pass custom values to the following optional parameters, please pass 'null' as input. One and only one of ip_address, service_tag or virtual_network_subnet_id must be specified. <br>Optional Arguments<br> <li><b><i>action</i></b></li> <li><b><i>headers</i></b></li> <li><b><i>ip_address</i></b></li> <li><b><i>name</i></b></li> <li><b><i>priority</i></b></li> <li><b><i>service_tag</i></b></li> <li><b><i>virtual_network_subnet_id</i></b></li> | <pre>list(object({<br>      action = string<br>      headers = list(object({<br>      x_azure_fdid = list(string)<br>      x_fd_health_probe = bool<br>      x_forwarded_for = list(string)<br>      x_forwarded_host = list(string)<br>}))<br>      ip_address = string<br>      name = string<br>      priority = number<br>      service_tag = string<br>      virtual_network_subnet_id = string<br>}))</pre> | n/a | no |
| <a name="input_headers"></a> [headers](#input\_headers) | Headers to restrict access. It is mandatory to pass all the arguments in the object. However, if you do not wish to pass custom values to the following optional parameters, please pass 'null' as input.  <br>Optional Arguments<br> <li><b><i>x_azure_fdid</i></b></li> <li><b><i>x_fd_health_probe</i></b></li> <li><b><i>x_forwarded_for</i></b></li> <li><b><i>x_forwarded_host</i></b></li> | <pre>list(object({<br>      x_azure_fdid = list(string)<br>      x_fd_health_probe = bool<br>      x_forwarded_for = list(string)<br>      x_forwarded_host = list(string)<br>}))</pre> | n/a | no |
| <a name="input_sticky_settings_config"></a> [sticky\_settings\_config](#input\_sticky\_settings\_config) | Sticky settings for the function app. It is mandatory to pass all the arguments in the object. However, if you do not wish to pass custom values to the following optional parameters, please pass 'null' as input. <br>Optional Arguments<br> <li><b><i>app_setting_names</i></b></li> <li><b><i>connection_string_names</i></b></li> | <pre>list(object({<br>    app_setting_names       = list(string)<br>    connection_string_names = list(string)<br>  }))</pre> | n/a | no |
| <a name="input_storage_account_access_key"></a> [storage\_account\_access\_key](#input\_storage\_account\_access\_key) | The access key which will be used to access the backend storage account for the Function App. | `string` | n/a | no |
| <a name="input_storage_account_name"></a> [storage\_account\_name](#input\_storage\_account\_name) | The backend storage account name which will be used by this Function App. | `string` | n/a | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags which should be assigned to the Linux Function App. | `map(any)` | n/a | no |
| <a name="input_virtual_network_subnet_id"></a> [virtual\_network\_subnet\_id](#input\_virtual\_network\_subnet\_id) | The subnet id which will be used by this Function App for regional virtual network integration. | `string` | n/a | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_funtion_app_custom_domain_verification_id"></a> [funtion\_app\_custom\_domain\_verification\_id](#output\_funtion\_app\_custom\_domain\_verification\_id) | The identifier used by App Service to perform domain ownership verification via DNS TXT record. |
| <a name="output_funtion_app_default_hostname"></a> [funtion\_app\_default\_hostname](#output\_funtion\_app\_default\_hostname) | The default hostname of the Linux Function App. |
| <a name="output_funtion_app_id"></a> [funtion\_app\_id](#output\_funtion\_app\_id) | The ID of the Linux Function App. |
| <a name="output_funtion_app_identity_principal_id"></a> [funtion\_app\_identity\_principal\_id](#output\_funtion\_app\_identity\_principal\_id) | The Principal ID associated with this Managed Service Identity. |
| <a name="output_funtion_app_identity_tenant_id"></a> [funtion\_app\_identity\_tenant\_id](#output\_funtion\_app\_identity\_tenant\_id) | The Tenant ID associated with this Managed Service Identity. |
| <a name="output_funtion_app_kind"></a> [funtion\_app\_kind](#output\_funtion\_app\_kind) | The Kind value for this Linux Function App |
| <a name="output_funtion_app_outbound_ip_address_list"></a> [funtion\_app\_outbound\_ip\_address\_list](#output\_funtion\_app\_outbound\_ip\_address\_list) | A list of outbound IP addresses. |
| <a name="output_funtion_app_outbound_ip_addresses"></a> [funtion\_app\_outbound\_ip\_addresses](#output\_funtion\_app\_outbound\_ip\_addresses) | A comma separated list of outbound IP addresses as a string. |
| <a name="output_funtion_app_possible_outbound_ip_address_list"></a> [funtion\_app\_possible\_outbound\_ip\_address\_list](#output\_funtion\_app\_possible\_outbound\_ip\_address\_list) | A comma separated list of possible outbound IP addresses as a string. |
| <a name="output_funtion_app_site_credential_password"></a> [funtion\_app\_site\_credential\_password](#output\_funtion\_app\_site\_credential\_password) | The Site Credentials Password used for publishing. |
| <a name="output_funtion_app_site_credential_username"></a> [funtion\_app\_site\_credential\_username](#output\_funtion\_app\_site\_credential\_username) | The Site Credentials Username used for publishing. |

## Module Usage

```
module "function_app_module" {
  source = "../../modules/module_functionapp_linux"

  asp_name     = var.asp_name
  asp_kind     = var.asp_kind
  asp_reserved = var.asp_reserved
  asp_sku_tier = var.asp_sku_tier
  asp_sku_size = var.asp_sku_size

  function_app_name   = var.function_app_name
  location            = var.location
  resource_group_name = var.resource_group_name
  app_settings        = var.app_settings
  auth_settings_config = [{
    enabled                        = var.auth_settings_config.0.enabled
    additional_login_parameters    = var.auth_settings_config.0.additional_login_parameters
    allowed_external_redirect_urls = var.auth_settings_config.0.allowed_external_redirect_urls
    default_provider               = var.auth_settings_config.0.default_provider
    facebook = [{
      app_id       = var.auth_settings_config.0.facebook.0.app_id
      app_secret   = var.auth_settings_config.0.facebook.0.app_secret
      oauth_scopes = var.auth_settings_config.0.facebook.0.oauth_scopes
    }]
    github = [{
      client_id     = var.auth_settings_config.0.github.0.client_id
      client_secret = var.auth_settings_config.0.github.0.client_secret
      oauth_scopes  = var.auth_settings_config.0.github.0.oauth_scopes
    }]
    google = [{
      client_id     = var.auth_settings_config.0.google.0.client_id
      client_secret = var.auth_settings_config.0.google.0.client_secret
      oauth_scopes  = var.auth_settings_config.0.google.0.oauth_scopes
    }]
    microsoft = [{
      client_id     = var.auth_settings_config.0.microsoft.0.client_id
      client_secret = var.auth_settings_config.0.microsoft.0.client_secret
      oauth_scopes  = var.auth_settings_config.0.microsoft.0.oauth_scopes
    }]
    twitter = [{
      consumer_key    = var.auth_settings_config.0.twitter.0.consumer_key
      consumer_secret = var.auth_settings_config.0.twitter.0.consumer_secret
    }]
    issuer                        = var.auth_settings_config.0.issuer
    runtime_version               = var.auth_settings_config.0.runtime_version
    token_refresh_extension_hours = var.auth_settings_config.0.token_refresh_extension_hours
    token_store_enabled           = var.auth_settings_config.0.token_store_enabled
    unauthenticated_client_action = var.auth_settings_config.0.unauthenticated_client_action

    active_directory = [{
      client_id         = var.auth_settings_config.0.active_directory.0.client_id
      client_secret     = var.auth_settings_config.0.active_directory.0.client_secret
      allowed_audiences = var.auth_settings_config.0.active_directory.0.allowed_audiences
    }]
  }]
  connection_string_config = [{
    name  = var.connection_string_config.0.name
    type  = var.connection_string_config.0.type
    value = var.connection_string_config.0.value
  }]
  client_certificate_enabled         = var.client_certificate_enabled
  client_certificate_mode            = var.client_certificate_mode
  client_certificate_exclusion_paths = var.client_certificate_exclusion_paths
  daily_memory_time_quota            = var.daily_memory_time_quota
  enabled                            = var.enabled
  content_share_force_disabled       = var.content_share_force_disabled
  functions_extension_version        = var.functions_extension_version
  enable_builtin_logging             = var.enable_builtin_logging
  https_only                         = var.https_only
  identity_config = [{
    type         = var.identity_config.0.type
    identity_ids = var.identity_config.0.identity_ids
  }]

  key_vault_reference_identity_id = var.key_vault_reference_identity_id
  site_config_config = [{
    always_on                              = var.site_config_config.0.always_on
    api_definition_url                     = var.site_config_config.0.api_definition_url
    api_management_api_id                  = var.site_config_config.0.api_management_api_id
    app_command_line                       = var.site_config_config.0.app_command_line
    application_insights_connection_string = var.site_config_config.0.application_insights_connection_string
    application_insights_key               = var.site_config_config.0.application_insights_key
    app_scale_limit                        = var.site_config_config.0.app_scale_limit
    application_stack = [{
      dotnet_version = var.site_config_config.0.application_stack.0.dotnet_version
    }]
    app_service_logs = [{
      disk_quota_mb         = var.site_config_config.0.app_service_logs.0.disk_quota_mb
      retention_period_days = var.site_config_config.0.app_service_logs.0.retention_period_days
    }]
    container_registry_managed_identity_client_id = var.site_config_config.0.container_registry_managed_identity_client_id
    container_registry_use_managed_identity       = var.site_config_config.0.container_registry_use_managed_identity
    default_documents                             = var.site_config_config.0.default_documents
    cors = [{
      allowed_origins     = var.site_config_config.0.cors.0.allowed_origins
      support_credentials = var.site_config_config.0.cors.0.support_credentials
    }]
    elastic_instance_minimum          = var.site_config_config.0.elastic_instance_minimum
    ftps_state                        = var.site_config_config.0.ftps_state
    health_check_path                 = var.site_config_config.0.health_check_path
    health_check_eviction_time_in_min = var.site_config_config.0.health_check_eviction_time_in_min
    http2_enabled                     = var.site_config_config.0.http2_enabled
    ip_restriction = [{
      ip_address                = var.site_config_config.0.ip_restriction.0.ip_address
      service_tag               = var.site_config_config.0.ip_restriction.0.service_tag
      virtual_network_subnet_id = var.site_config_config.0.ip_restriction.0.virtual_network_subnet_id
      name                      = var.site_config_config.0.ip_restriction.0.name
      priority                  = var.site_config_config.0.ip_restriction.0.priority
      action                    = var.site_config_config.0.ip_restriction.0.action
      headers = [{
        x_azure_fdid      = var.site_config_config.0.ip_restriction.0.headers.0.x_azure_fdid
        x_fd_health_probe = var.site_config_config.0.ip_restriction.0.headers.0.x_fd_health_probe
        x_forwarded_for   = var.site_config_config.0.ip_restriction.0.headers.0.x_forwarded_for
        x_forwarded_host  = var.site_config_config.0.ip_restriction.0.headers.0.x_forwarded_host
      }]
    }]
    load_balancing_mode              = var.site_config_config.0.load_balancing_mode
    managed_pipeline_mode            = var.site_config_config.0.managed_pipeline_mode
    minimum_tls_version              = var.site_config_config.0.minimum_tls_version
    pre_warmed_instance_count        = var.site_config_config.0.pre_warmed_instance_count
    remote_debugging_enabled         = var.site_config_config.0.remote_debugging_enabled
    remote_debugging_version         = var.site_config_config.0.remote_debugging_version
    runtime_scale_monitoring_enabled = var.site_config_config.0.runtime_scale_monitoring_enabled
    scm_ip_restriction = [{
      ip_address                = var.site_config_config.0.scm_ip_restriction.0.ip_address
      service_tag               = var.site_config_config.0.scm_ip_restriction.0.service_tag
      virtual_network_subnet_id = var.site_config_config.0.scm_ip_restriction.0.virtual_network_subnet_id
      name                      = var.site_config_config.0.scm_ip_restriction.0.name
      priority                  = var.site_config_config.0.scm_ip_restriction.0.priority
      action                    = var.site_config_config.0.scm_ip_restriction.0.action
      headers = [{
        x_azure_fdid      = var.site_config_config.0.scm_ip_restriction.0.headers.0.x_azure_fdid
        x_fd_health_probe = var.site_config_config.0.scm_ip_restriction.0.headers.0.x_fd_health_probe
        x_forwarded_for   = var.site_config_config.0.scm_ip_restriction.0.headers.0.x_forwarded_for
        x_forwarded_host  = var.site_config_config.0.scm_ip_restriction.0.headers.0.x_forwarded_host
      }]
    }]
    scm_minimum_tls_version     = var.site_config_config.0.scm_minimum_tls_version
    scm_use_main_ip_restriction = var.site_config_config.0.scm_use_main_ip_restriction
    use_32_bit_worker           = var.site_config_config.0.use_32_bit_worker
    vnet_route_all_enabled      = var.site_config_config.0.vnet_route_all_enabled
    websockets_enabled          = var.site_config_config.0.websockets_enabled
    worker_count                = var.site_config_config.0.worker_count
  }]
  backup_config = [{
    name = var.backup_config.0.name
    schedule = [{
      frequency_interval       = var.backup_config.0.schedule.0.frequency_interval
      frequency_unit           = var.backup_config.0.schedule.0.frequency_unit
      keep_at_least_one_backup = var.backup_config.0.schedule.0.keep_at_least_one_backup
      retention_period_days    = var.backup_config.0.schedule.0.retention_period_days
      start_time               = var.backup_config.0.schedule.0.start_time
    }]
    storage_account_url = var.backup_config.0.storage_account_url
    enabled             = var.backup_config.0.enabled
  }]

  sticky_settings_config = [{
    app_setting_names       = var.sticky_settings_config.0.app_setting_names
    connection_string_names = var.sticky_settings_config.0.connection_string_names
  }]

  storage_key_vault_secret_id = var.storage_key_vault_secret_id
  tags                        = var.tags
}
```
<!-- END_TF_DOCS -->