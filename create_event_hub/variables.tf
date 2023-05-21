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
  default     = 1
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
variable "key_vault_key_id_user" {
  description = "The id of the key directly provided by the user"
  type        = any
  default     = null
}



variable "provide_keyvault_key_id" {
  description = "Specifies whether the keyvault key id is provided by the user or not"
  type        = bool
  default     = false
}


variable "keyvault_id" {
  type        = string
  description = "Keyvault ID"
}


variable "dynamickeyname" {
  description = "Specifies the name of the dynamic key which needs to be created"
  type        = string
  default     = "default-key"
}


############################# Event Hub Resource ####################################
variable "event_hubs" {
  description = "Specifies the eventhub for a particular eventhub namespace resource"
  type = map(object({
    event_hub_name    = string,
    partition_count   = string,
    message_retention = number,
    capture_description = list(object({
      enabled             = bool,
      encoding            = string,
      interval_in_seconds = number,
      size_limit_in_bytes = number,
      skip_empty_archives = bool,
      destination = list(object({
        name                = string,
        archive_name_format = string,
        blob_container_name = string,
        storage_account_id  = string
      }))
    })),
    status = string
  }))
  default = {
    "event-hub-1" = {
      capture_description = [{
        destination = [{
          archive_name_format = "{Namespace}/{EventHub}/{PartitionId}/{Year}/{Month}/{Day}/{Hour}/{Minute}/{Second}"
          blob_container_name = "eventhubcontainer"
          name                = "EventHubArchive.AzureBlockBlob"
          storage_account_id  = "/subscriptions/eeab8781-7893-428d-a24d-477cd05fc384/resourceGroups/azure-cil-manual-resource-group/providers/Microsoft.Storage/storageAccounts/storagegroup2001"
        }]
        enabled             = true
        encoding            = "Avro"
        interval_in_seconds = 300
        size_limit_in_bytes = 314572800
        skip_empty_archives = false
      }]
      event_hub_name    = "cil-automated-event-hub-test"
      message_retention = 1
      partition_count   = 2
      status            = "Active"
    }
  }
}


variable "event_hub_resource_namespace_name" {
  description = "The name of the namespace under which the eventhubs needs to be created"
  type        = string
}

variable "use_same_eventhub_namespace" {
  description = "The flag for whether creating the eventhub namespaces under the same eventhub namespace resource. Uses a boolean flag of true or false"
  type        = bool

}

# Event Hub Namespace Disaster Recovery Partner Namespace

variable "event_hub_namespace_name_partner" {
  description = "Specifies the name of the EventHub Namespace resource. Changing this forces a new resource to be created."
  type        = string
}

variable "resource_group_name_partner" {
  description = "The name of the resource group in which to create the namespace. Changing this forces a new resource to be created."
  type        = string
}

variable "location_partner" {
  description = "Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created"
  type        = string
}

variable "event_hub_sku_partner" {
  description = "Defines which tier to use. Valid options are Basic, Standard, and Premium. Please note that setting this field to Premium will force the creation of a new resource and also requires setting zone_redundant to true."
  type        = string
}

variable "event_hub_capacity_partner" {
  description = "Specifies the Capacity / Throughput Units for a Standard SKU namespace. Default capacity has a maximum of 2, but can be increased in blocks of 2 on a committed purchase basis."
  type        = number
  default     = 2
}

variable "auto_inflate_enabled_partner" {
  description = "Is Auto Inflate enabled for the EventHub Namespace?"
  type        = bool
  default     = false
}

variable "dedicated_cluster_id_partner" {
  description = "Specifies the ID of the EventHub Dedicated Cluster where this Namespace should created. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "identity_partner" {
  description = "An identity block as defined below."
  type = list(object({
    type = string
  }))
  default = [{
    type = "SystemAssigned"
  }]
}

variable "maximum_thoroughput_units_partner" {
  description = "Specifies the maximum number of throughput units when Auto Inflate is Enabled. Valid values range from 1 - 20."
  type        = number
  default     = 1
}

variable "zone_redundant_partner" {
  description = "Specifies if the EventHub Namespace should be Zone Redundant (created across Availability Zones). Changing this forces a new resource to be created. Defaults to false."
  type        = bool
  default     = false
}

variable "tags_partner" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default = {
    Contact_name     = "xyz"
    Cost_Center      = 999
    Application_name = "event hub"
  }
}

variable "network_rulesets_partner" {
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
  default = null
}

variable "local_authentication_enabled_partner" {
  description = "Is SAS authentication enabled for the EventHub Namespace?"
  type        = bool
  default     = false
}

variable "public_network_access_enabled_partner" {
  description = "Is public network access enabled for the EventHub Namespace? Defaults to true."
  type        = bool
  default     = true
}

variable "minimum_tls_version_partner" {
  description = "The minimum supported TLS version for this EventHub Namespace. Valid values are: 1.0, 1.1 and 1.2. The current default minimum TLS version is 1.2."
  type        = string
  default     = "1.2"
}


# ############################# Event Hub Namespace Disaster Recovery Config ###############################
variable "create_disaster_recovery_configuration" {
  description = "Specifies whether we want a disaster recovery configuration or not"
  type        = bool
  default     = false
}

variable "event_hub_namespace_disaster_recovery_config_name" {
  description = "Specifies the name of the Disaster Recovery Config. Changing this forces a new resource to be created."
  type        = string
  default     = "disaster_recovery_config"
}


variable "event_hub_namespace_disaster_recovery_config_wait_for_replication" {
  description = "Should the resource wait for replication upon creation? Defaults to false. Not Working. Can be Deprecated"
  default     = false
  type        = bool
}


variable "partner_eventhub_namespace_id" {
  description = "The id of the partner eventhub namespace where the replication typically needs to happen."
  type        = string
  default     = null
}