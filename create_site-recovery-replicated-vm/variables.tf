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
variable "virtual_machine_name" {
  type        = string
  description = "Virtual Machine Name in Azure"
}

variable "virtual_machine_location" {
  type        = string
  description = "Virtual Machine location in Azure"
}

variable "vm_size" {
  type        = string
  description = "Virtual Machine size in Azure"
}

variable "publisher" {
  type        = string
  description = "Virtual Machine publisher in Azure"
}
variable "offer" {
  type        = string
  description = "Virtual Machine offer in Azure"
}
variable "vm_sku" {
  type        = number
  description = "Virtual Machine sku in Azure"
}
variable "latest_version" {
  type        = string
  description = "Virtual Machine latest version in Azure"
}

variable "storage_os_disk" {
  type        = string
  description = "Virtual Machine storage disk in Azure"
}
variable "caching" {
  type        = string
  description = "Virtual Machine caching in Azure"
}
variable "create_option" {
  type        = string
  description = "Virtual Machine create option in Azure"
}
variable "managed_disk_type" {
  type        = string
  description = "Virtual Machine managed disk type in Azure"
}

variable "os_profile" {
  type        = string
  description = "Virtual Machine os profile in Azure"
}
variable "admin_username" {
  type        = string
  description = "Virtual Machine admin username in Azure"
}
variable "admin_password" {
  type        = string
  description = "Virtual Machine admin password in Azure"
}

variable "disable_password_authentication" {
  type        = bool
  description = "Virtual Machine disable password authentication in Azure"
}
#############################################################################

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
variable "azurerm_storage_account_name" {
  type        = string
  description = "storage account name in Azure"
}
variable "account_tier" {
  type        = string
  description = "storage account tier in Azure"
}
variable "account_replication_type" {
  type        = string
  description = "account replication type in Azure"
}
#########################################################
variable "virtual_network_name1" {
  type        = string
  description = "primary virtual network name in Azure"
}
variable "virtual_network_address_space1" {
  type        = list(string)
  description = "primary virtual network address space in Azure"
}
########################################################
variable "virtual_network_name2" {
  type        = string
  description = "secondary virtual network name in Azure"
}
variable "virtual_network_address_space2" {
  type        = list(string)
  description = "secondary virtual network address space in Azure"
}
#########################################################
variable "subnet_name1" {
  type        = string
  description = "primary subnet name in azure"
}
variable "subnet_address_prefixes1" {
  type        = list(string)
  description = "primary subnet address prefixes in Azure"
}
########################################################
variable "subnet_name2" {
  type        = string
  description = "secondary subnet name in Azure"
}
variable "subnet_address_prefixes2" {
  type        = list(string)
  description = "secondary subnet address prefixes in Azure"
}
#######################################################
variable "public_ip_name1" {
  type        = string
  description = "primary public ip name in Azure"
}
variable "allocation_method1" {
  type        = string
  description = "primary public ip allocation method in Azure"
}
variable "public_ip_sku1" {
  type        = string
  description = "primary public ip sku in Azure"
}
##########################################################
variable "public_ip_name2" {
  type        = string
  description = "secondary public ip name in Azure"
}
variable "allocation_method2" {
  type        = string
  description = "secondary public ip allocation method in Azure"
}
variable "public_ip_sku2" {
  type        = string
  description = "secondary public ip sku in Azure"
}
#########################################################
variable "network_interface_name" {
  type        = string
  description = "network interface name in Azure"
}
variable "network_interface_ip_config_name" {
  type        = string
  description = "network interface ip config name in Azure"
}
variable "network_interface_ip_config_private_ip_address_allocation" {
  type        = string
  description = "network interface ip config private ip address allocation in Azure"
}
######################################################
variable "recovery_network_mapping_name" {
  type        = string
  description = "recovery network mapping name in Azure"
}
#######################################################
variable "site_recovery_replicated_vm_name" {
  type        = string
  description = "site recovery replicated vm name in Azure"
}
variable "site_recovery_replicated_vm_target_disk_type" {
  type        = string
  description = "site recovery replicated vm target disk type in Azure"
}
variable "site_recovery_replicated_vm_target_replica_disk_type" {
  type        = string
  description = "site recovery replicated vm target replica disk type in Azure"
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
