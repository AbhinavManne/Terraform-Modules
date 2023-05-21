#------------------------------------resource group variables--------------------------------------------
variable "resource_group" {
  type        = string
  description = "Resource group name"
}
variable "location" {
  type        = string
  description = "Resource group location"
}
variable "create_resource_group" {
  type        = bool
  description = "Need Resource group resource or resource group data source ? "
}

#------------------------------------Virtual Network variables--------------------------------------------
variable "virtual_network_name" {
  type        = string
  description = "Name of the virtual network in azure"
}

variable "address_space" {
  type        = list(string)
  description = "List of address space of the virtual network"
}

#------------------------------------resource group variables--------------------------------------------
variable "subnet_name" {
  type        = string
  description = "subnet name in azure"
}

variable "address_prefixes" {
  type        = list(string)
  description = "List of address prefixes of the subnet"
}

#------------------------------------------HPC Cache variables--------------------------------------------
variable "hpc_cache_name" {
  type        = string
  description = "hpc cache name"
}

variable "cache_size_in_gb" {
  type        = number
  description = "size of cache in gb"
}

variable "sku_name" {
  type        = string
  description = "name of sku"
}

variable "policy1" {
  type        = string
  description = "name of the policy"
}

variable "scope" {
  type        = string
  description = "scope in access rule"
}

variable "access" {
  type        = string
  description = "access"
}
variable "tags" {
  type        = map(any)
  description = "Tags"
}
#--------------------------------------------Storage Account variables-----------------------------------------------
variable "storage_account_name" {
  type        = string
  description = "storage account name"
}
variable "account_tier" {
  type        = string
  description = "storage account tier"
}
variable "account_replication_type" {
  type        = string
  description = "storage account replication type"
}