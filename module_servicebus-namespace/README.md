<!-- BEGIN_TF_DOCS -->
###### Last Updated[DD/MM/YYYY]: 11/11/2022
## Introduction

Manages a ServiceBus Namespace.

## File Structure 

This particular module is having the following configuration files.
- namespace.tf : This file is having the terraform code to provision the resource as per requirements.
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

## Resources

| Name | Type |
|------|------|
| [azurerm_servicebus_namespace.servicebus_namespace](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/servicebus_namespace) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_capacity"></a> [capacity](#input\_capacity) | Specifies the capacity. When sku is Premium, capacity can be 1, 2, 4, 8 or 16. When sku is Basic or Standard, capacity can be 0 only. | `number` | n/a | no |
| <a name="input_customer_managed_key_config"></a> [customer\_managed\_key\_config](#input\_customer\_managed\_key\_config) | Customer Managed Key Encryption configuration settings for encrypting the data in this ServiceBus Namespace. Once customer-managed key encryption has been enabled, it cannot be disabled. It is mandatory to pass all the arguments in the object. However, if you do not wish to pass custom values to the following optional parameters, please pass 'null' as input. <br>Optional Arguments<br> <li><b><i>infrastructure_encryption_enabled</i></b></li>  | <pre>list(object({<br>        key_vault_key_id = string<br>        identity_id = string<br>        infrastructure_encryption_enabled = bool<br>    }))</pre> | n/a| no |
| <a name="input_identity_config"></a> [identity\_config](#input\_identity\_config) | Identity configuration settings for the type of Managed Service Identity that should be configured on this ServiceBus Namespace. It is mandatory to pass all the arguments in the object. However, if you do not wish to pass custom values to the following optional parameters, please pass 'null' as input. <br>Optional Arguments<br> <li><b><i>type</i></b></li> | <pre>list(object({<br>        type = string<br>        identity_ids = list(string)<br>    }))</pre> | n/a | no |
| <a name="input_local_auth_enabled"></a> [local\_auth\_enabled](#input\_local\_auth\_enabled) | Whether or not SAS authentication is enabled for the Service Bus namespace. | `bool` | `true` | no |
| <a name="input_location"></a> [location](#input\_location) | Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_minimum_tls_version"></a> [minimum\_tls\_version](#input\_minimum\_tls\_version) | The minimum supported TLS version for this Service Bus Namespace. Valid values are: 1.0, 1.1 and 1.2 | `string` | `"1.2"` | no |
| <a name="input_public_network_access_enabled"></a> [public\_network\_access\_enabled](#input\_public\_network\_access\_enabled) | Is public network access enabled for the Service Bus Namespace? | `bool` | `true` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which to create the namespace. | `string` | n/a | yes |
| <a name="input_servicebus_namespace_name"></a> [servicebus\_namespace\_name](#input\_servicebus\_namespace\_name) | Specifies the name of the ServiceBus Namespace resource . Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_sku"></a> [sku](#input\_sku) |  Defines which tier to use. Options are Basic, Standard or Premium. Setting this field to Premium will force the creation of a new resource. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the resource. | `map(string)` | n/a | no |
| <a name="input_zone_redundant"></a> [zone\_redundant](#input\_zone\_redundant) | Whether or not this resource is zone redundant. sku needs to be Premium. | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_servicebus_namespace_id"></a> [servicebus\_namespace\_id](#output\_servicebus\_namespace\_id) | The ServiceBus Namespace ID. |
| <a name="output_servicebus_namespace_identity_principal_id"></a> [servicebus\_namespace\_identity\_principal\_id](#output\_servicebus\_namespace\_identity\_principal\_id) | The Principal ID for the Service Principal associated with the Managed Service Identity of this ServiceBus Namespace. |
| <a name="output_servicebus_namespace_identity_tenant_id"></a> [servicebus\_namespace\_identity\_tenant\_id](#output\_servicebus\_namespace\_identity\_tenant\_id) | The Tenant ID for the Service Principal associated with the Managed Service Identity of this ServiceBus Namespace. |

## Module Usage

```
module "servicebus_namespace_module" {
  source                    = "../../modules/module_servicebus-namespace"
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
  local_auth_enabled            = var.local_auth_enabled
  public_network_access_enabled = var.public_network_access_enabled
  minimum_tls_version           = var.minimum_tls_version
  zone_redundant                = var.zone_redundant
  tags                          = var.tags
}
```
<!-- END_TF_DOCS -->