variable "resource_group_name" {
  type        = string
  description = "RG name in Azure"
}

variable "account_name" {
  type        = string
  description = "netapp account name in Azure"
}



variable "pool_name" {
  type        = string
  description = "netapp pool name in Azure"
}


variable "virtual_network_primary" {
  type        = string
  description = "vnet name in Azure"
}



variable "primary_subnet" {
  type        = string
  description = "subnet name in Azure"
}



variable "service_level" {
  type        = string
  description = "the target performance of the file system."
}

variable "size_in_tb" {
  type        = number
  description = "Provisioned size of the pool in TB"
}

variable "netapp_volume_primary" {
  type        = string
  description = "The name of the NetApp Volume."
}



variable "volume_path" {
  type        = string
  description = "A unique file path for the volume."
}

variable "protocols" {
  type        = list(any)
  description = "The target volume protocol expressed as a list."
}


variable "security_style" {
  type        = string
  description = "Volume security style, accepted values are Unix or Ntfs"
}

variable "storage_quota_in_gb" {
  type        = number
  description = "The maximum Storage Quota allowed for a file system in Gigabytes."
}

variable "address_prefixes1" {
  type        = list(string)
  description = "The address prefix to use for the subnet."
}

variable "address_prefixes2" {
  type        = list(string)
  description = "The address prefix to use for the subnet."
}

variable "delegation_name" {
  type        = string
  description = "delegation name"
}

variable "service_delegation_name" {
  type        = string
  description = "service delegation for subnet"
}

variable "actions" {
  type        = list(any)
  description = "A list of Actions which should be delegated."
}

variable "location" {
  type        = string
  description = "The Azure location where the secondary volume will be created."
}

variable "endpoint_type" {
  type        = string
  description = "The endpoint type, default value is dst for destination."
}

variable "replication_frequency" {
  type        = string
  description = "Replication frequency, supported values are '10minutes', 'hourly', 'daily', values are case sensitive."
}

variable "network_features" {
  type        = string
  description = "Indicates which network feature to use, accepted values are Basic or Standard, it defaults to Basic"
  default     = "basic"
}

variable "export_policy_rule" {
  description = "list of values to assign to subnets"
  type = list(object({
    rule_index           = number
    allowed_clients = list(any)
    protocols_enabled = list(any)
    unix_read_only = bool
    unix_read_write = bool 

  }))
}

variable "tags" {
  type        = map(any)
  description = "Tags"
}