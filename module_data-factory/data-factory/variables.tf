#---------------------------------------------resource group variables---------------------------------------------
variable "resource_group_name" {
  type        = string
  description = "Resource group name"
}

variable "location" {
  type        = string
  description = "Resource group location"
}


#----------------------------------------------Data Factory variables----------------------------------------------
variable "data_factory_name" {
  type        = string
  description = "Specifies the name of the Data Factory"
}

variable "tags" {
  type        = map(any)
  description = "Tags"
}

variable "identity_type" {
  type        = string
  description = "Identity type (system assigned or user assigned)"
}

variable "identity_ids" {
  type        = list(string)
  description = "(optional)id of user assigned managed identity"
  default     = null
}

variable "github_configuration" {
  type        = map(any)
  description = " github_configuration block "
  default     = null
}

variable "global_parameter" {
  type = list(object({
    name  = string
    type  = string
    value = number
  }))
  description = "global parameter block in df"
  default = null
}

variable "vsts_configuration" {
  type        = map(any)
  description = " vsts_configuration block ."
  default     = null
}

variable "public_network_enabled" {
  type        = bool
  description = "Is the Data Factory visible to the public network? "
  default     = true
}

variable "managed_virtual_network_enabled" {
  type        = bool
  description = "Is Managed Virtual Network enabled?"
  default     = false
}

variable "customer_managed_key_id" {
  type        = string
  description = "Specifies the Azure Key Vault Key ID to be used as the Customer Managed Key (CMK) for double encryption. Required with user assigned identity."
  default     = null
}

variable "customer_managed_key_identity_id" {
  type        = string
  description = "Specifies the ID of the user assigned identity associated with the Customer Managed Key."
  default     = null
}