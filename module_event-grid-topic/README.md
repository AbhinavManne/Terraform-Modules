<!-- BEGIN_TF_DOCS -->

###### Last Updated[DD/MM/YYYY]: 21/11/2022

## Introduction

This module Provisions an Event Grid Topic resource along with multiple optional blocks.

## File Structure 

This particular module is having the following configuration files.
- eventgrid-topic.tf : This file is having the terraform code to provision the resources as per requirements.
- variables.tf : This file consists of all the variable definitions needed for the terraform code mentioned in eventgrid-topic.tf
- outputs.tf : This file will be having the resource output details generated.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.31.0 |

## Resources

| Name | Type |
|------|------|
| [azurerm_eventgrid_topic.egt](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/eventgrid_topic) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_enable_input_mapping_default_values"></a> [enable\_input\_mapping\_default\_values](#input\_enable\_input\_mapping\_default\_values) | Whether to enable input mapping default values block | `bool` | `null` | no |
| <a name="input_enable_input_mapping_fields"></a> [enable\_input\_mapping\_fields](#input\_enable\_input\_mapping\_fields) | Whether to enable input mapping fields block | `bool` | `null` | no |
| <a name="input_eventgrid_topic_name"></a> [eventgrid\_topic\_name](#input\_eventgrid\_topic\_name) | event grid topic name | `string` | n/a | yes |
| <a name="input_inbound_ip_rule"></a> [inbound\_ip\_rule](#input\_inbound\_ip\_rule) | Inbound ip rules block. It is mandatory to pass all the parameters in the object. However, if you do not wish to pass custom values to the following optional parameter, please pass 'null' as input. <br>Optional Arguments:<br><li>***ip_mask***<br><li>***action*** | <pre>list(object({<br>    ip_mask = string<br>    action  = string<br>  }))</pre> | n/a | no |
| <a name="input_input_mapping_default_values_data_subject"></a> [input\_mapping\_default\_values\_data\_subject](#input\_input\_mapping\_default\_values\_data\_subject) | Specifies the default subject of the EventGrid Event to associate with the domain | `string` | `null` | no |
| <a name="input_input_mapping_default_values_data_version"></a> [input\_mapping\_default\_values\_data\_version](#input\_input\_mapping\_default\_values\_data\_version) | Specifies the default data version of the EventGrid Event to associate with the domain | `string` | `null` | no |
| <a name="input_input_mapping_default_values_event_type"></a> [input\_mapping\_default\_values\_event\_type](#input\_input\_mapping\_default\_values\_event\_type) | Specifies the default event type of the EventGrid Event to associate with the domain | `string` | `null` | no |
| <a name="input_input_mapping_fields_data_version"></a> [input\_mapping\_fields\_data\_version](#input\_input\_mapping\_fields\_data\_version) | Specifies the data version of the EventGrid Event to associate with the domain | `string` | `null` | no |
| <a name="input_input_mapping_fields_event_type"></a> [input\_mapping\_fields\_event\_type](#input\_input\_mapping\_fields\_event\_type) | Specifies the event type of the EventGrid Event to associate with the domain | `string` | `null` | no |
| <a name="input_input_mapping_fields_id"></a> [input\_mapping\_fields\_id](#input\_input\_mapping\_fields\_id) | Specifies the id of the EventGrid Event to associate with the domain | `string` | `null` | no |
| <a name="input_input_mapping_fields_subject"></a> [input\_mapping\_fields\_subject](#input\_input\_mapping\_fields\_subject) | Specifies the subject of the EventGrid Event to associate with the domain | `string` | `null` | no |
| <a name="input_input_mapping_fields_time"></a> [input\_mapping\_fields\_time](#input\_input\_mapping\_fields\_time) | Specifies the event time of the EventGrid Event to associate with the domain | `string` | `null` | no |
| <a name="input_input_mapping_fields_topic"></a> [input\_mapping\_fields\_topic](#input\_input\_mapping\_fields\_topic) | Specifies the topic of the EventGrid Event to associate with the domain | `string` | `null` | no |
| <a name="input_input_schema"></a> [input\_schema](#input\_input\_schema) | specifies the schema in which incoming events will be published to this domain | `string` | `"eventgridschema"` | no |
| <a name="input_local_auth_enabled"></a> [local\_auth\_enabled](#input\_local\_auth\_enabled) | Whether local authentication methods is enabled for the EventGrid topic | `bool` | `true` | no |
| <a name="input_location"></a> [location](#input\_location) | Resource group location | `string` | n/a | yes |
| <a name="input_managed_identity_ids"></a> [managed\_identity\_ids](#input\_managed\_identity\_ids) | A list of User Managed Identity ID's | `list(string)` | `null` | no |
| <a name="input_managed_identity_type"></a> [managed\_identity\_type](#input\_managed\_identity\_type) | type of Managed Identity | `string` | n/a | yes |
| <a name="input_public_network_access_enabled"></a> [public\_network\_access\_enabled](#input\_public\_network\_access\_enabled) | Whether or not public network access is allowed for this server | `bool` | `true` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Resource group name | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags | `map(any)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_eventgrid_topic_endpoint"></a> [eventgrid\_topic\_endpoint](#output\_eventgrid\_topic\_endpoint) | The Endpoint associated with the EventGrid Topic. |
| <a name="output_eventgrid_topic_id"></a> [eventgrid\_topic\_id](#output\_eventgrid\_topic\_id) | The ID of the EventGrid topic |
| <a name="output_eventgrid_topic_primary_access_key"></a> [eventgrid\_topic\_primary\_access\_key](#output\_eventgrid\_topic\_primary\_access\_key) | The Primary Shared Access Key associated with the EventGrid Topic |
| <a name="output_eventgrid_topic_secondary_access_key"></a> [eventgrid\_topic\_secondary\_access\_key](#output\_eventgrid\_topic\_secondary\_access\_key) | The Secondary Shared Access Key associated with the EventGrid Topic |
## Module
```
module "azure_eventgrid_topic" {
  source                                    = "../../modules/module_event-grid-topic"
  eventgrid_topic_name                      = var.eventgrid_topic_name
  location                                  = module.module_create_resource_group.resource_group_location
  resource_group_name                       = module.module_create_resource_group.resource_group_name
  input_schema                              = var.input_schema
  public_network_access_enabled             = var.public_network_access_enabled
  local_auth_enabled                        = var.local_auth_enabled
  tags                                      = var.tags
  managed_identity_type                     = var.managed_identity_type
  managed_identity_ids                      = var.managed_identity_ids
  enable_input_mapping_fields               = var.enable_input_mapping_fields
  input_mapping_fields_id                   = var.input_mapping_fields_id
  input_mapping_fields_topic                = var.input_mapping_fields_topic
  input_mapping_fields_event_type           = var.input_mapping_default_values_event_type
  input_mapping_fields_time                 = var.input_mapping_fields_time
  input_mapping_fields_data_version         = var.input_mapping_fields_data_version
  input_mapping_fields_subject              = var.input_mapping_fields_subject
  enable_input_mapping_default_values       = var.enable_input_mapping_default_values
  input_mapping_default_values_event_type   = var.input_mapping_default_values_event_type
  input_mapping_default_values_data_version = var.input_mapping_default_values_data_version
  input_mapping_default_values_data_subject = var.input_mapping_default_values_data_subject
  inbound_ip_rule                           = var.inbound_ip_rule
}
```
<!-- END_TF_DOCS -->