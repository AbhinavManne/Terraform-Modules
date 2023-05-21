variable "resource_group_name" {
  description = "Name of the resource group to be imported."
  type        = string
}

variable "location" {
  type=string
  description = "The location/region to keep all your network resources. To get the list of all locations with table format from azure cli, run 'az account list-locations -o table'"
}

variable "tags" {
  description = "value"
  type        = map(any)
}


variable "synapse_name" {
  type        = string
  description = "Specifies the name which should be used for this synapse Workspace. Changing this forces a new resource to be created." 
}

variable "adminlogin" {
  description = "Specifies The Login Name of the SQL administrator. Changing this forces a new resource to be created."
  type        = string
}

variable "managed_virtual_network_enabled" {
  description = "Is Virtual Network enabled for all computes in this workspace? Defaults to false."
  type        = bool
}

variable "sql_identity_control_enabled" {
  description = "Are pipelines (running as workspace's system assigned identity) allowed to access SQL pools? Defaults to false."
  type        = bool
}

variable "managed_resource_group_name" {
  description = "value"
  type        = string
}

variable "aad_admin" {
  description = "AzureAD Admin block"
  type        = map(any)
  default     = null
}

variable "sql_aad_admin" {
  description = "AzureAD Admin block"
  type        = map(any)
  default     = null
}

variable "azure_devops_repo" {
  description = "azure_devops_repo configuration block."
  type        = map(any)
  default     = null
}

variable "github_repo" {
  description = "github_repo configuration block"
  type        = map(any)
  default     = null
}

variable "synapsesql" {
  description = "The name which should be used for this Synapse Sql Pool. Changing this forces a new synapse SqlPool to be created."
  type        = string
}


variable "synapse_sql_pool" {
  type       = map(any)
  description = "synapse sql pool "
}

variable "synapse_spark_pool" {
  type= map(any)
  description = "synapse spark pool"
}


variable "data_exfiltration_protection_enabled" {
  description = " data exfiltration protection enabled in synapse workspace?"
  type        = bool
  default     = false
}


variable "firewall_rules" {
  description = "Range of IP addresses to allow firewall connections."
  type = map(object({

    start_ip_address = string
    end_ip_address   = string

  }))
}


variable "compute_subnet_id" {
  type=string
  description ="Subnet ID used for computes in workspace"
  default = null
}

variable "linking_allowed_for_aad_tenant_ids" {
  type=list(string)
  description = "Allowed AAD Tenant Ids For Linking."
  default = null
}

variable "public_network_access_enabled" {
  type = string
  description = "Whether public network access is allowed for the Cognitive Account"
  default = true
}

variable "purview_id" {
  type = string
  description = " The ID of purview account."
  default = null
}

variable "filesystem_name" {
  type=string
  description ="filesystem name "
}

variable "storage_account_id" {
  type= string
  description ="storage account id"
}

variable "managed_identity_type" {
  description = "The type of Managed Identity . Possible values are `SystemAssigned`, `UserAssigned` and `SystemAssigned, UserAssigned`"
  type        = string
}

##-----------keyvault secret -----------------------##

variable "key_vault_secret_name" {
  type=string
  description = "key vault secret name"
}

variable "key_vault_id" {
  type= string
  description ="ID of keyvault"
}

