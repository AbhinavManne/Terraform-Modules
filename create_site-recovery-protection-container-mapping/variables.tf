variable "resource_group_name1" {
  type        = string
  description = "primary Resource group name in Azure"
}
variable "resource_group_location1" {
  type        = string
  description = "primary Resource group location in Azure"
}
##################################################################
variable "resource_group_name2" {
  type        = string
  description = "secondary Resource group name in Azure"
}

variable "resource_group_location2" {
  type        = string
  description = "secondary resource group location in Azure"
}

##################################################################

variable "recovery_services_vault_name" {
  type        = string
  description = "recovery services vault name in Azure"
}
variable "recovery_services_vault_sku" {
  type        = string
  description = "recovery services vault sku in Azure"
}
############################################################################

variable "site_recovery_fabric_name1" {
  type        = string
  description = "primary site recovery fabric name in Azure"
}
########################################################
variable "site_recovery_fabric_name2" {
  type        = string
  description = "secondary site recovery fabric name in Azure"
}
########################################################
variable "protection_container1" {
  type        = string
  description = "primary protection container name in Azure"
}
########################################################
variable "protection_container2" {
  type        = string
  description = "secondary protection container name in Azure"
}
#######################################################
variable "site_recovery_replication_policy_name" {
  type        = string
  description = "site recovery replication policy name in Azure"
}
########################################################
variable "site_recovery_protection_container_mapping_name" {
  type        = string
  description = "site recovery protection container mapping name in Azure"
}
########################################################
variable "tags" {
  description = "Tag Name"
  type        = map(any)
}
variable "role_definition" {
  type    = list(any)
  default = ["reader"]
}
########################################################
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
########################################################
variable "virtual_network" {
  type        = string
  description = "Virtual network name in Azure"
}
variable "address_space" {
  type        = list(string)
  description = ""
}
########################################################
variable "subnet_name" {
  type        = string
  description = "Name of the subnet in virtual network"
}
variable "private_subnet_address_prefix" {
  type        = list(string)
  description = "The name of the subnet for private endpoints"
}
variable "enforce_private_link_endpoint_network_policies" {
  type        = string
  description = ""
}
variable "enable_private_endpoint" {
  type        = string
  description = "Manages a Private Endpoint to Azure database for MySQL"
}
variable "private_endpoint_name" {
  type        = string
  description = "Name of private endpoint"
}
variable "private_service_connection_name" {
  type        = string
  description = "Name of private_service_connection"
}
variable "is_manual_connection" {
  type        = string
  description = "is_manual_connection true or false"
}
variable "subresource_names" {
  type        = list(string)
  description = "Subresources name"
}
