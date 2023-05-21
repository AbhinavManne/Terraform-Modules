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

variable "resource_group_name" {
  description = "The name of the resource group in which to create the namespace. Changing this forces a new resource to be created."
  type        = string
}

variable "partner_eventhub_namespace_id" {
  description = "The id of the partner eventhub namespace where the replication typically needs to happen."
  type        = string
}

variable "event_hub_namespace_name" {
  description = "Specifies the name of the EventHub Namespace resource. Changing this forces a new resource to be created."
  type        = string
}

variable "event_hub_sku" {
  description = "Defines which tier to use. Valid options are Basic, Standard, and Premium."
  type        = string
}