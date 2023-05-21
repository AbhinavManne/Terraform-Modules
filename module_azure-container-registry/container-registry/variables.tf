

variable "resource_group_name" {
  type = string
  description = "A container that holds related resources for an Azure solution"

}

variable "location" {
  type = string
  description = "The location/region to keep all your network resources. To get the list of all locations with table format from azure cli, run 'az account list-locations -o table'"
}

variable "container_registry_config" {
  description = "Manages an Azure Container Registry"
  type = object({
    name                          = string
    admin_enabled                 = bool
    sku                           = string
    public_network_access_enabled = bool
    quarantine_policy_enabled     = bool
    zone_redundancy_enabled       = bool
  })
}

variable "georeplications" {
  description = "A list of Azure locations where the container registry should be geo-replicated"
  type = list(object({
    location                = string
    zone_redundancy_enabled = bool
  }))
  default = []
}

variable "network_rule_set" { # change this to match actual objects
  description = "Manage network rules for Azure Container Registries"
  type = object({
    default_action = string
    ip_rule = list(object({
      ip_range = string
    }))
    virtual_network = list(object({
      subnet_id = string
    }))
  })
  
  default = null
}

variable "retention_policy" {
  description = "Set a retention policy for untagged manifests"
  type = object({
    days    = number
    enabled = bool
  })
  default = null
}

variable "enable_content_trust" {
  type = bool
  description = "Boolean value to enable or disable Content trust in Azure Container Registry"
  default     = false
}

variable "scope_map" {
  description = "Manages an Azure Container Registry scope map. Scope Maps are a preview feature only available in Premium SKU Container registries."
  type = map(object({
    actions = list(string)
  }))
  default = null
}

variable "container_registry_webhooks" {
  description = "Manages an Azure Container Registry Webhook"
  type = map(object({
    service_uri    = string
    actions        = list(string)
    status         = string
    scope          = string
    custom_headers = map(string)
  }))
  default = null
}


variable "acr_diag_logs" {
  type = list(string)
  description = "Application Gateway Monitoring Category details for Azure Diagnostic setting"
  default     = ["ContainerRegistryRepositoryEvents", "ContainerRegistryLoginEvents"]
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}



variable "identity_type" {
  description = "The type of Managed Identity . Possible values are `SystemAssigned`, `UserAssigned` and `SystemAssigned, UserAssigned`"
  type        = string
  default     = null
}

variable "identity_ids" {
  type        = list(string)
  description = "A list of User Managed Identity ID's ."
  default     = []
}

variable "encryption" {
  description = "Encrypt registry using a customer-managed key"
  type = object({
    enabled            = bool
    key_vault_key_id   = string
    identity_client_id = string
  })
  default = null
}


variable "agent_pool" {
  description = "Manages an Azure Container Registry Webhook"
  type = map(object({
    instance_count            = number
    tier                      = string
    virtual_network_subnet_id = string
  }))
  default = null
}


variable "enabled" {
  type = bool
  default = true
  description = "(Optional) Should the Container Registry token be enabled? Defaults to true"

}

