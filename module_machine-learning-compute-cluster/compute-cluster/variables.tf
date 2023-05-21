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
  description = "workspace name in ml "
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
variable "compute_cluster" {
  type        = string
  description = "compute cluster name"
}

variable "vm_priority" {
  type        = string
  description = "vm priority "
}
variable "vm_size" {
  type        = string
  description = "size of vm"
}

variable "min_node_count" {
  type        = string
  description = "min node count"
}

variable "max_node_count" {
  type        = string
  description = "Maximum node count"
}

variable "scale_down_nodes_after_idle_duration" {
  type        = string
  description = "Node Idle Time Before Scale Down"
}