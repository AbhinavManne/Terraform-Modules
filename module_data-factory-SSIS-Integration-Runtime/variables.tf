#-------------------------------Integration runtime variables ------------------------#
variable "location" {
  type        = string
  description = "Resource group location"
}

variable "integration_runtime_custom_name" {
  type        = string
  description = "Name of the integration_runtime resource"
}


variable "integration_runtime_description" {
  description = "Integration runtime description"
  type        = string
  default     = null
}

variable "integration_runtime_configuration" {
  description = <<EOF
  Parameters used to configure `AzureSSIS` integration runtime:
     `node_size` (optional, defaults to `Standard_D2_v3`)
    `number_of_nodes` (optional, defaults to `1`)
    `max_parallel_executions_per_nodes` (optional, defaults to `1`)
    `edition` (optional, defaults to `Standard`)
    `license_type` (optional, defaults to `LicenseIncluded`)
  EOF
  type        = map(any)
  default     = {}
}

variable "catalog_info" {
  type        = map(string)
  description = "A catalog_info block in azure SSIS"
  default     = null
}

variable "custom_setup_script" {
  type        = map(string)
  description = " A custom_setup_script block Azure SSIS"
  default     = null
}

variable "express_custom_setup" {
  type = object({
    environment        = map(string)
    powershell_version = number
    command_key = map(object({
      target_name = string
      user_name   = string
      //password= string
    }))


    component = map(object({
      name    = string
      license = string

    }))


  })
  description = "express custom setup block in azure SSIS "
  default     = null
}

variable "subnet_id" {
  type        = string
  description = "ID of subnet"
}

variable "package_store" {
  type        = map(map(string))
  description = "package store block in azure ssis"
  default     = null
}

variable "proxy" {
  type        = map(string)
  description = "A proxy block in Azure SSIS"
  default     = null
}

variable "vnet_integration" {
  type = object({
    vnet_id     = string
    subnet_name = string
    subnet_id   = string
    public_ips  = list(string)

  })
  description = "A vnet integration block for azure SSIS"
  default     = null
}

variable "key_vault_password" {
  type        = bool
  description = "Key vault password block"
  default     = false
}

variable "key_vault_license" {
  type        = bool
  description = "key vault license block"
  default     = false
}

variable "linked_service_name" {
  type        = string
  description = "Specifies the name of an existing Key Vault Data Factory Linked Service."
}

variable "secret_name" {
  type        = string
  description = "Specifies the secret name in Azure Key Vault."
}

variable "secret_version" {
  type        = string
  description = "Specifies the secret version in Azure Key Vault"
  default     = null
}

variable "parameters" {
  type        = map(string)
  description = "A map of parameters to associate with the Key Vault Data Factory Linked Service"
  default     = null
}


variable "data_factory_id" {
  type        = string
  description = "Data factory id"
}

variable "linked_service_name_1" {
  type        = string
  description = "Specifies the name of an existing Key Vault Data Factory Linked Service."
}

variable "secret_name_1" {
  type        = string
  description = "Specifies the secret name in Azure Key Vault."
}

variable "secret_version_1" {
  type        = string
  description = "Specifies the secret version in Azure Key Vault"
  default     = null
}

variable "parameters_1" {
  type        = map(string)
  description = "A map of parameters to associate with the Key Vault Data Factory Linked Service"
  default     = null
}


variable "administrator_password" {
  type        = string
  description = "admin password for sql server in catalog info block"
  default     = null
}

variable "sas_token" {
  type        = string
  description = "sas_token of storage account"
  default     = null
}


variable "password" {
  type        = string
  description = "password for command key in express custom"
  default     = null
}