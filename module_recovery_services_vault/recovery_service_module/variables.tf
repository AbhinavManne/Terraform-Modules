variable "resource_group_name" {
  type        = string
  description = "RG name in Azure"
}

variable "location" {
  type        = string
  description = "Location of RG"
}

#-------------------------------------RESOURCE: RECOVERY SERVICES VAULT-----------------------------------#
variable "recovery_vault_name" {
  type        = string
  description = "recovery service keyvault name in Azure"
}

variable "recovery_vault_sku" {
  type        = string
  description = " Sets the vault's SKU. Possible values include: Standard, RS0."
}

variable "recovery_vault_storage_mode_type" {
  type        = string
  description = "The storage type of the Recovery Services Vault. Possible values are GeoRedundant, LocallyRedundant and ZoneRedundant. Defaults to GeoRedundant."
  default     = "GeoRedundant"
}

variable "cross_region_restore_enabled" {
  type        = bool
  description = "Is cross region restore enabled for this Vault? Only can be true, when storage_mode_type is GeoRedundant. Defaults to false."
  default     = false
}

variable "recovery_vault_soft_delete_enabled" {
  type        = bool
  description = "Is soft delete enable for this Vault?"
  default     = true
}

variable "identity_type" {
  type        = string
  description = "The Type of Identity which should be used for this Recovery Services Vault. At this time the only possible value is SystemAssigned."
  default     = "SystemAssigned"
}

variable "encryption_key_id" {
  type        = string
  description = "The Key Vault key id used to encrypt this vault. Key managed by Vault Managed Hardware Security Module is also supported."
}

variable "infrastructure_encryption_enabled" {
  type        = bool
  description = " Enabling/Disabling the Double Encryption state."
  default     = false
}

variable "use_system_assigned_identity" {
  type        = bool
  description = "Indicate that system assigned identity should be used or not. At this time the only possible value is true. Defaults to true."
  default     = true
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resource."
}


#-------------------------------------RESOURCE: Backup Policy File Share-----------------------------------#
variable "enable_backup_policy_file_share" {
  type        = bool
  description = "Wants to enable backup policy for file share?"
}

variable "backup_policy_file_share_name" {
  type        = string
  description = " Specifies the name of the policy. Changing this forces a new resource to be created."
}

variable "backup_policy_file_share_timezone" {
  type        = string
  description = "Specifies the timezone. the possible values are defined here. Defaults to UTC"
  default     = "UTC"
}

variable "backup_policy_file_share_frequency" {
  type        = string
  description = "Sets the backup frequency. Currently, only Daily is supported"
  default     = "Daily"
}

variable "backup_policy_file_share_time" {
  type        = string
  description = "The time of day to perform the backup in 24-hour format. Times must be either on the hour or half hour (e.g. 12:00, 12:30, 13:00, etc.)"
}

variable "backup_policy_file_share_count" {
  type        = number
  description = "The number of daily backups to keep. Must be between 1 and 200 (inclusive)"
  validation {
    condition     = var.backup_policy_file_share_count >= 1 && var.backup_policy_file_share_count <= 200
    error_message = "Must be between 1 and 200 (inclusive)"
  }
}

variable "fs_policy_retention_weekly_count" {
  type        = number
  description = "count - The number of daily backups to keep."
  validation {
    condition     = var.fs_policy_retention_weekly_count >= 1 && var.fs_policy_retention_weekly_count <= 200
    error_message = "Must be between 1 and 200 (inclusive)"
  }
}

variable "fs_policy_retention_weekly_weekdays" {
  type        = list(string)
  description = "The weekday backups to retain."
}

variable "fs_policy_retention_monthly_count" {
  type        = number
  description = "count - The number of monthly backups to keep."
  validation {
    condition     = var.fs_policy_retention_monthly_count >= 1 && var.fs_policy_retention_monthly_count <= 120
    error_message = "Must be between 1 and 120 (inclusive)"
  }
}

variable "fs_policy_retention_monthly_weekdays" {
  type        = list(string)
  description = "The weekday backups to retain."
}

variable "fs_policy_retention_monthly_weeks" {
  type        = list(string)
  description = "The week backups to retain."
}

variable "fs_policy_retention_yearly_count" {
  type        = number
  description = "count - The number of yearly backups to keep."
  validation {
    condition     = var.fs_policy_retention_yearly_count >= 1 && var.fs_policy_retention_yearly_count <= 10
    error_message = "Must be between 1 and 10 (inclusive)"
  }
}

variable "fs_policy_retention_yearly_weekdays" {
  type        = list(string)
  description = "The weekday backups to retain."
}

variable "fs_policy_retention_yearly_weeks" {
  type        = list(string)
  description = "The weeks backups to retain."
}

variable "fs_policy_retention_yearly_months" {
  type        = list(string)
  description = "The months backups to retain."
}

#-------------------------------------RESOURCE: Backup Policy VM-----------------------------------#
variable "enable_backup_policy_vm" {
  type        = bool
  description = "Wants to enable backup policy for VM?"
}

variable "backup_policy_vm_name" {
  type        = string
  description = " Specifies the name of the policy. Changing this forces a new resource to be created."
}

variable "backup_policy_vm_type" {
  type        = string
  description = "Type of the Backup Policy. Possible values are V1 and V2 where V2 stands for the Enhanced Policy. Defaults to V1. Changing this forces a new resource to be created."
  default     = "V1"
}

variable "backup_policy_vm_instant_restore_retention_days" {
  type        = number
  description = "Specifies the instant restore retention range in days. Possible values are between 1 and 5 when policy_type is V1, and 1 to 30 when policy_type is V2."
}

variable "backup_policy_vm_timezone" {
  type        = string
  description = "Specifies the timezone. the possible values are defined here. Defaults to UTC"
  default     = "UTC"
}

variable "backup_policy_vm_frequency" {
  type        = string
  description = "Sets the backup frequency. Currently, only Daily is supported"
}

variable "backup_policy_vm_time" {
  type        = string
  description = "The time of day to perform the backup in 24-hour format. Times must be either on the hour or half hour (e.g. 12:00, 12:30, 13:00, etc.)"
}

variable "backup_policy_vm_hour_interval" {
  type        = number
  description = "Interval in hour at which backup is triggered. Possible values are 4, 6, 8 and 12. This is used when frequency is Hourly."
  validation {
    condition     = var.backup_policy_vm_hour_interval == 4 || var.backup_policy_vm_hour_interval == 6 || var.backup_policy_vm_hour_interval == 8 || var.backup_policy_vm_hour_interval == 12
    error_message = "Interval in hour at which backup is triggered. Possible values are 4, 6, 8 and 12. This is used when frequency is Hourly."
  }
}

variable "backup_policy_vm_hour_duration" {
  type        = string
  description = "Duration of the backup window in hours. Possible values are between 4 and 24 This is used when frequency is Hourly."
  validation {
    condition     = var.backup_policy_vm_hour_duration >= 4 && var.backup_policy_vm_hour_duration <= 24
    error_message = "Duration of the backup window in hours. Possible values are between 4 and 24 "
  }
}

variable "backup_policy_vm_weekdays" {
  type        = list(string)
  description = " The days of the week to perform backups on. Must be one of Sunday, Monday, Tuesday, Wednesday, Thursday, Friday or Saturday. This is used when frequency is Weekly."
}

variable "backup_policy_vm_count" {
  type        = number
  description = " The number of daily backups to keep. Must be between 7 and 9999."
  validation {
    condition     = var.backup_policy_vm_count > 7 && var.backup_policy_vm_count < 9999
    error_message = " The number of daily backups to keep. Must be between 7 and 9999."
  }
}

variable "vm_policy_retention_weekly_count" {
  type        = number
  description = "The number of weekly backups to keep. Must be between 1 and 9999"
  validation {
    condition     = var.vm_policy_retention_weekly_count > 1 && var.vm_policy_retention_weekly_count < 9999
    error_message = "The number of weekly backups to keep. Must be between 1 and 9999"
  }
}

variable "vm_policy_retention_weekly_weekdays" {
  type        = list(string)
  description = "The weekday backups to retain."
}

variable "vm_policy_retention_monthly_count" {
  type        = number
  description = "The number of monthly backups to keep. Must be between 1 and 9999"
  validation {
    condition     = var.vm_policy_retention_monthly_count > 1 && var.vm_policy_retention_monthly_count < 9999
    error_message = "The number of monthly backups to keep. Must be between 1 and 9999"
  }
}

variable "vm_policy_retention_monthly_weekdays" {
  type        = list(string)
  description = "The weekday backups to retain."
}

variable "vm_policy_retention_monthly_weeks" {
  type        = list(string)
  description = "The week backups to retain."
}

variable "vm_policy_retention_yearly_count" {
  type        = number
  description = "count - The number of yearly backups to keep."
  validation {
    condition     = var.vm_policy_retention_yearly_count > 1 && var.vm_policy_retention_yearly_count < 9999
    error_message = "The number of yearly backups to keep. Must be between 1 and 9999"
  }
}

variable "vm_policy_retention_yearly_weekdays" {
  type        = list(string)
  description = "The weekday backups to retain."
}

variable "vm_policy_retention_yearly_weeks" {
  type        = list(string)
  description = "The weeks backups to retain."
}

variable "vm_policy_retention_yearly_months" {
  type        = list(string)
  description = "The months backups to retain."
}


#-------------------------------------RESOURCE: Backup Policy VM Workload-----------------------------------#
variable "enable_backup_policy_vm_workload" {
  type        = bool
  description = "Wants to enable backup policy VM workload?"
}

variable "backup_policy_vm_workload_name" {
  type        = string
  description = "The name of the VM Workload Backup Policy. Changing this forces a new resource to be created."
}

variable "backup_policy_vm_workload_type" {
  type        = string
  description = "The VM Workload type for the Backup Policy. Possible values are SQLDataBase and SAPHanaDatabase. Changing this forces a new resource to be created."
}

variable "backup_policy_vm_workload_timezone" {
  type        = string
  description = " The timezone for the VM Workload Backup Policy."
}

variable "backup_policy_vm_workload_compression_enabled" {
  type        = bool
  description = "The compression setting for the VM Workload Backup Policy. Defaults to false."
}

variable "backup_policy_vm_protection_policy" {
  type = list(object({
    policy_type = string
    backup = list(object({
      frequency            = string
      frequency_in_minutes = number
      time                 = string
      weekdays             = list(string)
    }))
    retention_daily = list(object({
      count = number
    }))
    retention_weekly = list(object({
      count    = number
      weekdays = list(string)
    }))
    retention_monthly = list(object({
      count       = number
      format_type = string
      monthdays   = list(number)
      weekdays    = list(string)
      weeks       = list(string)
    }))
    retention_yearly = list(object({
      count       = number
      format_type = string
      months      = list(string)
      monthdays   = list(number)
      weekdays    = list(string)
      weeks       = list(string)
    }))
    simple_retention = list(object({
      sr_count = string
    }))
  }))
  description = "One or more protection_policy type blocks"
}