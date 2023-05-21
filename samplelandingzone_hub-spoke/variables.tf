#hub variables
variable "resource_group_name" {
  type        = string
  description = "Resource group name of the virtual network"
}
variable "resource_group_location" {
  type        = string
  description = "Location of the vnet resource group"
}
variable "hub_virtual_network_name" {
  type        = string
  description = "Name of the virtual network"
}
variable "hub_virtual_network_address_space" {
  type        = list(string)
  description = "address space of the virtual network"
}
variable "gateway_subnet_address_prefixes" {
  type        = list(string)
  description = "List of address prefixes of the gateway subnet"
}
variable "firewall_subnet_address_prefixes" {
  type        = list(string)
  description = "List of address prefixes of the firewall subnet"
}
variable "public_ip_sku" {
  type        = string
  description = "Public IP SKU in Azure"
}
variable "public_ip_allocation_method" {
  type        = string
  description = "Public IP allocation_method"
}
variable "virtualnetworkgateway_name" {
  type        = string
  description = "Virtual network gateway name"
}
variable "firewall_name" {
  type        = string
  description = "Firewall name in Azure"
}

#spoke variables
variable "spoke_virtual_network_name" {
  type        = string
  description = "Name of the virtual network"
}
variable "spoke_virtual_network_address_space" {
  type        = list(string)
  description = "address space of the virtual network"
}

variable "recovery_vault_name" {
  type        = string
  description = "recovery service keyvault name in Azure"
}

variable "keyvault_name" {
  type        = string
  description = "Keyvault name in Azure"
}

variable "storage_account_name" {
  type        = string
  description = "storage account name in Azure"
}
variable "storage_account_tier" {
  type        = string
  description = "storage account tier in Azure"
}
variable "storage_account_replication_type" {
  type        = string
  description = "storage account replication type in Azure"
}

variable "log_workspace_name" {
  type        = string
  description = "Name of the log analytics workspace"
}
variable "sku" {
  type        = string
  description = "Stock Keeping Unit"
}
variable "retention_in_days" {
  type        = number
  description = "No. of days for retention of the workspace"
}

variable "app_service_plan_name" {
  type        = string
  description = "Name of the app service plan"
}
variable "app_service_plan_sku_tier" {
  type        = string
  description = "Pricing tier of the app service plan"
}
variable "app_service_plan_sku_size" {
  type        = string
  description = "Instance size of the app service plan"
}

variable "app_service_name" {
  type        = string
  description = "Name of the app service"
}

variable "appservice_subnet_address_prefixes" {
  type        = list(string)
  description = "List of address prefixes of the app service subnet"
}
variable "database_subnet_address_prefixes" {
  type        = list(string)
  description = "List of address prefixes of the db subnet"
}

#sql server db variables
variable "sqlserver_name" {
  description = "SQL server Name"
  default     = ""
}
variable "database_name" {
  description = "The name of the database"
  default     = ""
}
variable "sql_database_edition" {
  description = "The edition of the database to be created"
  default     = "Standard"
}
variable "sqldb_service_objective_name" {
  description = " The service objective name for the database"
  default     = "S1"
}
variable "enable_threat_detection_policy" {
  description = ""
  default     = false
}
variable "log_retention_days" {
  description = "Specifies the number of days to keep in the Threat Detection audit logs"
  default     = "30"
}
variable "email_addresses_for_alerts" {
  description = "A list of email addresses which alerts should be sent to."
  type        = list(any)
  default     = []
}
variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

#network interface variables
variable "ip_configuration_name" {
  type        = string
  description = "IP configuration name in Azure"
}


#vnet peering variables
variable "hubtospoke_vnet_peering_name" {
  type        = string
  description = "Name of virtual network peering 1 to 2"
}
variable "spoketohub_vnet_peering_name" {
  type        = string
  description = "Name of virtual network peering 2 to 1"
}