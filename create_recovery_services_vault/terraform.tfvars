#-------------------------------------DEFAULT VALUES OF RECOVERY SERVICE MODULE-------------------------#

resource_group_name = "rg-testing-as"
location            = "East US"
resource_group_id   = "/subscriptions/b325a432-99f2-46b9-99a4-f74d01446503/resourceGroups/rg-testing-as"

#----DEFAULT VALUES: MODULE: RECOVERY SERVICES VAULT----#
recovery_vault_name                = "testing-recoveryvault-as"
recovery_vault_sku                 = "Standard"
recovery_vault_storage_mode_type   = "LocallyRedundant" //"GeoRedundant"
cross_region_restore_enabled       = true //false
recovery_vault_soft_delete_enabled = true
identity_type                      = "SystemAssigned"
encryption_key_id                  = null
infrastructure_encryption_enabled  = false
use_system_assigned_identity       = false
tags = {
  Contact_name     = "ABC"
  Cost_Center      = "999"
  Application_name = "Recovery_services_vault"
}

enable_backup_policy_file_share      =  true// false
backup_policy_file_share_name        = "rsv-testing-fs-policy"
backup_policy_file_share_timezone    = "UTC"
backup_policy_file_share_frequency   = "Daily"
backup_policy_file_share_time        = "12:00"
backup_policy_file_share_count       = 1
fs_policy_retention_weekly_count     = 1
fs_policy_retention_weekly_weekdays  = ["Sunday", ]
fs_policy_retention_monthly_count    = 1
fs_policy_retention_monthly_weekdays = ["Sunday", ]
fs_policy_retention_monthly_weeks    = ["First", ]
fs_policy_retention_yearly_count     = 1
fs_policy_retention_yearly_weekdays  = ["Sunday", ]
fs_policy_retention_yearly_weeks     = ["First", ]
fs_policy_retention_yearly_months    = ["May"]

enable_backup_policy_vm                         = true //false
backup_policy_vm_name                           = "rsv-testing-vm-policy"
backup_policy_vm_type                           = "V1"
backup_policy_vm_instant_restore_retention_days = 2
backup_policy_vm_timezone                       = "UTC"
backup_policy_vm_frequency                      = "Daily"
backup_policy_vm_time                           = "12:00"
backup_policy_vm_hour_interval                  = 8
backup_policy_vm_hour_duration                  = 8
backup_policy_vm_weekdays                       = ["Sunday"]
backup_policy_vm_count                          = 8
vm_policy_retention_weekly_count                = 2
vm_policy_retention_weekly_weekdays             = ["Sunday"]
vm_policy_retention_monthly_count               = 2
vm_policy_retention_monthly_weekdays            = ["Sunday"]
vm_policy_retention_monthly_weeks               = ["First"]
vm_policy_retention_yearly_count                = 2
vm_policy_retention_yearly_weekdays             = ["Sunday"]
vm_policy_retention_yearly_weeks                = ["First"]
vm_policy_retention_yearly_months               = ["May"]

enable_backup_policy_vm_workload              =  true//false
backup_policy_vm_workload_name                = "rsv-testing-vm-workload-policy"
backup_policy_vm_workload_type                = "SQLDataBase"
backup_policy_vm_workload_timezone            = "UTC"
backup_policy_vm_workload_compression_enabled = false
backup_policy_vm_protection_policy = [{
  backup = [{
    frequency            = "Daily"
    frequency_in_minutes = 15
    time                 = "15:00"
    weekdays             = null
  }]
  policy_type = "Full"
  retention_daily = [{
    count = 8
  }]
  retention_monthly = [{
    count       = 2
    format_type = "Daily"
    monthdays   = [1]
    weekdays    = ["Sunday"]
    weeks       = ["First"]
  }]
  retention_weekly = [{
    count    = 2
    weekdays = ["Sunday"]
  }]
  retention_yearly = [{
    count       = 2
    format_type = "Daily"
    monthdays   = [1]
    months      = ["May"]
    weekdays    = ["Sunday"]
    weeks       = ["First"]
  }]
  simple_retention = [{
    sr_count       = "8"
  }]
}]

#----DEFAULT VALUES: PRIVATE ENDPOINT MODULE----#
create_private-endpoint           = true
private_endpoint_name             = "rsv-pep-testing-as"
private_service_connection_name   = "rsv-privateserviceconnection-testing"
subresource_names                 = ["AzureBackup"]
is_manual_connection              = false
request_message                   = null
private_connection_resource_id    = null
subnet_id                         = "/subscriptions/b325a432-99f2-46b9-99a4-f74d01446503/resourceGroups/rg-testing-as/providers/Microsoft.Network/virtualNetworks/testing-vnet-as/subnets/pep"
private_dns_zone_group            = null
private_connection_resource_alias = null
/*
#----DEFAULT VALUES: ALERT MODULE----#
action_group_name        = "test-action-groupas"
short_name               = "actiongz"
action_group_rule_name   = "test-z"
scope_type               = "Resource"
activity_log_alert_name  = "test-activitylogalertkv"
resource_group_id        = "/subscriptions/b325a432-99f2-46b9-99a4-f74d01446503/resourceGroups/rg-testing-as"
operation_name_log_alert = "Microsoft.Network/networkSecurityGroups/write"
category_log_alert       = "Security"
metric_alert_name        = "test-metricalertkv"
storage_account_id       = "/subscriptions/b325a432-99f2-46b9-99a4-f74d01446503/resourceGroups/rg-testing-as/providers/Microsoft.Storage/storageAccounts/cilstretestingas"
metric_namespace         = "Microsoft.Storage/storageAccounts"
metric_name              = "Transactions"
aggregation              = "Total"
operator                 = "GreaterThan"
threshold                = 50
dimension_name           = "ApiName"
dimension_operator       = "Include"
values                   = ["*"]

#----DEFAULT VALUES: DIAGNOSTIC MODULE----#
enable_log_monitoring           = true
diag_name                       = "rsv-diag"
log_analytics_workspace_id      = null
log_analytics_destination_type  = null #"Dedicated"
eventhub_name                   = null
eventhub_authorization_rule_id  = null
log_enabled                     = true
log_retention_policy_enabled    = true
log_retention_days              = 7
metric_retention_policy_enabled = true
metric_retention_days           = 7
*/