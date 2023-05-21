<!-- BEGIN_TF_DOCS -->
#### last updated :22-08-22

## Introduction
* This Terraform module helps create Azure Container Registry with optional geo-replications, scope-map, token, webhook,agent pool, Network ACLs, encryption and Private endpoints.
* Private Endpoint :By default, this feature not enabled on this module  ``` create_private_endpoint to true ```
* Trust policy :This module supports the feature and can be implemneted by setting up ``` enable_content_trust = true ```
* We need to create key vault and user assigned identity manually or can take it as input by the user.If created manually :

            *Key vault should have get,wrap and unwrap permissions enabled in key permissions.
            *Alternatively, assign the``` Key Vault Crypto Service Encryption```user role to the      user-assigned managed identity at the key vault scope.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.19.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_PrivateEndpointSql_module"></a> [PrivateEndpointSql\_module](#module\_PrivateEndpointSql\_module) | ../../module_private_endpoint | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_container_registry.container_registry](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/container_registry) | resource |
| [azurerm_container_registry_agent_pool.agent_pool](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/container_registry_agent_pool) | resource |
| [azurerm_container_registry_scope_map.scope_map](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/container_registry_scope_map) | resource |
| [azurerm_container_registry_token.registry_token](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/container_registry_token) | resource |
| [azurerm_container_registry_webhook.registry_webhook](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/container_registry_webhook) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_acr_diag_logs"></a> [acr\_diag\_logs](#input\_acr\_diag\_logs) | Application Gateway Monitoring Category details for Azure Diagnostic setting | `list` | <pre>[<br>  "ContainerRegistryRepositoryEvents",<br>  "ContainerRegistryLoginEvents"<br>]</pre> | no |
| <a name="input_agent_pool"></a> [agent\_pool](#input\_agent\_pool) | Manages an Azure Container Registry Webhook | <pre>map(object({<br>    instance_count            = number<br>    tier                      = string<br>    virtual_network_subnet_id = string<br>  }))</pre> | `null` | no |
| <a name="input_container_registry_config"></a> [container\_registry\_config](#input\_container\_registry\_config) | Manages an Azure Container Registry | <pre>object({<br>    name                          = string<br>    admin_enabled                 = bool<br>    sku                           = string<br>    public_network_access_enabled = bool<br>    quarantine_policy_enabled     = bool<br>    zone_redundancy_enabled       = bool<br>  })</pre> | n/a | yes |
| <a name="input_container_registry_webhooks"></a> [container\_registry\_webhooks](#input\_container\_registry\_webhooks) | Manages an Azure Container Registry Webhook | <pre>map(object({<br>    service_uri    = string<br>    actions        = list(string)<br>    status         = string<br>    scope          = string<br>    custom_headers = map(string)<br>  }))</pre> | `null` | no |
| <a name="input_create_private-endpoint"></a> [create\_private-endpoint](#input\_create\_private-endpoint) | Wants to create private endpoint or not | `bool` | `false` | no |
| <a name="input_enable_content_trust"></a> [enable\_content\_trust](#input\_enable\_content\_trust) | Boolean value to enable or disable Content trust in Azure Container Registry | `bool` | `false` | no |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | n/a | `bool` | `true` | no |
| <a name="input_encryption"></a> [encryption](#input\_encryption) | Encrypt registry using a customer-managed key | <pre>object({<br>    enabled            = bool<br>    key_vault_key_id   = string<br>    identity_client_id = string<br>  })</pre> | `null` | no |
| <a name="input_georeplications"></a> [georeplications](#input\_georeplications) | A list of Azure locations where the container registry should be geo-replicated | <pre>list(object({<br>    location                = string<br>    zone_redundancy_enabled = bool<br>  }))</pre> | `[]` | no |
| <a name="input_identity_ids"></a> [identity\_ids](#input\_identity\_ids) | A list of User Managed Identity ID's . | `list(string)` | `[]` | no |
| <a name="input_identity_type"></a> [identity\_type](#input\_identity\_type) | The type of Managed Identity . Possible values are `SystemAssigned`, `UserAssigned` and `SystemAssigned, UserAssigned` | `string` | `null` | no |
| <a name="input_is_manual_connection"></a> [is\_manual\_connection](#input\_is\_manual\_connection) | Status of manual connection | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The location/region to keep all your network resources. To get the list of all locations with table format from azure cli, run 'az account list-locations -o table' | `any` | n/a | yes |
| <a name="input_network_rule_set"></a> [network\_rule\_set](#input\_network\_rule\_set) | Manage network rules for Azure Container Registries | <pre>object({<br>    default_action = string<br>    ip_rule = list(object({<br>      ip_range = string<br>    }))<br>    virtual_network = list(object({<br>      subnet_id = string<br>    }))<br>  })</pre> | `null` | no |
| <a name="input_private_connection_resource_alias"></a> [private\_connection\_resource\_alias](#input\_private\_connection\_resource\_alias) | alias name | `string` | `null` | no |
| <a name="input_private_connection_resource_id"></a> [private\_connection\_resource\_id](#input\_private\_connection\_resource\_id) | ID of resource to be associated | `any` | `null` | no |
| <a name="input_private_dns_zone_group"></a> [private\_dns\_zone\_group](#input\_private\_dns\_zone\_group) | block for dns zone group | <pre>object({<br>    name                 = string<br>    private_dns_zone_ids = list(string)<br>  })</pre> | <pre>{<br>  "name": "xyz",<br>  "private_dns_zone_ids": [<br>    "null"<br>  ]<br>}</pre> | no |
| <a name="input_private_endpoint_name"></a> [private\_endpoint\_name](#input\_private\_endpoint\_name) | pvt endpoint name in Azure | `string` | n/a | yes |
| <a name="input_private_service_connection_name"></a> [private\_service\_connection\_name](#input\_private\_service\_connection\_name) | service connection name in Azure | `string` | n/a | yes |
| <a name="input_request_message"></a> [request\_message](#input\_request\_message) | request msg | `string` | `"PL"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | A container that holds related resources for an Azure solution | `any` | n/a | yes |
| <a name="input_retention_policy"></a> [retention\_policy](#input\_retention\_policy) | Set a retention policy for untagged manifests | <pre>object({<br>    days    = number<br>    enabled = bool<br>  })</pre> | `null` | no |
| <a name="input_scope_map"></a> [scope\_map](#input\_scope\_map) | Manages an Azure Container Registry scope map. Scope Maps are a preview feature only available in Premium SKU Container registries. | <pre>map(object({<br>    actions = list(string)<br>  }))</pre> | `null` | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | Id of subnet | `any` | n/a | yes |
| <a name="input_subresource_names"></a> [subresource\_names](#input\_subresource\_names) | sub resources names in Azure | `list(string)` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to all resources | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_container_registry_id"></a> [container\_registry\_id](#output\_container\_registry\_id) | The ID of the Container Registry |
| <a name="output_container_registry_login_server"></a> [container\_registry\_login\_server](#output\_container\_registry\_login\_server) | The URL that can be used to log into the container registry |
| <a name="output_container_registry_scope_map_id"></a> [container\_registry\_scope\_map\_id](#output\_container\_registry\_scope\_map\_id) | The ID of the Container Registry scope map |
| <a name="output_container_registry_token_id"></a> [container\_registry\_token\_id](#output\_container\_registry\_token\_id) | The ID of the Container Registry token |
| <a name="output_container_registry_webhook_id"></a> [container\_registry\_webhook\_id](#output\_container\_registry\_webhook\_id) | The ID of the Container Registry Webhook |

## Module Usage

```
#Reference to azure container registry creation module
module "container_registry" {
  source                      = "../../modules/module_azure-container-registry/container-registry"
  resource_group_name         = var.resource_group_name
  location                    = var.location
  container_registry_config   = var.container_registry_config
  georeplications             = var.georeplications
  tags                        = var.tags
  network_rule_set            = var.network_rule_set
  scope_map                   = var.scope_map
  container_registry_webhooks = var.container_registry_webhooks
  encryption                  = var.encryption
  retention_policy            = var.retention_policy
  enable_content_trust        = var.enable_content_trust
  agent_pool                  = var.agent_pool
  identity_type               = var.identity_type
  identity_ids                = var.identity_ids
}
```
<!-- END_TF_DOCS -->