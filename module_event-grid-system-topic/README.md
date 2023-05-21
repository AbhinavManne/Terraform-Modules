<!-- BEGIN_TF_DOCS -->

###### Last Updated[DD/MM/YYYY]: 29/11/2022

## Introduction

This module Provisions an Event Grid System Topic resource along with Event Grid System Topic Event Subscription.

## File Structure 

This particular module is having the following configuration files.
- eventgrid-system-topic.tf : This file is having the terraform code to provision the resources as per requirements.
- variables.tf : This file consists of all the variable definitions needed for the terraform code mentioned in eventgrid-system-topic.tf
- outputs.tf : This file will be having the resource output details generated.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.31.0 |

## Resources

| Name | Type |
|------|------|
| [azurerm_eventgrid_system_topic.systemtopic](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/eventgrid_system_topic) | resource |
| [azurerm_eventgrid_system_topic_event_subscription.egstes](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/eventgrid_system_topic_event_subscription) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_active_directory_app_id_or_uri"></a> [active\_directory\_app\_id\_or\_uri](#input\_active\_directory\_app\_id\_or\_uri) | The Azure Active Directory Application ID or URI to get the access token that will be included as the bearer token in delivery requests | `string` | `null` | no |
| <a name="input_active_directory_tenant_id"></a> [active\_directory\_tenant\_id](#input\_active\_directory\_tenant\_id) | The Azure Active Directory Tenant ID to get the access token that will be included as the bearer token in delivery requests | `string` | `null` | no |
| <a name="input_advanced_filtering_on_arrays_enabled"></a> [advanced\_filtering\_on\_arrays\_enabled](#input\_advanced\_filtering\_on\_arrays\_enabled) | Specifies whether advanced filters should be evaluated against an array of values instead of expecting a singular value | `bool` | `false` | no |
| <a name="input_base_url"></a> [base\_url](#input\_base\_url) | The base url of the webhook where the Event Subscription will receive events | `string` | `null` | no |
| <a name="input_case_sensitive"></a> [case\_sensitive](#input\_case\_sensitive) | Specifies if subject\_begins\_with and subject\_ends\_with case sensitive | `bool` | `false` | no |
| <a name="input_dead_letter_identity_type"></a> [dead\_letter\_identity\_type](#input\_dead\_letter\_identity\_type) | Specifies the type of Managed Service Identity that is used for dead lettering | `string` | n/a | yes |
| <a name="input_dead_letter_user_assigned_identity"></a> [dead\_letter\_user\_assigned\_identity](#input\_dead\_letter\_user\_assigned\_identity) | The user identity associated with the resource. | `string` | `null` | no |
| <a name="input_delivery_identity_type"></a> [delivery\_identity\_type](#input\_delivery\_identity\_type) | Specifies the type of Managed Service Identity that is used for event delivery | `string` | n/a | yes |
| <a name="input_delivery_property"></a> [delivery\_property](#input\_delivery\_property) | Delivery Property block. It is mandatory to pass all the parameters in the object. However, if you do not wish to pass custom values to the following optional parameter, please pass 'null' as input. <br>Optional Arguments:<br><li>***value***<br><li>***source_field***<br><li>***secret*** | <pre>list(object({<br>    header_name  = string<br>    type         = string<br>    value        = string<br>    source_field = string<br>    secret       = bool<br>  }))</pre> | n/a | yes |
| <a name="input_delivery_user_assigned_identity"></a> [delivery\_user\_assigned\_identity](#input\_delivery\_user\_assigned\_identity) | The user identity associated with the resource | `string` | `null` | no |
| <a name="input_enable_storage_blob_dead_letter_destination"></a> [enable\_storage\_blob\_dead\_letter\_destination](#input\_enable\_storage\_blob\_dead\_letter\_destination) | Whether to enable storage blob dead letter destination | `string` | `null` | no |
| <a name="input_enable_subject_filter"></a> [enable\_subject\_filter](#input\_enable\_subject\_filter) | Whether to enable subject filter | `bool` | `null` | no |
| <a name="input_event_delivery_schema"></a> [event\_delivery\_schema](#input\_event\_delivery\_schema) | Specifies the event delivery schema for the event subscription | `string` | `"EventGridSchema"` | no |
| <a name="input_event_time_to_live"></a> [event\_time\_to\_live](#input\_event\_time\_to\_live) | Specifies the time to live (in minutes) for events | `number` | n/a | yes |
| <a name="input_eventgrid_system_topic_event_subscription_name"></a> [eventgrid\_system\_topic\_event\_subscription\_name](#input\_eventgrid\_system\_topic\_event\_subscription\_name) | Name of eventgrid system topic event subscription | `string` | n/a | yes |
| <a name="input_eventgrid_system_topic_name"></a> [eventgrid\_system\_topic\_name](#input\_eventgrid\_system\_topic\_name) | event grid system topic name | `string` | n/a | yes |
| <a name="input_eventhub_endpoint_id"></a> [eventhub\_endpoint\_id](#input\_eventhub\_endpoint\_id) | Specifies the id where the Event Hub is located | `string` | `null` | no |
| <a name="input_expiration_time_utc"></a> [expiration\_time\_utc](#input\_expiration\_time\_utc) | Specifies the expiration time of the event subscription | `string` | `null` | no |
| <a name="input_function_id"></a> [function\_id](#input\_function\_id) | Specifies the ID of the Function where the Event Subscription will receive events. This must be the functions ID in format {function\_app.id}/functions/{name} | `string` | n/a | yes |
| <a name="input_hybrid_connection_endpoint_id"></a> [hybrid\_connection\_endpoint\_id](#input\_hybrid\_connection\_endpoint\_id) | Specifies the id where the Hybrid Connection is located. | `string` | `null` | no |
| <a name="input_included_event_types"></a> [included\_event\_types](#input\_included\_event\_types) | A list of applicable event types that need to be part of the event subscription | `list(string)` | `null` | no |
| <a name="input_labels"></a> [labels](#input\_labels) | A list of labels to assign to the event subscription | `list(string)` | `null` | no |
| <a name="input_location"></a> [location](#input\_location) | Resource group location | `string` | n/a | yes |
| <a name="input_managed_identity_ids"></a> [managed\_identity\_ids](#input\_managed\_identity\_ids) | A list of User Managed Identity ID's | `list(string)` | `null` | no |
| <a name="input_managed_identity_type"></a> [managed\_identity\_type](#input\_managed\_identity\_type) | type of Managed Identity | `string` | n/a | yes |
| <a name="input_max_delivery_attempts"></a> [max\_delivery\_attempts](#input\_max\_delivery\_attempts) | Specifies the maximum number of delivery retry attempts for events | `string` | n/a | yes |
| <a name="input_max_events_per_batch"></a> [max\_events\_per\_batch](#input\_max\_events\_per\_batch) | Maximum number of events per batch | `number` | `null` | no |
| <a name="input_preferred_batch_size_in_kilobytes"></a> [preferred\_batch\_size\_in\_kilobytes](#input\_preferred\_batch\_size\_in\_kilobytes) | Preferred batch size in Kilobytes | `number` | `null` | no |
| <a name="input_queue_message_time_to_live_in_seconds"></a> [queue\_message\_time\_to\_live\_in\_seconds](#input\_queue\_message\_time\_to\_live\_in\_seconds) | Storage queue message time to live in seconds | `number` | `null` | no |
| <a name="input_queue_name"></a> [queue\_name](#input\_queue\_name) | Specifies the name of the storage queue where the Event Subscription will receive events | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Resource group name | `string` | n/a | yes |
| <a name="input_service_bus_queue_endpoint_id"></a> [service\_bus\_queue\_endpoint\_id](#input\_service\_bus\_queue\_endpoint\_id) | Specifies the id where the Service Bus Queue is located. | `string` | `null` | no |
| <a name="input_service_bus_topic_endpoint_id"></a> [service\_bus\_topic\_endpoint\_id](#input\_service\_bus\_topic\_endpoint\_id) | Specifies the id where the Service Bus Topic is located. | `string` | `null` | no |
| <a name="input_source_arm_resource_id"></a> [source\_arm\_resource\_id](#input\_source\_arm\_resource\_id) | The ID of the Event Grid System Topic ARM Source. | `string` | n/a | yes |
| <a name="input_storage_account_id"></a> [storage\_account\_id](#input\_storage\_account\_id) | Specifies the id of the storage account | `string` | n/a | yes |
| <a name="input_storage_blob_container_name"></a> [storage\_blob\_container\_name](#input\_storage\_blob\_container\_name) | Specifies the name of the Storage blob container that is the destination of the deadletter events | `string` | n/a | yes |
| <a name="input_subject_begins_with"></a> [subject\_begins\_with](#input\_subject\_begins\_with) | A string to filter events for an event subscription based on a resource path prefix | `string` | `null` | no |
| <a name="input_subject_ends_with"></a> [subject\_ends\_with](#input\_subject\_ends\_with) | A string to filter events for an event subscription based on a resource path suffix | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags | `map(any)` | n/a | yes |
| <a name="input_topic_type"></a> [topic\_type](#input\_topic\_type) | The Topic Type of the Event Grid System Topic | `string` | `null` | no |
| <a name="input_url"></a> [url](#input\_url) | Specifies the url of the webhook where the Event Subscription will receive events | `string` | n/a | yes |
| <a name="input_webhook_endpoint_max_events_per_batch"></a> [webhook\_endpoint\_max\_events\_per\_batch](#input\_webhook\_endpoint\_max\_events\_per\_batch) | Maximum number of events per batch | `number` | `null` | no |
| <a name="input_webhook_endpoint_preferred_batch_size_in_kilobytes"></a> [webhook\_endpoint\_preferred\_batch\_size\_in\_kilobytes](#input\_webhook\_endpoint\_preferred\_batch\_size\_in\_kilobytes) | Preferred batch size in Kilobytes | `number` | `null` | no |

## Note
```
- Some topic_types (e.g. Microsoft.Resources.Subscriptions) requires location to be set to Global instead of a real location like West US.
- To set Webhook_endpoint, One of azure_function_endpoint, eventhub_endpoint_id, hybrid_connection_endpoint, hybrid_connection_endpoint_id, service_bus_queue_endpoint_id, service_bus_topic_endpoint_id, storage_queue_endpoint or webhook_endpoint must be specified.
- delivery_property blocks are only effective when using an azure_function_endpoint, eventhub_endpoint_id, hybrid_connection_endpoint_id, service_bus_topic_endpoint_id, or webhook_endpoint endpoint specification.
- 
```
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_eventgrid_system_topic_id"></a> [eventgrid\_system\_topic\_id](#output\_eventgrid\_system\_topic\_id) | The ID of the Event Grid System Topic |
| <a name="output_eventgrid_system_topic_metric_arm_resource_id"></a> [eventgrid\_system\_topic\_metric\_arm\_resource\_id](#output\_eventgrid\_system\_topic\_metric\_arm\_resource\_id) | The Metric ARM Resource ID of the Event Grid System Topic |

## Module
```
module "azure_eventgrid_system-topic" {
  source                                             = "../../modules/module_event-grid-system-topic"
  eventgrid_system_topic_name                        = var.eventgrid_system_topic_name
  location                                           = module.module_create_resource_group.resource_group_location
  resource_group_name                                = module.module_create_resource_group.resource_group_name
  source_arm_resource_id                             = var.source_arm_resource_id
  topic_type                                         = var.topic_type
  tags                                               = var.tags
  managed_identity_type                              = var.managed_identity_type
  managed_identity_ids                               = var.managed_identity_ids
  eventgrid_system_topic_event_subscription_name     = var.eventgrid_system_topic_event_subscription_name
  expiration_time_utc                                = var.expiration_time_utc
  event_delivery_schema                              = var.event_delivery_schema
  eventhub_endpoint_id                               = var.eventhub_endpoint_id
  hybrid_connection_endpoint_id                      = var.hybrid_connection_endpoint_id
  service_bus_queue_endpoint_id                      = var.service_bus_queue_endpoint_id
  service_bus_topic_endpoint_id                      = var.service_bus_topic_endpoint_id
  included_event_types                               = var.included_event_types
  labels                                             = var.labels
  advanced_filtering_on_arrays_enabled               = var.advanced_filtering_on_arrays_enabled
  function_id                                        = var.function_id
  max_events_per_batch                               = var.max_events_per_batch
  preferred_batch_size_in_kilobytes                  = var.preferred_batch_size_in_kilobytes
  queue_name                                         = var.queue_name
  storage_account_id                                 = var.storage_account_id
  queue_message_time_to_live_in_seconds              = var.queue_message_time_to_live_in_seconds
  url                                                = var.url
  base_url                                           = var.base_url
  webhook_endpoint_max_events_per_batch              = var.webhook_endpoint_max_events_per_batch
  webhook_endpoint_preferred_batch_size_in_kilobytes = var.webhook_endpoint_preferred_batch_size_in_kilobytes
  active_directory_tenant_id                         = var.active_directory_tenant_id
  active_directory_app_id_or_uri                     = var.active_directory_app_id_or_uri
  enable_subject_filter                              = var.enable_subject_filter
  subject_begins_with                                = var.subject_begins_with
  subject_ends_with                                  = var.subject_ends_with
  case_sensitive                                     = var.case_sensitive
  delivery_identity_type                             = var.delivery_identity_type
  delivery_user_assigned_identity                    = var.delivery_user_assigned_identity
  delivery_property                                  = var.delivery_property
  dead_letter_identity_type                          = var.dead_letter_identity_type
  dead_letter_user_assigned_identity                 = var.dead_letter_user_assigned_identity
  storage_blob_container_name                        = var.storage_blob_container_name
  max_delivery_attempts                              = var.max_delivery_attempts
  event_time_to_live                                 = var.event_time_to_live
}
```
<!-- END_TF_DOCS -->