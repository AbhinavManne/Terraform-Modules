variable "resource_group_name" {
  type        = string
  description = "RG name in Azure"
}

variable "resource_group_location" {
  type        = string
  description = "Location of resource"
}

variable "public_ip_name" {
  type        = string
  description = "Public IP name in Azure"
}

variable "virtual_network_name" {
  type        = string
  description = "Name of the virtual network"
}

variable "virtual_network_address_prefixes" {
  type        = list(string)
  description = "Virtual Network Prefix"

}

variable "subnet_address_prefixes" {
  type        = list(string)
  description = "Subnet address prefix"
}

variable "bastion_name" {
  type        = string
  description = "Name of the Bastion Name"
}

variable "tags" {
  type        = map(any)
  description = "Tags Name"
}

variable "role_definition" {
  type    = list(any)
  default = ["reader"]
}

variable "storage_account_name" {
  type        = string
  description = "Resource Group Name"
}

variable "storage_account_tier" {
  type        = string
  description = "Storage Account Tier"
}

variable "storage_account_replication_type" {
  type        = string
  description = "Storage Account Replication Type"
}
