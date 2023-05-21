variable "resource_group" {
    type=string
    description="rg name"
}

variable "application_insights_name" {
    type=string
    description="applocation insights name"
}

variable "key_vault_name" {
    type=string
    description="key vault name "
}

variable "storage_account_name" {
    type=string
    description=" storage account name "
}

variable "workspace_name" {
    type=string
    description="rg name"
}

variable "identity_type" {
    type=string   
}

variable "private_endpoint_name" {
  type        = string
  description = "pvt endpoint name in Azure"
}

variable "private_service_connection_name" {
  type        = string
  description = "service connection name in Azure"
}
variable "virtual_network_name" {
  type        = string
  description = "vnet name in Azure"
}

variable "subnet_name" {
  type        = string
  description = "subnet name in Azure"
}


variable "subresource_names" {
  type        = list(string)
  description = "sub resources names in Azure"
}

variable "sql_server_name" {
  type        = string
  description = "sql server name in Azure"
}

variable "address_prefixes" {
  type        = list(string)
  description = "address prefixes"
}

variable "is_manual_connection" {
  type=bool
  description = "manual connection for endpoint"
}

variable "request_message" {
  type=string
  description = "request msg for endpoint"
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
 
}