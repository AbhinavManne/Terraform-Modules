variable "rg" {
  type        = string
  description = "Resource group name in Azure"
}

variable "location" {
  type        = string
  description = "location of the resources"
}

variable "workspace" {
  type        = string
  description = "Azure databricks workspace name"
}

variable "sku" {
  type        = string
  description = "databricks sku type"
}

variable "tags" {
  type        = map(string)
  description = "The tags to associate with the resource."
}
variable "load_balancer_backend_address_pool_id" {
  type        = string
  description = "Resource ID of the Outbound Load balancer Backend Address Pool for Secure Cluster Connectivity (No Public IP) workspace. Changing this forces a new resource to be created."
  default     = null
}
variable "managed_services_cmk_key_vault_key_id" {
  type        = string
  description = "Customer managed encryption properties for the Databricks Workspace managed resources(e.g. Notebooks and Artifacts). Changing this forces a new resource to be created."
  default     = null
}
variable "mrg" {
  type        = string
  description = "The name of the resource group where Azure should place the managed Databricks resources. Changing this forces a new resource to be created."
  default     = null
}
variable "customer_managed_key_enabled" {
  type        = bool
  description = "Is the workspace enabled for customer managed key encryption? If true this enables the Managed Identity for the managed storage account. Possible values are true or false. Defaults to false. This field is only valid if the Databricks Workspace sku is set to premium. Changing this forces a new resource to be created."
  default     = false
}
variable "infrastructure_encryption_enabled" {
  type        = bool
  description = "Is the Databricks File System root file system enabled with a secondary layer of encryption with platform managed keys? Possible values are true or false. Defaults to false. This field is only valid if the Databricks Workspace sku is set to premium. Changing this forces a new resource to be created."
  default     = false
}
variable "public_network_access_enabled" {
  type        = bool
  description = "Allow public access for accessing workspace. Set value to false to access workspace only via private link endpoint. Possible values include true or false. Defaults to true. Changing this forces a new resource to be created."
  default     = false
}
variable "network_security_group_rules_required" {
  type        = string
  description = "Does the data plane (clusters) to control plane communication happen over private link endpoint only or publicly? Possible values AllRules, NoAzureDatabricksRules or NoAzureServiceRules. Required when public_network_access_enabled is set to false. Changing this forces a new resource to be created."
  default     = null
}
variable "machine_learning_workspace_id" {
  type        = string
  description = "The ID of a Azure Machine Learning workspace to link with Databricks workspace. Changing this forces a new resource to be created."
  default     = null
}
variable "nat_gateway_name" {
  type        = string
  description = "Name of the NAT gateway for Secure Cluster Connectivity (No Public IP) workspace subnets. Defaults to nat-gateway. Changing this forces a new resource to be created"
  default     = null
}
variable "no_public_ip" {
  type        = bool
  description = "Are public IP Addresses not allowed? Possible values are true or false. Defaults to false. Changing this forces a new resource to be created."
  default     = false
}
variable "public_subnet_name" {
  type        = string
  description = "he name of the Public Subnet within the Virtual Network. Required if virtual_network_id is set. Changing this forces a new resource to be created."
  default     = null
}
variable "public_subnet_network_security_group_association_id" {
  type        = string
  description = " The resource ID of the azurerm_subnet_network_security_group_association resource which is referred to by the public_subnet_name field. This is the same as the ID of the subnet referred to by the public_subnet_name field. Required if virtual_network_id is set."
  default     = null
}
variable "private_subnet_name" {
  type        = string
  description = "The name of the Private Subnet within the Virtual Network. Required if virtual_network_id is set. Changing this forces a new resource to be created."
  default     = null
}
variable "private_subnet_network_security_group_association_id" {
  type        = string
  description = " The resource ID of the azurerm_subnet_network_security_group_association resource which is referred to by the private_subnet_name field. This is the same as the ID of the subnet referred to by the private_subnet_name field. Required if virtual_network_id is set."
  default     = null
}
variable "storage_account_name" {
  type        = string
  description = "Default Databricks File Storage account name. Defaults to a randomized name(e.g. dbstoragel6mfeghoe5kxu). Changing this forces a new resource to be created."
  default     = null
}
variable "storage_account_sku_name" {
  type        = string
  description = "Storage account SKU name. Possible values include Standard_LRS, Standard_GRS, Standard_RAGRS, Standard_GZRS, Standard_RAGZRS, Standard_ZRS, Premium_LRS or Premium_ZRS. Defaults to Standard_GRS. Changing this forces a new resource to be created."
  default     = null
}
variable "virtual_network_id" {
  type        = string
  description = "The ID of a Virtual Network where this Databricks."
  default     = null
}
variable "vnet_address_prefix" {
  type        = string
  description = " Address prefix for Managed virtual network. Defaults to 10.139"
  default     = null
}
variable "custom_parameters" {
  type = bool
  description = "A custom_parameters block as documented below."
  
  
}