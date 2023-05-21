<!-- BEGIN_TF_DOCS -->
# <u> Introduction </u>
Provisions an event grid domain

# <u> Build and Test </u>

### Generic modules for all scenarios :-
   * Tagging 
        ```
        tags = {
            Contact_name     = "Nikita"
            cost_centre      = "999"
            application_name = "sql server"
               }
        ```
   * Logging and Monitoring
        * Alert Rules
        * Diagnostic Settings
        * Action groups/rules 

   * RBAC
      * We can assign role at resource group level/resource level.

 
 # <u>Pre-requisites:</u>

In order to run this script successfully, below resources should be created prior to using this script :
 *  *** Resource Group *** The resource group collects metadata from each individual resource to  facilitate more granular management than at the subscription level.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | =2.46.0 |


## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_azure_eventgrid_domain"></a> [azure\_eventgrid\_domain](#module\_azure\_eventgrid\_domain) | ../../modules/module_event-grid/event-grid-domain | n/a |
| <a name="module_event_grid_domain_monitoring"></a> [event\_grid\_domain\_monitoring](#module\_event\_grid\_domain\_monitoring) | ../../modules/module_event-grid/logging_and_monitoring | n/a |
| <a name="module_module_resource-role-assignment"></a> [module\_resource-role-assignment](#module\_module\_resource-role-assignment) | ../../modules/module_event-grid/rbac | n/a |


## Resources

| Name | Type |
|------|------|
| [azurerm_eventgrid_domain.eventgrid](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/eventgrid_domain) | resource |
| [azurerm_private_endpoint.pep1](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_endpoint) | resource |
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_storage_account.example](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account) | resource |
| [azurerm_subnet.snet-ep](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_virtual_network.vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |
| [azurerm_private_endpoint_connection.private-ip1](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/private_endpoint_connection) | data source |
| [azurerm_resource_group.rgrp](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_replication_type"></a> [account\_replication\_type](#input\_account\_replication\_type) | storage account replication type | `string` | n/a | yes |
| <a name="input_account_tier"></a> [account\_tier](#input\_account\_tier) | storage account tier | `string` | n/a | yes |
| <a name="input_action"></a> [action](#input\_action) | action | `string` | n/a | yes |
| <a name="input_address_space"></a> [address\_space](#input\_address\_space) | address space of Vnet | `list(string)` | n/a | yes |
| <a name="input_create_resource_group"></a> [create\_resource\_group](#input\_create\_resource\_group) | Need Resource group resource or resource group data source ? | `bool` | n/a | yes |
| <a name="input_enable_private_endpoint"></a> [enable\_private\_endpoint](#input\_enable\_private\_endpoint) | Manages a Private Endpoint to Azure database for MySQL | `string` | n/a | yes |
| <a name="input_enforce_private_link_endpoint_network_policies"></a> [enforce\_private\_link\_endpoint\_network\_policies](#input\_enforce\_private\_link\_endpoint\_network\_policies) | n/a | `string` | n/a | yes |
| <a name="input_eventgrid_name"></a> [eventgrid\_name](#input\_eventgrid\_name) | event grid name in azure | `string` | n/a | yes |
| <a name="input_input_schema"></a> [input\_schema](#input\_input\_schema) | specifies the schema in which incoming events will be published to this domain | `string` | n/a | yes |
| <a name="input_ip_mask"></a> [ip\_mask](#input\_ip\_mask) | ip mask | `string` | n/a | yes |
| <a name="input_is_manual_connection"></a> [is\_manual\_connection](#input\_is\_manual\_connection) | is\_manual\_connection true or false | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Resource group location | `string` | n/a | yes |
| <a name="input_private_endpoint_name"></a> [private\_endpoint\_name](#input\_private\_endpoint\_name) | Name of private endpoint | `string` | n/a | yes |
| <a name="input_private_service_connection_name"></a> [private\_service\_connection\_name](#input\_private\_service\_connection\_name) | Name of private\_service\_connection | `string` | n/a | yes |
| <a name="input_private_subnet_address_prefix"></a> [private\_subnet\_address\_prefix](#input\_private\_subnet\_address\_prefix) | The name of the subnet for private endpoints | `list(string)` | n/a | yes |
| <a name="input_public_network_access_enabled"></a> [public\_network\_access\_enabled](#input\_public\_network\_access\_enabled) | enable public network access ? | `bool` | n/a | yes |
| <a name="input_resource_group"></a> [resource\_group](#input\_resource\_group) | Resource group name | `string` | n/a | yes |
| <a name="input_storage_account_name"></a> [storage\_account\_name](#input\_storage\_account\_name) | storage account name | `string` | n/a | yes |
| <a name="input_subnet_name"></a> [subnet\_name](#input\_subnet\_name) | Name of the subnet in virtual network | `string` | n/a | yes |
| <a name="input_subresource_names"></a> [subresource\_names](#input\_subresource\_names) | Subresources name | `list(string)` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags | `map(any)` | n/a | yes |
| <a name="input_virtual_network"></a> [virtual\_network](#input\_virtual\_network) | Virtual network name in Azure | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_resource_group_id"></a> [resource\_group\_id](#output\_resource\_group\_id) | n/a |
| <a name="output_resource_group_location"></a> [resource\_group\_location](#output\_resource\_group\_location) | n/a |
| <a name="output_resource_group_name"></a> [resource\_group\_name](#output\_resource\_group\_name) | n/a |
| <a name="output_resource_id"></a> [resource\_id](#output\_resource\_id) | n/a |
| <a name="output_storage_account_id"></a> [storage\_account\_id](#output\_storage\_account\_id) | n/a |

## Commands to execute the terraform script:
  * init        :  Prepare your working directory for other commands
  * validate    :  Check whether the configuration is valid
  * plan        :  Show changes required by the current configuration
  * apply       :  Create or update infrastructure
  * destroy     :  Destroy previously-created infrastructure

## <u> Vulnerabilities discovered using tfsec:</u>

  * When using Queue Services for a storage account, logging should be enabled : Not Fixed

  This issue has been reported by the Terraform Github community and relates to the version of provider we no longer support.
  [Issue](https://github.com/hashicorp/terraform-provider-azurerm/issues/4401)


## <u> Reference Documents  </u>:
- [Terraform](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs)
- [Visual Studio Code](https://github.com/Microsoft/vscode)
- [Microsoft docs](https://docs.microsoft.com/en-in/documentation/)
- [Azure Repos](https://dev.azure.com/eycloudtools/AzureLandingZone/_git/AzureLandingZone)



    

<!-- END_TF_DOCS -->