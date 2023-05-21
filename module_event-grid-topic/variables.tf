#------------------------------------resource group variables--------------------------------------------
variable "resource_group_name" {
  type        = string
  description = "Resource group name"
}
variable "location" {
  type        = string
  description = "Resource group location"
}
#-------------------------------Event grid topic variables----------------------------------------------
variable "eventgrid_topic_name" {
  type        = string
  description = "event grid topic name"
}

variable "input_schema" {
  type        = string
  description = "specifies the schema in which incoming events will be published to this domain"
  default     = "eventgridschema"
}

variable "public_network_access_enabled" {
  type        = bool
  description = "Whether or not public network access is allowed for this server"
  default     = true
}

variable "local_auth_enabled" {
  type        = bool
  description = "Whether local authentication methods is enabled for the EventGrid topic"
  default     = true
}

variable "tags" {
  type        = map(any)
  description = "Tags"
}

######### Identity
variable "managed_identity_type" {
  type        = string
  description = "type of Managed Identity"
}
variable "managed_identity_ids" {
  type        = list(string)
  description = "A list of User Managed Identity ID's"
  default     = null
}

######### input mapping fields
variable "enable_input_mapping_fields" {
  type        = bool
  description = "Whether to enable input mapping fields block"
  default     = null
}
variable "input_mapping_fields_id" {
  type        = string
  description = "Specifies the id of the EventGrid Event to associate with the domain"
  default     = null
}
variable "input_mapping_fields_topic" {
  type        = string
  description = " Specifies the topic of the EventGrid Event to associate with the domain"
  default     = null
}
variable "input_mapping_fields_event_type" {
  type        = string
  description = "Specifies the event type of the EventGrid Event to associate with the domain"
  default     = null
}
variable "input_mapping_fields_time" {
  type        = string
  description = "Specifies the event time of the EventGrid Event to associate with the domain"
  default     = null
}
variable "input_mapping_fields_data_version" {
  type        = string
  description = "Specifies the data version of the EventGrid Event to associate with the domain"
  default     = null
}
variable "input_mapping_fields_subject" {
  type        = string
  description = "Specifies the subject of the EventGrid Event to associate with the domain"
  default     = null
}

######### input mapping default values
variable "enable_input_mapping_default_values" {
  type        = bool
  description = "Whether to enable input mapping default values block"
  default     = null
}
variable "input_mapping_default_values_event_type" {
  type        = string
  description = "Specifies the default event type of the EventGrid Event to associate with the domain"
  default     = null
}
variable "input_mapping_default_values_data_version" {
  type        = string
  description = "Specifies the default data version of the EventGrid Event to associate with the domain"
  default     = null
}
variable "input_mapping_default_values_data_subject" {
  type        = string
  description = "Specifies the default subject of the EventGrid Event to associate with the domain"
  default     = null
}

######### inbound ip rule
variable "inbound_ip_rule" {
  type = list(object({
    ip_mask = string
    action  = string
  }))
  description = "Inbound ip rules block"
}

