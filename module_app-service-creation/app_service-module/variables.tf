#--------------------------------------Resource Group Variables-----------------------------------------
variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}
variable "resource_group_location" {
  type        = string
  description = "Location of the resource group"
}
#--------------------------------------App Service Plan Variables-----------------------------------------
variable "app_service_plan_name" {
  type        = string
  description = "Name of the app service plan"
}
variable "tier" {
  type        = string
  description = "app service plan tier"
}
variable "size" {
  type        = string
  description = "size"
}
#--------------------------------------App Service Variables-----------------------------------------
variable "app_service_name" {
  type        = string
  description = "Name of the app service"
}
variable "https_only" {
  type        = bool
  description = "enable https"
}

variable "contact_person" {
  type        = string
  description = "contact person name"
}
variable "cost_center" {
  type        = number
  description = "cost center"
}

variable "backup_name" {
  type        = string
  description = "Name of the backup"
}
variable "frequency_interval" {
  type        = number
  description = "frequency interval"
}
variable "frequency_unit" {
  type        = string
  description = "frequency unit"
}

variable "dotnet_framework_version" {
  type        = string
  description = "version of dotnet framework"
}
variable "scm_type" {
  type        = string
  description = "type of scm"
}
variable "min_tls_version" {
  type        = string
  description = "minimum tls version"
}
variable "vnet_route_all_enabled" {
  type        = bool
  description = "enable vnet route all"
}

variable "always_on" {
  type        = bool
  description = "site configuration, keep on?"
}
variable "use_32_bit_worker_process" {
  type        = bool
  description = "use 32 bit worker process"
}
variable "scm_ip_restriction_name" {
  type        = string
  description = "scm ip restriction name"
}
variable "ip_address" {
  type        = string
  description = "ip address"
}
variable "priority1" {
  type        = number
  description = "priority"
}
variable "action1" {
  type        = string
  description = "action"
}

variable "ip_restriction_name" {
  type        = string
  description = "ip restriction name"
}
variable "priority2" {
  type        = number
  description = "priority"
}
variable "action2" {
  type        = string
  description = "action"
}

variable "name1" {
  type        = string
  description = "Name"
}
variable "type1" {
  type        = string
  description = "type"
}

variable "type2" {
  type        = string
  description = "type"
}

variable "auth_settings_enabled" {
  type        = bool
  description = "enable authentication settings"
}
variable "default_provider" {
  type        = string
  description = "default provider"
}
variable "token_store_enabled" {
  type        = bool
  description = "enable token store"
}
#--------------------------------------Application Insights Variables-----------------------------------------
variable "application_insights_name" {
  type        = string
  description = "Name of the application insights"
}
variable "application_type" {
  type        = string
  description = "application type"
}
#---------------------------------------------Vnet Variables-----------------------------------------
variable "vnet_name" {
  type        = string
  description = "Name of the virtual network"
}
variable "address_space" {
  type        = list(string)
  description = "address space"
}
#--------------------------------------------Subnet Variables-----------------------------------------
variable "subnet_name" {
  type        = string
  description = "Name of the subnet"
}
variable "address_prefixes" {
  type        = list(string)
  description = "address prefixes"
}
#----------------------------------------Storage Account Variables-----------------------------------------
variable "storage_account_name" {
  type        = string
  description = "Name of the storage account"
}
variable "account_tier" {
  type        = string
  description = "account tier"
}
variable "account_replication_type" {
  type        = string
  description = "account replication type"
}
#------------------------------------------Container Variables-----------------------------------------
variable "container_name" {
  type        = string
  description = "Name of the container"
}
variable "container_access_type" {
  type        = string
  description = "container access type"
}
#--------------------------------------Storage Account SAS Variables-----------------------------------------
variable "start_date" {
  type        = string
  description = "start date"
}
variable "end_date" {
  type        = string
  description = "end date"
}