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

variable "servicebus_namespace_authorization_name" {
  type        = string
  description = "Specifies the name of the ServiceBus Namespace Authorization Rule resource. Changing this forces a new resource to be created."
}

variable "listen" {
  type        = bool
  default     = false
  description = "Grants listen access to this this Authorization Rule."
}

variable "send" {
  type        = bool
  default     = false
  description = "Grants send access to this this Authorization Rule."
}

variable "manage" {
  type        = bool
  default     = false
  description = "Grants manage access to this this Authorization Rule. When this property is true - both listen and send must be too."
}