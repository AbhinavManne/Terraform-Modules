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

variable "servicebus_queue_name" {
  type        = string
  description = "Specifies the name of the ServiceBus Queue resource. Changing this forces a new resource to be created."
}

variable "lock_duration" {
  type        = string
  default     = "PT1M"
  description = "The ISO 8601 timespan duration of a peek-lock; that is, the amount of time that the message is locked for other receivers. Maximum value is 5 minutes."
}

variable "max_message_size_in_kilobytes" {
  type        = number
  default     = null
  description = "Integer value which controls the maximum size of a message allowed on the queue for Premium SKU."
}

variable "max_size_in_megabytes" {
  type        = number
  default     = 1024
  description = "Integer value which controls the size of memory allocated for the queue."
}

variable "requires_duplicate_detection" {
  type        = bool
  default     = false
  description = "Boolean flag which controls whether the Queue requires duplicate detection. Changing this forces a new resource to be created."
}

variable "requires_session" {
  type        = bool
  default     = false
  description = "Boolean flag which controls whether the Queue requires sessions. This will allow ordered handling of unbounded sequences of related messages. With sessions enabled a queue can guarantee first-in-first-out delivery of messages. Changing this forces a new resource to be created."
}

variable "default_message_ttl" {
  type        = string
  default     = null
  description = "The ISO 8601 timespan duration of the TTL of messages sent to this queue. This is the default value used when TTL is not set on message itself."
}

variable "dead_lettering_on_message_expiration" {
  type        = bool
  default     = false
  description = "Boolean flag which controls whether the Queue has dead letter support when a message expires."
}

variable "duplicate_detection_history_time_window" {
  type        = string
  default     = "PT10M"
  description = "The ISO 8601 timespan duration during which duplicates can be detected."
}

variable "max_delivery_count" {
  type        = number
  default     = 10
  description = "Integer value which controls when a message is automatically dead lettered."
}

variable "status" {
  type        = string
  default     = "Active"
  description = "The status of the Queue. Possible values are <i>Active, Creating, Deleting, Disabled, ReceiveDisabled, Renaming, SendDisabled, Unknown."
}

variable "enable_batched_operations" {
  type        = bool
  default     = true
  description = "Boolean flag which controls whether server-side batched operations are enabled."
}

variable "auto_delete_on_idle" {
  type        = string
  default     = null
  description = "The ISO 8601 timespan duration of the idle interval after which the Queue is automatically deleted, minimum of 5 minutes."
}

variable "enable_partitioning" {
  type        = bool
  default     = false
  description = "Boolean flag which controls whether to enable the queue to be partitioned across multiple message brokers. Changing this forces a new resource to be created."
}

variable "enable_express" {
  type        = bool
  default     = false
  description = "Boolean flag which controls whether Express Entities are enabled. An express queue holds a message in memory temporarily before writing it to persistent storage. For Premium, it MUST be set to false."
}

variable "forward_to" {
  type        = string
  default     = null
  description = " The name of a Queue or Topic to automatically forward messages to."
}

variable "forward_dead_lettered_messages_to" {
  type        = string
  default     = null
  description = "The name of a Queue or Topic to automatically forward dead lettered messages to."
}

variable "servicebus_queue_authorization_rule_name" {
  type        = string
  description = "Specifies the name of the Authorization Rule. Changing this forces a new resource to be created."
}

variable "listen" {
  type        = bool
  default     = false
  description = "Does this Authorization Rule have Listen permissions to the ServiceBus Queue? At least one of the 3 permissions - listen, send and manage - needs to be set."
}

variable "send" {
  type        = bool
  default     = false
  description = "Does this Authorization Rule have Send permissions to the ServiceBus Queue? At least one of the 3 permissions - listen, send and manage - needs to be set."
}

variable "manage" {
  type        = bool
  default     = false
  description = "Does this Authorization Rule have Manage permissions to the ServiceBus Queue? When this property is true - both listen and send must be too. At least one of the 3 permissions - listen, send and manage - needs to be set."
}