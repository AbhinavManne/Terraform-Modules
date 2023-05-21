#-------------------------------------------RESOURCE GROUP---------------------------------------------#

variable "resource_group_name" {
  description = "value"
  type        = string
}
variable "resource_group_location" {
  description = "value"
  type        = string
}

#-------------------------------------------API MANAGMENT-----------------------------------------------#

variable "api_managment_name" {
  description = "value"
  type        = string
}
variable "publisher_name" {
  description = "value"
  type        = string
}
variable "publisher_email" {
  description = "value"
  type        = string
}
variable "sku_name" {
  description = "value"
  type        = string
}
#-------------------------------------------APPLICATION INSIGHTS----------------------------------------#

variable "application_insights_name" {
  description = "value"
  type        = string
}
variable "application_insights_type" {
  description = "value"
  type        = string
}

#-------------------------------------------API MANAGMENT LOGGER----------------------------------------#

variable "api_managment_logger_name" {
  description = "value"
  type        = string
}

#-------------------------------------------API MANAGMENT API-------------------------------------------#

variable "api_managment_api_name" {
  description = "value"
  type        = string
}
variable "api_managment_api_revision" {
  description = "value"
  type        = string
}
variable "api_managment_api_display_name" {
  description = "value"
  type        = string
}
variable "api_managment_api_path" {
  description = "value"
  type        = string
}
variable "api_managment_api_protocols" {
  description = "value"
  type        = list(string)
}

#-------------------------------------------KEY VAULT---------------------------------------------------#

variable "key_vault_name" {
  description = "value"
  type        = string
}
variable "key_vault_sku_name" {
  description = "value"
  type        = string
}

#-------------------------------------------KEY VAULT CERTIFICATE----------------------------------------------#

variable "key_vault_certificate_name" {
  description = "value"
  type        = string
}

#-------------------------------------API MANAGMENT CERTIFICATION---------------------------------------#

variable "api_managment_certificate_name" {
  description = "value"
  type        = string
}

#-----------------------------------ROLE DEFINATION FOR KEY VALUT---------------------------------------#

variable "role_definition_for_key_vault" {
  description = "value"
  type        = string
}

#-----------------------------------------------TAGS----------------------------------------------------#

variable "tags" {
  description = "Tag Name"
  type        = map(any)
}

#-------------------------------------------STORAGE ACCOUNT---------------------------------------------#

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

#-------------------------------------------VIRTUAL NETWORK---------------------------------------------#

variable "virtual_network" {
  type        = string
  description = "Virtual network name in Azure"
}
variable "address_space" {
  type        = list(string)
  description = ""
}

#-------------------------------------------SUBNET NAME-------------------------------------------------#

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