#-----------------------------VARIABLE: RESOURCE GROUP------------------------------------------------------------#
variable "resource_group" {
  type        = string
  description = "RG name in Azure"
}

variable "create_resource_group" {
  type        = bool
  description = "create resource group"
}

variable "location" {
  type        = string
  description = "RG location in Azure"
}

#----------------------------------------VARIABLE: VIRTUAL NETWORK-------------------------------------------------#
variable "virtual_network" {
  type        = string
  description = "Virtual network name in Azure"
}

variable "address_space" {
  type        = list(string)
  description = "address spaces for vnet"
}

variable "dns_servers" {
  type        = list(string)
  description = "DNS server"
}

variable "enable_ddos_protection_plan1" {
  type        = bool
  description = "enable ddos protection plan "
}

variable "tags" {
  type        = map(string)
  description = "The tags to associate with the resource."
}

#----------------------------------------VARIABLES: DDOS Protection------------------------------------------------#
variable "network_ddos_protection_plan" {
  type        = string
  description = "network ddos protection plan"
}

#---------------------------------------------VARIABLE: SUBNET-----------------------------------------------------#
variable "subnet_name" {
  type        = string
  description = "Subnet name in Azure"
}

variable "subnet_address_prefixes" {
  type        = list(string)
  description = "List of address prefixes of the subnet"
}

variable "service_endpoints" {
  type        = list(string)
  description = "List of service endpoints of the subnet"
}

#---------------------------------------- Public IP variables -----------------------------------------
variable "public_ip" {
  type        = string
  description = "public ip name"
}

variable "allocation_method" {
  type        = string
  description = "allocation method"
}

variable "sku" {
  type        = string
  description = "sku"
}

#------------------------------------------VARIABLES: Firewall ---------------------------------------------------#
variable "firewall_name" {
  type        = string
  description = "name of the firewall"
}

variable "threat_intel_mode" {
  type        = string
  description = "threat intel mode"
}


variable "ip_config" {
  type        = string
  description = "ip configuration"
}

#---------------------------------------VARIABLES: STORAGE-----------------------------------------------------#
variable "storage_account_name" {
  type        = string
  description = "Storage account name in Azure"
}

variable "network_rule_default_action" {
  type        = string
  description = "Specifies the default action of allow or deny when no other rules match."
}

variable "ip_rules" {
  type        = list(string)
  description = "List of address prefixes of the subnet"
}

variable "network_rule_bypass" {
  type        = list(string)
  description = "Specifies whether traffic is bypassed for Logging/Metrics/AzureServices"
}

#--------------------------------------VARIABLES: MODULE: RBAC------------------------------------------#
variable "role_definition_name" {
  type        = list(string)
  description = "List of Role Definitions"
  default     = ["Reader", "Contributor"]
}

#-------------------------------------------------------------------------------------------------------#