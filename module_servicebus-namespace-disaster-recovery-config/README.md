<!-- BEGIN_TF_DOCS -->
###### Last Updated[DD/MM/YYYY]: 11/11/2022
## Introduction

Manages a Disaster Recovery Config for a Service Bus Namespace.

## File Structure 

This particular module is having the following configuration files.
- namespacedisasterrecovery.tf : This file is having the terraform code to provision the resource as per requirements.
- variables.tf : This file consists of all the variable definitions needed for the terraform code mentioned in function_app.tf
- outputs.tf : This file will be having the resource output details generated.

## Requirements

1. Resource group
2. Key vault with soft delete and purge protection enabled
3. Managed Identity with Get, Wrap Key and Unwrap Key access to the Key vault

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.28.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_primary_servicebus_namespace_module"></a> [primary\_servicebus\_namespace\_module](#module\_primary\_servicebus\_namespace\_module) | ../module_servicebus-namespace | n/a |
| <a name="module_secondary_servicebus_namespace_module"></a> [secondary\_servicebus\_namespace\_module](#module\_secondary\_servicebus\_namespace\_module) | ../module_servicebus-namespace | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_servicebus_namespace_disaster_recovery_config.servicebus_namespace_disaster_recovery_config](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/servicebus_namespace_disaster_recovery_config) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_capacity"></a> [capacity](#input\_capacity) | Specifies the capacity. When sku is Premium, capacity can be 1, 2, 4, 8 or 16. When sku is Basic or Standard, capacity can be 0 only. | `number` | n/a | no |
| <a name="input_customer_managed_key_config"></a> [customer\_managed\_key\_config](#input\_customer\_managed\_key\_config) | Customer Managed Key Encryption configuration settings for encrypting the data in this ServiceBus Namespace. Once customer-managed key encryption has been enabled, it cannot be disabled. It is mandatory to pass all the arguments in the object. However, if you do not wish to pass custom values to the following optional parameters, please pass 'null' as input. <br>Optional Arguments<br> <li><b><i>infrastructure_encryption_enabled</i></b></li>  | <pre>list(object({<br>        key_vault_key_id = string<br>        identity_id = string<br>        infrastructure_encryption_enabled = bool<br>    }))</pre> | n/a| no |
| <a name="input_identity_config"></a> [identity\_config](#input\_identity\_config) | Identity configuration settings for the type of Managed Service Identity that should be configured on this ServiceBus Namespace. It is mandatory to pass all the arguments in the object. However, if you do not wish to pass custom values to the following optional parameters, please pass 'null' as input. <br>Optional Arguments<br> <li><b><i>type</i></b></li> | <pre>list(object({<br>        type = string<br>        identity_ids = list(string)<br>    }))</pre> | n/a | no |
| <a name="input_local_auth_enabled"></a> [local\_auth\_enabled](#input\_local\_auth\_enabled) | Whether or not SAS authentication is enabled for the Service Bus namespace. | `bool` | `true` | no |
| <a name="input_location"></a> [location](#input\_location) | Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_minimum_tls_version"></a> [minimum\_tls\_version](#input\_minimum\_tls\_version) | The minimum supported TLS version for this Service Bus Namespace. Valid values are: 1.0, 1.1 and 1.2 | `string` | `"1.2"` | no |
 <a name="input_primary_servicebus_namespace_location"></a> [primary\_servicebus\_namespace\_location](#input\_primary\_servicebus\_namespace\_location) | Specifies the resource group location for the primary Service Bus Namespace. | `string` | n/a | yes |
| <a name="input_primary_servicebus_namespace_name"></a> [primary\_servicebus\_namespace\_name](#input\_primary\_servicebus\_namespace\_name) | Name of the primary Service Bus Namespace.  | `string` | n/a | yes |
| <a name="input_public_network_access_enabled"></a> [public\_network\_access\_enabled](#input\_public\_network\_access\_enabled) | Is public network access enabled for the Service Bus Namespace? | `bool` | `true` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which to create the namespace. | `string` | n/a | yes |
| <a name="input_secondary_servicebus_namespace_location"></a> [secondary\_servicebus\_namespace\_location](#input\_secondary\_servicebus\_namespace\_location) | Specifies the resource group location for the Service Bus Namespace to be replicated to. | `string` | n/a | yes |
| <a name="input_secondary_servicebus_namespace_name"></a> [secondary\_servicebus\_namespace\_name](#input\_secondary\_servicebus\_namespace\_name) | Name of the Service Bus Namespace to be replicated to. | `string` | n/a | yes |
| <a name="input_servicebus_namespace_disaster_recovery_config_name"></a> [servicebus\_namespace\_disaster\_recovery\_config\_name](#input\_servicebus\_namespace\_disaster\_recovery\_config\_name) | Specifies the name of the Disaster Recovery Config. This is the alias DNS name that will be created. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_sku"></a> [sku](#input\_sku) |  Defines which tier to use. Options are Basic, Standard or Premium. Setting this field to Premium will force the creation of a new resource. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the resource. | `map(string)` | n/a | no |
| <a name="input_zone_redundant"></a> [zone\_redundant](#input\_zone\_redundant) | Whether or not this resource is zone redundant. sku needs to be Premium. | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_servicebus_namespace_disaster_recovery_config_default_primary_key"></a> [servicebus\_namespace\_disaster\_recovery\_config\_default\_primary\_key](#output\_servicebus\_namespace\_disaster\_recovery\_config\_default\_primary\_key) | The primary access key for the authorization rule RootManageSharedAccessKey. |
| <a name="output_servicebus_namespace_disaster_recovery_config_default_secondary_key"></a> [servicebus\_namespace\_disaster\_recovery\_config\_default\_secondary\_key](#output\_servicebus\_namespace\_disaster\_recovery\_config\_default\_secondary\_key) | The secondary access key for the authorization rule RootManageSharedAccessKey. |
| <a name="output_servicebus_namespace_disaster_recovery_config_id"></a> [servicebus\_namespace\_disaster\_recovery\_config\_id](#output\_servicebus\_namespace\_disaster\_recovery\_config\_id) | The Service Bus Namespace Disaster Recovery Config ID. |
| <a name="output_servicebus_namespace_disaster_recovery_config_primary_connection_string_alias"></a> [servicebus\_namespace\_disaster\_recovery\_config\_primary\_connection\_string\_alias](#output\_servicebus\_namespace\_disaster\_recovery\_config\_primary\_connection\_string\_alias) | The alias Primary Connection String for the ServiceBus Namespace. |
| <a name="output_servicebus_namespace_disaster_recovery_config_secondary_connection_string_alias"></a> [servicebus\_namespace\_disaster\_recovery\_config\_secondary\_connection\_string\_alias](#output\_servicebus\_namespace\_disaster\_recovery\_config\_secondary\_connection\_string\_alias) | The alias Secondary Connection String for the ServiceBus Namespace |

## Module Usage

```
module "servicebus_namespace_disaster_recovery_config_module" {
  source                                             = "../../modules/module_servicebus-namespace-disaster-recovery-config"
  servicebus_namespace_disaster_recovery_config_name = var.servicebus_namespace_disaster_recovery_config_name
  primary_servicebus_namespace_name                  = var.primary_servicebus_namespace_name
  secondary_servicebus_namespace_name                = var.secondary_servicebus_namespace_name
  primary_servicebus_namespace_location              = var.primary_servicebus_namespace_location
  secondary_servicebus_namespace_location            = var.secondary_servicebus_namespace_location
  location                                           = var.location
  resource_group_name                                = var.resource_group_name
  sku                                                = var.sku
  identity_config = [{
    type         = var.identity_config.0.type
    identity_ids = var.identity_config.0.identity_ids
  }]
  capacity = var.capacity
  customer_managed_key_config = [{
    key_vault_key_id                  = var.customer_managed_key_config.0.key_vault_key_id
    identity_id                       = var.customer_managed_key_config.0.identity_id
    infrastructure_encryption_enabled = var.customer_managed_key_config.0.infrastructure_encryption_enabled
  }]
  local_auth_enabled            = var.local_auth_enabled
  public_network_access_enabled = var.public_network_access_enabled
  minimum_tls_version           = var.minimum_tls_version
  zone_redundant                = var.zone_redundant
  tags                          = var.tags
}
```
<!-- END_TF_DOCS -->