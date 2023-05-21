variable "resource_group_name" {
  type        = string
  description = "The name of the resource group in which to create the namespace."
}

variable "location" {
  type        = string
  description = "Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
}

variable "servicebus_namespace_name" {
  type        = string
  description = "Specifies the name of the ServiceBus Namespace resource . Changing this forces a new resource to be created."
}

variable "sku" {
  type        = string
  description = "Defines which tier to use. Options are Basic, Standard or Premium. Setting this field to Premium will force the creation of a new resource."
}

variable "identity_config" {
  type = list(object({
    type         = string
    identity_ids = list(string)
  }))
  default = [{
    identity_ids = null
    type         = "SystemAssigned"
  }]
  description = "Identity configuration settings for the type of Managed Service Identity that should be configured on this ServiceBus Namespace."
}

variable "capacity" {
  type        = number
  default     = 0
  description = "Specifies the capacity. When sku is Premium, capacity can be 1, 2, 4, 8 or 16. When sku is Basic or Standard, capacity can be 0 only."
}

variable "customer_managed_key_config" {
  type = list(object({
    key_vault_key_id                  = string
    identity_id                       = string
    infrastructure_encryption_enabled = bool
  }))
  default = [{
    identity_id                       = null
    infrastructure_encryption_enabled = false
    key_vault_key_id                  = null
  }]
  description = "Customer Managed Key Encryption configuration settings for encrypting the data in this ServiceBus Namespace. Once customer-managed key encryption has been enabled, it cannot be disabled."
}

variable "local_auth_enabled" {
  type        = bool
  default     = false
  description = "Whether or not SAS authentication is enabled for the Service Bus namespace."
}

variable "public_network_access_enabled" {
  type        = bool
  default     = false
  description = "Is public network access enabled for the Service Bus Namespace?"
}

variable "minimum_tls_version" {
  type        = string
  default     = "1.2"
  description = "The minimum supported TLS version for this Service Bus Namespace. Valid values are: 1.0, 1.1 and 1.2"
}

variable "zone_redundant" {
  type        = bool
  default     = false
  description = "Whether or not this resource is zone redundant. sku needs to be Premium."
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resource."
}

variable "servicebus_topic_name" {
  type        = string
  description = "Specifies the name of the ServiceBus Topic resource. Changing this forces a new resource to be created."
}

variable "status" {
  type        = string
  default     = "Active"
  description = "The Status of the Service Bus Topic. Acceptable values are Active or Disabled."
}

variable "auto_delete_on_idle" {
  type        = string
  default     = null
  description = "The ISO 8601 timespan duration of the idle interval after which the Topic is automatically deleted, minimum of 5 minutes."
}

variable "default_message_ttl" {
  type        = string
  default     = null
  description = "The ISO 8601 timespan duration of TTL of messages sent to this topic if no TTL value is set on the message itself."
}

variable "duplicate_detection_history_time_window" {
  type        = string
  default     = "PT10M"
  description = "The ISO 8601 timespan duration during which duplicates can be detected."
}

variable "enable_batched_operations" {
  type        = bool
  default     = false
  description = "Boolean flag which controls if server-side batched operations are enabled."
}

variable "enable_express" {
  type        = bool
  default     = false
  description = "Boolean flag which controls whether Express Entities are enabled. An express topic holds a message in memory temporarily before writing it to persistent storage."
}

variable "enable_partitioning" {
  type        = bool
  default     = false
  description = "Boolean flag which controls whether to enable the topic to be partitioned across multiple message brokers. Changing this forces a new resource to be created. Partitioning is available at entity creation for all queues and topics in Basic or Standard SKUs. It is not available for the Premium messaging SKU, but any previously existing partitioned entities in Premium namespaces continue to work as expected."
}

variable "max_message_size_in_kilobytes" {
  type        = number
  default     = null
  description = "Integer value which controls the maximum size of a message allowed on the topic for Premium SKU."
}

variable "max_size_in_megabytes" {
  type        = number
  default     = 1024
  description = "Integer value which controls the size of memory allocated for the topic."
}

variable "requires_duplicate_detection" {
  type        = bool
  default     = false
  description = "Boolean flag which controls whether the Topic requires duplicate detection. Changing this forces a new resource to be created."
}

variable "support_ordering" {
  type        = bool
  default     = false
  description = "Boolean flag which controls whether the Topic supports ordering."
}