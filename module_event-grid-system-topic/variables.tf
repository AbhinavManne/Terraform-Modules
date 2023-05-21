#------------------------------------resource group variables--------------------------------------------
variable "resource_group_name" {
  type        = string
  description = "Resource group name"
}
variable "location" {
  type        = string
  description = "Resource group location"
}

#-------------------------------Event grid System topic variables----------------------------------------
variable "eventgrid_system_topic_name" {
  type        = string
  description = "event grid system topic name"
}
variable "source_arm_resource_id" {
  type        = string
  description = "The ID of the Event Grid System Topic ARM Source."
}
variable "topic_type" {
  type        = string
  description = "The Topic Type of the Event Grid System Topic"
  default     = null
}
variable "tags" {
  type        = map(any)
  description = "Tags"
}

########## Identity
variable "managed_identity_type" {
  type        = string
  description = "type of Managed Identity"
}
variable "managed_identity_ids" {
  type        = list(string)
  description = "A list of User Managed Identity ID's"
  default     = null
}

#-------------------------------Event grid System topic event subscription variables----------------------------------------------
variable "eventgrid_system_topic_event_subscription_name" {
  type        = string
  description = "Name of eventgrid system topic event subscription"
}
variable "expiration_time_utc" {
  type        = string
  description = "Specifies the expiration time of the event subscription"
  default     = null
}
variable "event_delivery_schema" {
  type        = string
  description = "Specifies the event delivery schema for the event subscription"
  default     = "EventGridSchema"
}
variable "eventhub_endpoint_id" {
  type        = string
  description = "Specifies the id where the Event Hub is located"
  default     = null
}
variable "hybrid_connection_endpoint_id" {
  type        = string
  description = "Specifies the id where the Hybrid Connection is located."
  default     = null
}
variable "service_bus_queue_endpoint_id" {
  type        = string
  description = "Specifies the id where the Service Bus Queue is located."
  default     = null
}
variable "service_bus_topic_endpoint_id" {
  type        = string
  description = "Specifies the id where the Service Bus Topic is located."
  default     = null
}
variable "included_event_types" {
  type        = list(string)
  description = "A list of applicable event types that need to be part of the event subscription"
  default     = null
}
variable "labels" {
  type        = list(string)
  description = "A list of labels to assign to the event subscription"
  default     = null
}
variable "advanced_filtering_on_arrays_enabled" {
  type        = bool
  description = "Specifies whether advanced filters should be evaluated against an array of values instead of expecting a singular value"
  default     = false
}

############## azure function endpoint
variable "function_id" {
  type        = string
  description = "Specifies the ID of the Function where the Event Subscription will receive events. This must be the functions ID in format {function_app.id}/functions/{name}"
}
variable "max_events_per_batch" {
  type        = number
  description = "Maximum number of events per batch"
  default     = null
}
variable "preferred_batch_size_in_kilobytes" {
  type        = number
  description = "Preferred batch size in Kilobytes"
  default     = null
}

############## storage_queue_endpoint
variable "queue_name" {
  type        = string
  description = "Specifies the name of the storage queue where the Event Subscription will receive events"
}
variable "storage_account_id" {
  type        = string
  description = "Specifies the id of the storage account"
}
variable "queue_message_time_to_live_in_seconds" {
  type        = number
  description = "Storage queue message time to live in seconds"
  default     = null
}

############## webhook_endpoint
variable "url" {
  type        = string
  description = "Specifies the url of the webhook where the Event Subscription will receive events"
}
variable "base_url" {
  type        = string
  description = "The base url of the webhook where the Event Subscription will receive events"
  default     = null
}
variable "webhook_endpoint_max_events_per_batch" {
  type        = number
  description = "Maximum number of events per batch"
  default     = null
}
variable "webhook_endpoint_preferred_batch_size_in_kilobytes" {
  type        = number
  description = "Preferred batch size in Kilobytes"
  default     = null
}
variable "active_directory_tenant_id" {
  type        = string
  description = "The Azure Active Directory Tenant ID to get the access token that will be included as the bearer token in delivery requests"
  default     = null
}
variable "active_directory_app_id_or_uri" {
  type        = string
  description = "The Azure Active Directory Application ID or URI to get the access token that will be included as the bearer token in delivery requests"
  default     = null
}

############## subject_filter
variable "enable_subject_filter" {
  type        = bool
  description = "Whether to enable subject filter"
  default     = null
}
variable "subject_begins_with" {
  type        = string
  description = "A string to filter events for an event subscription based on a resource path prefix"
  default     = null
}
variable "subject_ends_with" {
  type        = string
  description = "A string to filter events for an event subscription based on a resource path suffix"
  default     = null
}
variable "case_sensitive" {
  type        = bool
  description = "Specifies if subject_begins_with and subject_ends_with case sensitive"
  default     = false
}

############## delivery_identity
variable "delivery_identity_type" {
  type        = string
  description = "Specifies the type of Managed Service Identity that is used for event delivery"
}
variable "delivery_user_assigned_identity" {
  type        = string
  description = "The user identity associated with the resource"
  default     = null
}

############## delivery_property
variable "delivery_property" {
  type = list(object({
    header_name  = string
    type         = string
    value        = string
    source_field = string
    secret       = bool
  }))
  description = "Delivery Property block"
}

############## dead_letter_identity
variable "dead_letter_identity_type" {
  type        = string
  description = "Specifies the type of Managed Service Identity that is used for dead lettering"
}
variable "dead_letter_user_assigned_identity" {
  type        = string
  description = "The user identity associated with the resource."
  default     = null
}
############## storage_blob_dead_letter_destination
variable "enable_storage_blob_dead_letter_destination" {
  type        = string
  description = "Whether to enable storage blob dead letter destination"
  default     = null
}

variable "storage_blob_container_name" {
  type        = string
  description = "Specifies the name of the Storage blob container that is the destination of the deadletter events"
}

############## retry_policy
variable "max_delivery_attempts" {
  type        = string
  description = "Specifies the maximum number of delivery retry attempts for events"
}
variable "event_time_to_live" {
  type        = number
  description = "Specifies the time to live (in minutes) for events"
}