#-------------------------------------DATA SOURCE: RESOURCE GROUP-----------------------------------------#
variable "resource_group" {
  type        = string
  description = "RG name in Azure"
}

#-------------------------------------RESOURCE: RECOVERY SERVICES VAULT-----------------------------------#
variable "recovery_vault_name" {
  type        = string
  description = "recovery service keyvault name in Azure"
}

variable "sku" {
  type        = string
  description = "recovery service keyvault sku in Azure"
}

variable "soft_delete_enabled" {
  type        = bool
  description = "Is soft delete enable for this Vault?"
}
/*
variable "storage_mode_type" {
  type        = string
  description = " The storage type of the Recovery Services Vault. Possible values are GeoRedundant and LocallyRedundant. Defaults to GeoRedundant."
}*/

variable "identity_type" {
  type        = string
  description = "The Type of Identity which should be used for this Recovery Services Vault. At this time the only possible value is SystemAssigned."
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resource."
}

variable "backup_policy_vm_name" {
  type        = string
  description = "Backup policy vm name"
}

#-------------------------------------RESOURCE: VIRTUAL NETWORK & SUBNET---------------------------------#
variable "virtual_network" {
  type        = string
  description = "Virtual network name in Azure"
}

variable "address_space" {
  type        = list(string)
  description = "Virtual network address space in Azure"
}

variable "subnet" {
  type        = string
  description = "subnet name in Azure"
}

variable "address_prefixes" {
  type        = list(string)
  description = "address prefixes for subnet"
}

variable "enforce_private_link_service_network_policies" {
  type        = bool
  description = "enforce_private_link_service_network_policies in subnet"
}

variable "enforce_private_link_endpoint_network_policies" {
  type        = bool
  description = "enforce_private_link_endpoint_network_policies in subnet"
}
#-------------------------------------RESOURCE: PRIVATE ENDPOINT------------------------------------------#
variable "private_endpoint" {
  type        = string
  description = "Specifies the Name of the Private Endpoint. "
}

variable "private_service_connection_name" {
  type        = string
  description = "Specifies the Name of the Private Service Connection."
}

variable "is_manual_connection" {
  type        = bool
  description = "Does the Private Endpoint require Manual Approval from the remote resource owner?"
}

variable "subresources_names" {
  type        = list(string)
  description = "A list of subresource names which the Private Endpoint is able to connect to"
}

#---------------------------------------------------------------------------------------------------------#