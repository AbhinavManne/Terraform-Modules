variable "event_hub_namespace_name" {
  description = "Specifies the name of the EventHub Namespace resource. Changing this forces a new resource to be created."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the namespace. Changing this forces a new resource to be created."
  type        = string
}

variable "location" {
  description = "Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created"
  type        = string
}

variable "event_hub_sku" {
  description = "Defines which tier to use. Valid options are Basic, Standard, and Premium. Please note that setting this field to Premium will force the creation of a new resource and also requires setting zone_redundant to true."
  type        = string
}

variable "event_hub_capacity" {
  description = "Specifies the Capacity / Throughput Units for a Standard SKU namespace. Default capacity has a maximum of 2, but can be increased in blocks of 2 on a committed purchase basis."
  type        = number
  default     = 2
}

variable "auto_inflate_enabled" {
  description = "Is Auto Inflate enabled for the EventHub Namespace?"
  type        = bool
  default     = false
}

variable "dedicated_cluster_id" {
  description = "Specifies the ID of the EventHub Dedicated Cluster where this Namespace should created. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "identity" {
  description = "An identity block as defined below."
  type = list(object({
    type = string
  }))
  default = [{
    type = "SystemAssigned"
  }]
}

variable "maximum_thoroughput_units" {
  description = "Specifies the maximum number of throughput units when Auto Inflate is Enabled. Valid values range from 1 - 20."
  type        = number
  default     = 0
}

variable "zone_redundant" {
  description = "Specifies if the EventHub Namespace should be Zone Redundant (created across Availability Zones). Changing this forces a new resource to be created. Defaults to false."
  type        = bool
  default     = false
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default = {
    Contact_name     = "xyz"
    Cost_Center      = 999
    Application_name = "event hub"
  }
}

variable "network_rulesets" {
  description = "A network_rulesets block as defined below."
  type = list(object({
    default_action                 = string,
    public_network_access          = bool,
    trusted_service_access_enabled = string,
    virtual_network_rule = list(object({
      subnet_id                                       = string,
      ignore_missing_virtual_network_service_endpoint = bool
    })),
    ip_rule = list(object({
      ip_mask = string,
      action  = string
    }))
  }))
  default = [{
    default_action                 = "Deny",
    public_network_access          = true,
    trusted_service_access_enabled = true,
    virtual_network_rule = [
      {
        subnet_id                                       = "/subscriptions/eeab8781-7893-428d-a24d-477cd05fc384/resourceGroups/azure-cil-manual-resource-group/providers/Microsoft.Network/virtualNetworks/vneteventhub/subnets/testsubnet",
        ignore_missing_virtual_network_service_endpoint = false
      }
    ]
    ip_rule = [{
      action  = "Allow",
      ip_mask = "20.235.192.128"
      }
    ]
  }]
}

variable "local_authentication_enabled" {
  description = "Is SAS authentication enabled for the EventHub Namespace?"
  type        = bool
  default     = false
}

variable "public_network_access_enabled" {
  description = "Is public network access enabled for the EventHub Namespace? Defaults to true."
  type        = bool
  default     = true
}

variable "minimum_tls_version" {
  description = "The minimum supported TLS version for this EventHub Namespace. Valid values are: 1.0, 1.1 and 1.2. The current default minimum TLS version is 1.2."
  type        = string
  default     = "1.2"
}

########################  Event Hub Namespace Customer Managed Key #############################
variable "use_customer_managed_key" {
  description = "Specifies whether a customer managed key needs to be utilized or not"
  type        = bool
  default     = false
}

variable "key_vault_key_ids" {
  type        = list(any)
  description = "The list of keys of Key Vault."
}

########################  Event Hub Namespace Customer Managed Policy #############################

variable "keyvault_id" {
  type        = string
  description = "Keyvault ID"
  default     = null
}

