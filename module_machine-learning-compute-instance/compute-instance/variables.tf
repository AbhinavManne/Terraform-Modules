variable "resource_group" {
  type        = string
  description = "rg name"
}

variable "application_insights_name" {
  type        = string
  description = "applocation insights name"
}

variable "key_vault_name" {
  type        = string
  description = "key vault name "
}

variable "storage_account_name" {
  type        = string
  description = " storage account name "
}

variable "workspace_name" {
  type        = string
  description = "ml workspace name"
}

variable "identity_type" {
  type        = string
  description = "identity type in workspace"
}

variable "vnet_name" {
  type        = string
  description = "vnet name"
}

variable "subnet_name" {
  type        = string
  description = "subnet name"
}

variable "ssh_key" {
  description = "Specifies the SSH rsa public key file as a string"
}

variable "compute_instance" {
  type        = string
  description = "compute instance in ml"
}

variable "virtual_machine_size" {
  type        = string
  description = " vm size"
}

variable "authorization_type" {
  type        = string
  description = "Compute Instance Authorization type"
}
