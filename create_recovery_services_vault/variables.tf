variable "resource_group_name" {
  type        = string
  description = "RG name in Azure"
}

variable "location" {
  type        = string
  description = "Location of RG"
}

variable "resource_group_id" {
  type        = string
  description = "Resource group ID "
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
    condition     = var.backup_policy_vm_hour_duration > 4 && var.backup_policy_vm_hour_duration < 24
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

#------------------------Variables: Module:Private Endpoint -------------------------------------------#
variable "create_private-endpoint" {
  type        = bool
  description = "Wants to create private endpoint or not"
  default     = false
}

variable "private_dns_zone_group" {
  description = "block for dns zone group"
  type = object({
    name                 = string
    private_dns_zone_ids = list(string)
  })
  default = {
    name                 = "xyz"
    private_dns_zone_ids = ["null"]
  }
}

variable "private_endpoint_name" {
  type        = string
  description = "pvt endpoint name in Azure"
}

variable "private_service_connection_name" {
  type        = string
  description = "service connection name in Azure"
}

variable "subresource_names" {
  type        = list(string)
  description = "sub resources names in Azure"
}

variable "is_manual_connection" {
  type        = string
  description = "Status of manual connection "
}

variable "request_message" {
  type        = string
  description = "request msg"
  default     = "PL"
}

variable "private_connection_resource_id" {
  description = "ID of resource to be associated"
  default     = null
}

variable "subnet_id" {
  description = "Id of subnet"
}

variable "private_connection_resource_alias" {
  type        = string
  description = "alias name"
  default     = null
}

/*
#--------------------------------VARIABLES:MODULE: ALERTS -----------------------------------------------#
variable "storage_account_id" {
  type        = string
  description = "Reading Storage account ID "
}

variable "action_group_name" {
  type        = string
  description = "The name of the Action Group. Changing this forces a new resource to be created. "
}

variable "short_name" {
  type        = string
  description = "The short name of the action group. "
}

variable "action_group_rule_name" {
  type        = string
  description = "Specifies the name of the Monitor Action Rule. Changing this forces a new resource to be created. "
}

variable "scope_type" {
  type        = string
  description = "Specifies the type of target scope. Possible values are ResourceGroup and Resource "
}

variable "activity_log_alert_name" {
  type        = string
  description = "The name of the activity log alert. Changing this forces a new resource to be created. "
}



variable "operation_name_log_alert" {
  type        = string
  description = "The Resource Manager Role-Based Access Control operation name. Supported operation should be of the form: <resourceProvider>/<resourceType>/<operation> "
}

variable "category_log_alert" {
  type        = string
  description = "The category of the operation. Possible values are Administrative, Autoscale, Policy, Recommendation, ResourceHealth, Security and ServiceHealth "
}

variable "metric_alert_name" {
  type        = string
  description = "The name of the Metric Alert. Changing this forces a new resource to be created "
}

variable "metric_namespace" {
  type        = string
  description = "One of the metric namespaces to be monitored. "
}

variable "metric_name" {
  type        = string
  description = "One of the metric names to be monitored. "
}

variable "aggregation" {
  type        = string
  description = "The statistic that runs over the metric values. Possible values are Average, Count, Minimum, Maximum and Total. "
}

variable "operator" {
  type        = string
  description = "The criteria operator. Possible values are Equals, NotEquals, GreaterThan, GreaterThanOrEqual, LessThan and LessThanOrEqual. "
}

variable "threshold" {
  type        = number
  description = "The criteria threshold value that activates the alert "
}

variable "dimension_name" {
  type        = string
  description = "One of the dimension names "
}

variable "dimension_operator" {
  type        = string
  description = "The dimension operator. Possible values are Include, Exclude and StartsWith. "
}

variable "values" {
  type        = list(string)
  description = "The list of dimension values. "
}


#--------------------------------VARIABLES:MODULE: DIAGNOSTIC -----------------------------------------------#
variable "enable_log_monitoring" {
  type        = bool
  description = "enable log monitoring"
}

variable "diag_name" {
  type        = string
  description = "Specifies the name of the Diagnostic Setting."
}

variable "log_analytics_workspace_id" {
  description = "ID of log anaytics workspace"
}

variable "log_analytics_destination_type" {
  type        = string
  description = "log_analytics_destination_type"
}

variable "eventhub_name" {
  description = "eventhub_name"
}

variable "eventhub_authorization_rule_id" {
  description = "eventhub_authorization_rule_id"
}

variable "log_enabled" {
  type        = bool
  description = "log_enabled"
}

variable "log_retention_policy_enabled" {
  type        = bool
  description = "log_retention_policy_enabled"
}

variable "log_retention_days" {
  type        = number
  description = "log_retention_days"
}

variable "metric_retention_policy_enabled" {
  type        = bool
  description = "metric_retention_policy_enabled"
}

variable "metric_retention_days" {
  type        = number
  description = "log_retention_days"
}
*/

