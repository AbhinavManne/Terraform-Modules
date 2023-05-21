#RECOVERY_SERVICES_VAULT_MODULE

#-----------------------------------------RESOURCE: RECOVERY SERVICES VAULT-------------------------------#
resource "azurerm_recovery_services_vault" "vault" {
  name                         = var.recovery_vault_name
  location                     = var.location
  resource_group_name          = var.resource_group_name
  sku                          = var.recovery_vault_sku
  storage_mode_type            = var.recovery_vault_storage_mode_type != null ? var.recovery_vault_storage_mode_type : null
  cross_region_restore_enabled = var.recovery_vault_storage_mode_type == "GeoRedundant" && var.cross_region_restore_enabled != null ? var.cross_region_restore_enabled : null
  soft_delete_enabled          = var.recovery_vault_soft_delete_enabled != null ? var.recovery_vault_soft_delete_enabled : null

  dynamic "identity" {
    for_each = var.identity_type != null ? [1] : []
    content {
      type = var.identity_type
    }
  }

  dynamic "encryption" {
    for_each = var.encryption_key_id != null ? [1] : []
    content {
      key_id                            = var.encryption_key_id
      infrastructure_encryption_enabled = var.infrastructure_encryption_enabled
      use_system_assigned_identity      = var.use_system_assigned_identity != null ? var.use_system_assigned_identity : null
    }
  }

  tags = var.tags
}

#-----------------------------------------RESOURCE: Backup Policy File Share-------------------------------#
resource "azurerm_backup_policy_file_share" "fs_policy" {
  count               = var.enable_backup_policy_file_share ? 1 : 0
  name                = var.backup_policy_file_share_name
  resource_group_name = var.resource_group_name
  recovery_vault_name = azurerm_recovery_services_vault.vault.name
  timezone            = var.backup_policy_file_share_timezone != null ? var.backup_policy_file_share_timezone : null

  backup {
    frequency = var.backup_policy_file_share_frequency
    time      = var.backup_policy_file_share_time
  }

  retention_daily {
    count = var.backup_policy_file_share_count
  }

  dynamic "retention_weekly" {
    for_each = var.fs_policy_retention_weekly_count != null ? [1] : []
    content {
      count    = var.fs_policy_retention_weekly_count
      weekdays = var.fs_policy_retention_weekly_weekdays
    }
  }

  dynamic "retention_monthly" {
    for_each = var.fs_policy_retention_monthly_count != null ? [1] : []
    content {
      count    = var.fs_policy_retention_monthly_count
      weekdays = var.fs_policy_retention_monthly_weekdays
      weeks    = var.fs_policy_retention_monthly_weeks
    }
  }

  dynamic "retention_yearly" {
    for_each = var.fs_policy_retention_yearly_count != null ? [1] : []
    content {
      count    = var.fs_policy_retention_yearly_count
      weekdays = var.fs_policy_retention_yearly_weekdays
      weeks    = var.fs_policy_retention_yearly_weeks
      months   = var.fs_policy_retention_yearly_months
    }
  }
}

#-----------------------------------------RESOURCE: Backup Policy VM-------------------------------#
resource "azurerm_backup_policy_vm" "vm_policy" {
  count                          = var.enable_backup_policy_vm ? 1 : 0
  name                           = var.backup_policy_vm_name
  resource_group_name            = var.resource_group_name
  recovery_vault_name            = azurerm_recovery_services_vault.vault.name
  policy_type                    = var.backup_policy_vm_type != null ? var.backup_policy_vm_type : null
  instant_restore_retention_days = var.backup_policy_vm_type == "V1" && (var.backup_policy_vm_instant_restore_retention_days >= 1 && var.backup_policy_vm_instant_restore_retention_days <= 5) || var.backup_policy_vm_type == "V1" && (var.backup_policy_vm_instant_restore_retention_days >= 1 && var.backup_policy_vm_instant_restore_retention_days <= 30) ? var.backup_policy_vm_instant_restore_retention_days : null
  timezone                       = var.backup_policy_vm_timezone != null ? var.backup_policy_vm_timezone : null

  backup {
    frequency     = var.backup_policy_vm_frequency
    time          = var.backup_policy_vm_time
    hour_interval = var.backup_policy_vm_frequency == "Hourly" ? var.backup_policy_vm_hour_interval : null
    hour_duration = var.backup_policy_vm_frequency == "Hourly" ? var.backup_policy_vm_hour_duration : null
    weekdays      = var.backup_policy_vm_frequency == "Weekly" ? var.backup_policy_vm_weekdays : null
  }

  dynamic "retention_daily" {
    for_each = var.backup_policy_vm_frequency == "Daily" && var.backup_policy_vm_count != null ? [1] : []
    content {
      count = var.backup_policy_vm_count
    }
  }

  dynamic "retention_weekly" {
    for_each = var.backup_policy_vm_frequency == "Weekly" && var.vm_policy_retention_weekly_count != null ? [1] : []
    content {
      count    = var.vm_policy_retention_weekly_count
      weekdays = var.vm_policy_retention_weekly_weekdays
    }
  }

  dynamic "retention_monthly" {
    for_each = var.vm_policy_retention_monthly_count != null ? [1] : []
    content {
      count    = var.vm_policy_retention_monthly_count
      weekdays = var.vm_policy_retention_monthly_weekdays
      weeks    = var.vm_policy_retention_monthly_weeks
    }
  }

  dynamic "retention_yearly" {
    for_each = var.vm_policy_retention_yearly_count != null ? [1] : []
    content {
      count    = var.vm_policy_retention_yearly_count
      weekdays = var.vm_policy_retention_yearly_weekdays
      weeks    = var.vm_policy_retention_yearly_weeks
      months   = var.vm_policy_retention_yearly_months
    }
  }
}

#-----------------------------------------RESOURCE: Backup Policy VM Workload-------------------------------#
resource "azurerm_backup_policy_vm_workload" "vm_workload_policy" {
  count               = var.enable_backup_policy_vm_workload ? 1 : 0
  name                = var.backup_policy_vm_workload_name
  resource_group_name = var.resource_group_name
  recovery_vault_name = azurerm_recovery_services_vault.vault.name
  workload_type       = var.backup_policy_vm_workload_type

  settings {
    time_zone           = var.backup_policy_vm_workload_timezone
    compression_enabled = var.backup_policy_vm_workload_compression_enabled
  }

  dynamic "protection_policy" {
    for_each = var.backup_policy_vm_protection_policy
    content {
      policy_type = protection_policy.value.policy_type
      dynamic "backup" {
        for_each = protection_policy.value.backup
        content {
          frequency            = backup.value.frequency
          frequency_in_minutes = backup.value.frequency_in_minutes
          time                 = backup.value.time
          weekdays             = backup.value.weekdays
        }
      }
      dynamic "retention_daily" {
        for_each = protection_policy.value.retention_daily
        content {
          count = retention_daily.value.count
        }
      }
      dynamic "retention_weekly" {
        for_each = protection_policy.value.retention_weekly
        content {
          count    = retention_weekly.value.count
          weekdays = retention_weekly.value.weekdays
        }
      }
      dynamic "retention_monthly" {
        for_each = protection_policy.value.retention_monthly
        content {
          count       = retention_monthly.value.count
          format_type = retention_monthly.value.format_type
          monthdays   = retention_monthly.value.monthdays
          weekdays    = retention_monthly.value.weekdays
          weeks       = retention_monthly.value.weeks
        }
      }
      dynamic "retention_yearly" {
        for_each = protection_policy.value.retention_yearly
        content {
          count       = retention_yearly.value.count
          format_type = retention_yearly.value.format_type
          months      = retention_yearly.value.months
          monthdays   = retention_yearly.value.monthdays
          weekdays    = retention_yearly.value.weekdays
          weeks       = retention_yearly.value.weeks
        }
      }
      dynamic "simple_retention" {
        for_each = protection_policy.value.simple_retention
        content {
          count = simple_retention.value.sr_count
        }
      }
    }
  }
}
