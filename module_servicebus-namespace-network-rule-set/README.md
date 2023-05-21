<!-- BEGIN_TF_DOCS -->
###### Last Updated[DD/MM/YYYY]: 11/11/2022
## Introduction

Manages a ServiceBus Namespace Network Rule Set.

## File Structure 

This particular module is having the following configuration files.
- namespacenetworkrule.tf : This file is having the terraform code to provision the resource as per requirements.
- variables.tf : This file consists of all the variable definitions needed for the terraform code mentioned in function_app.tf
- outputs.tf : This file will be having the resource output details generated.

## Requirements

1. Resource group
2. Key vault with soft delete and purge protection enabled
3. Managed Identity with Get, Wrap Key and Unwrap Key access to the Key vault
4. One or more IP Addresses, or CIDR Blocks which should be able to access the ServiceBus Namespace
4. A Subnet which should be able to access the ServiceBus Namespace
5. A virtual network that contains the subnet that can access the ServiceBus Namespace


## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.28.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_servicebus_namespace_module"></a> [servicebus\_namespace\_module](#module\_servicebus\_namespace\_module) | ../module_servicebus-namespace | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_servicebus_namespace_network_rule_set.servicebus_namespace_network_rule_set](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/servicebus_namespace_network_rule_set) | resource |
| [azurerm_subnet.servicebus_namespace_network_rule_set_subnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subnet) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_capacity"></a> [capacity](#input\_capacity) | Specifies the capacity. When sku is Premium, capacity can be 1, 2, 4, 8 or 16. When sku is Basic or Standard, capacity can be 0 only. | `number` | n/a | no |
| <a name="input_customer_managed_key_config"></a> [customer\_managed\_key\_config](#input\_customer\_managed\_key\_config) | Customer Managed Key Encryption configuration settings for encrypting the data in this ServiceBus Namespace. Once customer-managed key encryption has been enabled, it cannot be disabled. It is mandatory to pass all the arguments in the object. However, if you do not wish to pass custom values to the following optional parameters, please pass 'null' as input. <br>Optional Arguments<br> <li><b><i>infrastructure_encryption_enabled</i></b></li>  | <pre>list(object({<br>        key_vault_key_id = string<br>        identity_id = string<br>        infrastructure_encryption_enabled = bool<br>    }))</pre> | n/a| no |
| <a name="input_default_action"></a> [default\_action](#input\_default\_action) | Specifies the default action for the ServiceBus Namespace Network Rule Set. Possible values are Allow and Deny. | `string` | `"Deny"` | no |
| <a name="input_identity_config"></a> [identity\_config](#input\_identity\_config) | Identity configuration settings for the type of Managed Service Identity that should be configured on this ServiceBus Namespace. It is mandatory to pass all the arguments in the object. However, if you do not wish to pass custom values to the following optional parameters, please pass 'null' as input. <br>Optional Arguments<br> <li><b><i>type</i></b></li> | <pre>list(object({<br>        type = string<br>        identity_ids = list(string)<br>    }))</pre> | n/a | no |
| <a name="input_ip_rules"></a> [ip\_rules](#input\_ip\_rules) | One or more IP Addresses, or CIDR Blocks which should be able to access the ServiceBus Namespace. | `list(string)` | n/a | no |
| <a name="input_local_auth_enabled"></a> [local\_auth\_enabled](#input\_local\_auth\_enabled) | Whether or not SAS authentication is enabled for the Service Bus namespace. | `bool` | `true` | no |
| <a name="input_location"></a> [location](#input\_location) | Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_minimum_tls_version"></a> [minimum\_tls\_version](#input\_minimum\_tls\_version) | The minimum supported TLS version for this Service Bus Namespace. Valid values are: 1.0, 1.1 and 1.2 | `string` | `"1.2"` | no |
| <a name="input_network_rules_config"></a> [network\_rules\_config](#input\_network\_rules\_config) | Network rules for this servicebus namespace. It is mandatory to pass all the arguments in the object. However, if you do not wish to pass custom values to the following optional parameters, please pass 'null' as input. <br>Optional Arguments<br> <li><b><i>ignore_missing_vnet_service_endpoint</i></b></li> | <pre>list(object({<br>    subnet_id = string<br>    ignore_missing_vnet_service_endpoint = bool<br>  }))</pre> | n/a | no |
| <a name="input_public_network_access_enabled"></a> [public\_network\_access\_enabled](#input\_public\_network\_access\_enabled) | Is public network access enabled for the Service Bus Namespace? | `bool` | `true` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which to create the namespace. | `string` | n/a | yes |
| <a name="input_servicebus_namespace_name"></a> [servicebus\_namespace\_name](#input\_servicebus\_namespace\_name) | Specifies the name of the ServiceBus Namespace resource . Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_sku"></a> [sku](#input\_sku) |  Defines which tier to use. Options are Basic, Standard or Premium. Setting this field to Premium will force the creation of a new resource. | `string` | n/a | yes |
| <a name="input_subnet_name_for_network_config"></a> [subnet\_name\_for\_network\_config](#input\_subnet\_name\_for\_network\_config) | Name of the subnet that can access this ServiceBus Namespace. | `string` | n/a | yes |
| <a name="input_subnet_resource_group_name"></a> [subnet\_resource\_group\_name](#input\_subnet\_resource\_group\_name) | Resource group name of the subnet that can access this ServiceBus Namespace. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the resource. | `map(string)` | n/a | no |
| <a name="input_trusted_services_allowed"></a> [trusted\_services\_allowed](#input\_trusted\_services\_allowed) | If True, then Azure Services that are known and trusted for this resource type are allowed to bypass firewall configuration. | `bool` | `false` | no |
| <a name="input_virtual_network_name_for_network_config"></a> [virtual\_network\_name\_for\_network\_config](#input\_virtual\_network\_name\_for\_network\_config) | Virtual Network name of the subnet that can access this ServiceBus Namespace. | `string` | n/a | no |
| <a name="input_zone_redundant"></a> [zone\_redundant](#input\_zone\_redundant) | Whether or not this resource is zone redundant. sku needs to be Premium. | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_servicebus_namespace_network_rule_set_id"></a> [servicebus\_namespace\_network\_rule\_set\_id](#output\_servicebus\_namespace\_network\_rule\_set\_id) | The ID of the ServiceBus Namespace Network Rule Set. |
| <a name="output_servicebus_namespace_network_rule_set_subnet_id"></a> [servicebus\_namespace\_network\_rule\_set\_subnet\_id](#output\_servicebus\_namespace\_network\_rule\_set\_subnet\_id) | The subnet id to use for this module - passed as input |

## Module Usage

```
module "servicebus_namespace_network_rule_set" {
  source                    = "../../modules/module_servicebus-namespace-network-rule-set"
  servicebus_namespace_name = var.servicebus_namespace_name
  location                  = var.location
  resource_group_name       = var.resource_group_name
  sku                       = var.sku
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
  local_auth_enabled                          = var.local_auth_enabled
  public_network_access_enabled_for_namespace = var.public_network_access_enabled_for_namespace
  minimum_tls_version                         = var.minimum_tls_version
  zone_redundant                              = var.zone_redundant
  tags                                        = var.tags

  subnet_name_for_network_config          = var.subnet_name_for_network_config
  virtual_network_name_for_network_config = var.virtual_network_name_for_network_config
  subnet_resource_group_name              = var.subnet_resource_group_name

  default_action                                               = var.default_action
  public_network_access_enabled_for_namespace_network_rule_set = var.public_network_access_enabled_for_namespace_network_rule_set
  trusted_services_allowed                                     = var.trusted_services_allowed
  ip_rules                                                     = var.ip_rules
  network_rules_config = [{
    subnet_id                            = module.servicebus_namespace_network_rule_set.servicebus_namespace_network_rule_set_subnet_id
    ignore_missing_vnet_service_endpoint = var.network_rules_config.0.ignore_missing_vnet_service_endpoint
  }]
}
```
<!-- END_TF_DOCS -->