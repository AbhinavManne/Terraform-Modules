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

variable "public_network_access_enabled_for_namespace" {
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

variable "subnet_name_for_network_config" {
  type        = string
  default     = null
  description = "Name of the subnet that can access this ServiceBus Namespace."
}

variable "virtual_network_name_for_network_config" {
  type        = string
  default     = null
  description = "Virtual Network name of the subnet that can access this ServiceBus Namespace."
}

variable "subnet_resource_group_name" {
  type        = string
  description = "Resource group name of the subnet that can access this ServiceBus Namespace."
}

variable "default_action" {
  type        = string
  default     = "Deny"
  description = "Specifies the default action for the ServiceBus Namespace Network Rule Set. Possible values are Allow and Deny."
}

variable "public_network_access_enabled_for_namespace_network_rule_set" {
  type    = bool
  default = true
  description = "Whether to allow traffic over public network."
}

variable "trusted_services_allowed" {
  type        = bool
  default     = false
  description = "If True, then Azure Services that are known and trusted for this resource type are allowed to bypass firewall configuration."
}

variable "ip_rules" {
  type        = list(string)
  default     = null
  description = "One or more IP Addresses, or CIDR Blocks which should be able to access the ServiceBus Namespace."
}

variable "network_rules_config" {
  type = list(object({
    subnet_id                            = string
    ignore_missing_vnet_service_endpoint = bool
  }))
  default = [{
    ignore_missing_vnet_service_endpoint = true
    subnet_id                            = null
  }]
  description = "Network rules for this servicebus namespace."
}

