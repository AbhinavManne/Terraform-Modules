<!-- BEGIN_TF_DOCS -->
###### Last Updated[DD/MM/YYYY]: 30/08/2022
##  Introduction 
This module helps us to provision Recovery Service Vault along with the following policies-
* Backup Policy File Share
* Backup Policy VM
* Backup Policy VM Workload
###### All the mentioned policies are optional


## File Structure 
This particular module is having the following configuration files.
- recovery-services-vault.tf : This file is having the terraform code to provision the resources as per requirements.
- variables.tf : This file consists of all the variable definitions needed for the terraform code mentioned in recovery-services-vault.tf
- output.tf : This file will be having the resource output details generated.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.20.0 |

## Resources

| Name | Type |
|------|------|
| [azurerm_backup_policy_file_share.fs_policy](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/backup_policy_file_share) | resource |
| [azurerm_backup_policy_vm.vm_policy](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/backup_policy_vm) | resource |
| [azurerm_backup_policy_vm_workload.vm_workload_policy](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/backup_policy_vm_workload) | resource |
| [azurerm_recovery_services_vault.vault](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/recovery_services_vault) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_backup_policy_file_share_count"></a> [backup\_policy\_file\_share\_count](#input\_backup\_policy\_file\_share\_count) | The number of daily backups to keep. Must be between 1 and 200 (inclusive) | `number` | n/a | yes |
| <a name="input_backup_policy_file_share_frequency"></a> [backup\_policy\_file\_share\_frequency](#input\_backup\_policy\_file\_share\_frequency) | Sets the backup frequency. Currently, only Daily is supported | `string` | `"Daily"` | no |
| <a name="input_backup_policy_file_share_name"></a> [backup\_policy\_file\_share\_name](#input\_backup\_policy\_file\_share\_name) | Specifies the name of the policy. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_backup_policy_file_share_time"></a> [backup\_policy\_file\_share\_time](#input\_backup\_policy\_file\_share\_time) | The time of day to perform the backup in 24-hour format. Times must be either on the hour or half hour (e.g. 12:00, 12:30, 13:00, etc.) | `string` | n/a | yes |
| <a name="input_backup_policy_file_share_timezone"></a> [backup\_policy\_file\_share\_timezone](#input\_backup\_policy\_file\_share\_timezone) | Specifies the timezone. the possible values are defined here. Defaults to UTC | `string` | `"UTC"` | no |
| <a name="input_backup_policy_vm_count"></a> [backup\_policy\_vm\_count](#input\_backup\_policy\_vm\_count) | The number of daily backups to keep. Must be between 7 and 9999. | `number` | n/a | yes |
| <a name="input_backup_policy_vm_frequency"></a> [backup\_policy\_vm\_frequency](#input\_backup\_policy\_vm\_frequency) | Sets the backup frequency. Currently, only Daily is supported | `string` | n/a | yes |
| <a name="input_backup_policy_vm_hour_duration"></a> [backup\_policy\_vm\_hour\_duration](#input\_backup\_policy\_vm\_hour\_duration) | Duration of the backup window in hours. Possible values are between 4 and 24 This is used when frequency is Hourly. | `string` | n/a | yes |
| <a name="input_backup_policy_vm_hour_interval"></a> [backup\_policy\_vm\_hour\_interval](#input\_backup\_policy\_vm\_hour\_interval) | Interval in hour at which backup is triggered. Possible values are 4, 6, 8 and 12. This is used when frequency is Hourly. | `number` | n/a | yes |
| <a name="input_backup_policy_vm_instant_restore_retention_days"></a> [backup\_policy\_vm\_instant\_restore\_retention\_days](#input\_backup\_policy\_vm\_instant\_restore\_retention\_days) | Specifies the instant restore retention range in days. Possible values are between 1 and 5 when policy\_type is V1, and 1 to 30 when policy\_type is V2. | `number` | n/a | yes |
| <a name="input_backup_policy_vm_name"></a> [backup\_policy\_vm\_name](#input\_backup\_policy\_vm\_name) | Specifies the name of the policy. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_backup_policy_vm_protection_policy"></a> [backup\_policy\_vm\_protection\_policy](#input\_backup\_policy\_vm\_protection\_policy) | One or more protection\_policy type blocks | <pre>list(object({<br>    policy_type = string<br>    backup = list(object({<br>      frequency            = string<br>      frequency_in_minutes = number<br>      time                 = string<br>      weekdays             = list(string)<br>    }))<br>    retention_daily = list(object({<br>      count = number<br>    }))<br>    retention_weekly = list(object({<br>      count    = number<br>      weekdays = list(string)<br>    }))<br>    retention_monthly = list(object({<br>      count       = number<br>      format_type = string<br>      monthdays   = list(number)<br>      weekdays    = list(string)<br>      weeks       = list(string)<br>    }))<br>    retention_yearly = list(object({<br>      count       = number<br>      format_type = string<br>      months      = list(string)<br>      monthdays   = list(number)<br>      weekdays    = list(string)<br>      weeks       = list(string)<br>    }))<br>    simple_retention = map(any)<br>    # object({<br>    #   count       = number<br>    # })<br>  }))</pre> | n/a | yes |
| <a name="input_backup_policy_vm_time"></a> [backup\_policy\_vm\_time](#input\_backup\_policy\_vm\_time) | The time of day to perform the backup in 24-hour format. Times must be either on the hour or half hour (e.g. 12:00, 12:30, 13:00, etc.) | `string` | n/a | yes |
| <a name="input_backup_policy_vm_timezone"></a> [backup\_policy\_vm\_timezone](#input\_backup\_policy\_vm\_timezone) | Specifies the timezone. the possible values are defined here. Defaults to UTC | `string` | `"UTC"` | no |
| <a name="input_backup_policy_vm_type"></a> [backup\_policy\_vm\_type](#input\_backup\_policy\_vm\_type) | Type of the Backup Policy. Possible values are V1 and V2 where V2 stands for the Enhanced Policy. Defaults to V1. Changing this forces a new resource to be created. | `string` | `"V1"` | no |
| <a name="input_backup_policy_vm_weekdays"></a> [backup\_policy\_vm\_weekdays](#input\_backup\_policy\_vm\_weekdays) | The days of the week to perform backups on. Must be one of Sunday, Monday, Tuesday, Wednesday, Thursday, Friday or Saturday. This is used when frequency is Weekly. | `list(string)` | n/a | yes |
| <a name="input_backup_policy_vm_workload_compression_enabled"></a> [backup\_policy\_vm\_workload\_compression\_enabled](#input\_backup\_policy\_vm\_workload\_compression\_enabled) | The compression setting for the VM Workload Backup Policy. Defaults to false. | `bool` | n/a | yes |
| <a name="input_backup_policy_vm_workload_name"></a> [backup\_policy\_vm\_workload\_name](#input\_backup\_policy\_vm\_workload\_name) | The name of the VM Workload Backup Policy. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_backup_policy_vm_workload_timezone"></a> [backup\_policy\_vm\_workload\_timezone](#input\_backup\_policy\_vm\_workload\_timezone) | The timezone for the VM Workload Backup Policy. | `string` | n/a | yes |
| <a name="input_backup_policy_vm_workload_type"></a> [backup\_policy\_vm\_workload\_type](#input\_backup\_policy\_vm\_workload\_type) | The VM Workload type for the Backup Policy. Possible values are SQLDataBase and SAPHanaDatabase. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_cross_region_restore_enabled"></a> [cross\_region\_restore\_enabled](#input\_cross\_region\_restore\_enabled) | Is cross region restore enabled for this Vault? Only can be true, when storage\_mode\_type is GeoRedundant. Defaults to false. | `bool` | `false` | no |
| <a name="input_enable_backup_policy_file_share"></a> [enable\_backup\_policy\_file\_share](#input\_enable\_backup\_policy\_file\_share) | Wants to enable backup policy for file share? | `bool` | n/a | yes |
| <a name="input_enable_backup_policy_vm"></a> [enable\_backup\_policy\_vm](#input\_enable\_backup\_policy\_vm) | Wants to enable backup policy for VM? | `bool` | n/a | yes |
| <a name="input_enable_backup_policy_vm_workload"></a> [enable\_backup\_policy\_vm\_workload](#input\_enable\_backup\_policy\_vm\_workload) | Wants to enable backup policy VM workload? | `bool` | n/a | yes |
| <a name="input_encryption_key_id"></a> [encryption\_key\_id](#input\_encryption\_key\_id) | The Key Vault key id used to encrypt this vault. Key managed by Vault Managed Hardware Security Module is also supported. | `string` | n/a | yes |
| <a name="input_fs_policy_retention_monthly_count"></a> [fs\_policy\_retention\_monthly\_count](#input\_fs\_policy\_retention\_monthly\_count) | count - The number of monthly backups to keep. | `number` | n/a | yes |
| <a name="input_fs_policy_retention_monthly_weekdays"></a> [fs\_policy\_retention\_monthly\_weekdays](#input\_fs\_policy\_retention\_monthly\_weekdays) | The weekday backups to retain. | `list(string)` | n/a | yes |
| <a name="input_fs_policy_retention_monthly_weeks"></a> [fs\_policy\_retention\_monthly\_weeks](#input\_fs\_policy\_retention\_monthly\_weeks) | The week backups to retain. | `list(string)` | n/a | yes |
| <a name="input_fs_policy_retention_weekly_count"></a> [fs\_policy\_retention\_weekly\_count](#input\_fs\_policy\_retention\_weekly\_count) | count - The number of daily backups to keep. | `number` | n/a | yes |
| <a name="input_fs_policy_retention_weekly_weekdays"></a> [fs\_policy\_retention\_weekly\_weekdays](#input\_fs\_policy\_retention\_weekly\_weekdays) | The weekday backups to retain. | `list(string)` | n/a | yes |
| <a name="input_fs_policy_retention_yearly_count"></a> [fs\_policy\_retention\_yearly\_count](#input\_fs\_policy\_retention\_yearly\_count) | count - The number of yearly backups to keep. | `number` | n/a | yes |
| <a name="input_fs_policy_retention_yearly_months"></a> [fs\_policy\_retention\_yearly\_months](#input\_fs\_policy\_retention\_yearly\_months) | The months backups to retain. | `list(string)` | n/a | yes |
| <a name="input_fs_policy_retention_yearly_weekdays"></a> [fs\_policy\_retention\_yearly\_weekdays](#input\_fs\_policy\_retention\_yearly\_weekdays) | The weekday backups to retain. | `list(string)` | n/a | yes |
| <a name="input_fs_policy_retention_yearly_weeks"></a> [fs\_policy\_retention\_yearly\_weeks](#input\_fs\_policy\_retention\_yearly\_weeks) | The weeks backups to retain. | `list(string)` | n/a | yes |
| <a name="input_identity_type"></a> [identity\_type](#input\_identity\_type) | The Type of Identity which should be used for this Recovery Services Vault. At this time the only possible value is SystemAssigned. | `string` | `"SystemAssigned"` | no |
| <a name="input_infrastructure_encryption_enabled"></a> [infrastructure\_encryption\_enabled](#input\_infrastructure\_encryption\_enabled) | Enabling/Disabling the Double Encryption state. | `bool` | `false` | no |
| <a name="input_location"></a> [location](#input\_location) | Location of RG | `string` | n/a | yes |
| <a name="input_recovery_vault_name"></a> [recovery\_vault\_name](#input\_recovery\_vault\_name) | recovery service keyvault name in Azure | `string` | n/a | yes |
| <a name="input_recovery_vault_sku"></a> [recovery\_vault\_sku](#input\_recovery\_vault\_sku) | Sets the vault's SKU. Possible values include: Standard, RS0. | `string` | n/a | yes |
| <a name="input_recovery_vault_soft_delete_enabled"></a> [recovery\_vault\_soft\_delete\_enabled](#input\_recovery\_vault\_soft\_delete\_enabled) | Is soft delete enable for this Vault? | `bool` | `true` | no |
| <a name="input_recovery_vault_storage_mode_type"></a> [recovery\_vault\_storage\_mode\_type](#input\_recovery\_vault\_storage\_mode\_type) | The storage type of the Recovery Services Vault. Possible values are GeoRedundant, LocallyRedundant and ZoneRedundant. Defaults to GeoRedundant. | `string` | `"GeoRedundant"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | RG name in Azure | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the resource. | `map(string)` | n/a | yes |
| <a name="input_use_system_assigned_identity"></a> [use\_system\_assigned\_identity](#input\_use\_system\_assigned\_identity) | Indicate that system assigned identity should be used or not. At this time the only possible value is true. Defaults to true. | `bool` | `true` | no |
| <a name="input_vm_policy_retention_monthly_count"></a> [vm\_policy\_retention\_monthly\_count](#input\_vm\_policy\_retention\_monthly\_count) | The number of monthly backups to keep. Must be between 1 and 9999 | `number` | n/a | yes |
| <a name="input_vm_policy_retention_monthly_weekdays"></a> [vm\_policy\_retention\_monthly\_weekdays](#input\_vm\_policy\_retention\_monthly\_weekdays) | The weekday backups to retain. | `list(string)` | n/a | yes |
| <a name="input_vm_policy_retention_monthly_weeks"></a> [vm\_policy\_retention\_monthly\_weeks](#input\_vm\_policy\_retention\_monthly\_weeks) | The week backups to retain. | `list(string)` | n/a | yes |
| <a name="input_vm_policy_retention_weekly_count"></a> [vm\_policy\_retention\_weekly\_count](#input\_vm\_policy\_retention\_weekly\_count) | The number of weekly backups to keep. Must be between 1 and 9999 | `number` | n/a | yes |
| <a name="input_vm_policy_retention_weekly_weekdays"></a> [vm\_policy\_retention\_weekly\_weekdays](#input\_vm\_policy\_retention\_weekly\_weekdays) | The weekday backups to retain. | `list(string)` | n/a | yes |
| <a name="input_vm_policy_retention_yearly_count"></a> [vm\_policy\_retention\_yearly\_count](#input\_vm\_policy\_retention\_yearly\_count) | count - The number of yearly backups to keep. | `number` | n/a | yes |
| <a name="input_vm_policy_retention_yearly_months"></a> [vm\_policy\_retention\_yearly\_months](#input\_vm\_policy\_retention\_yearly\_months) | The months backups to retain. | `list(string)` | n/a | yes |
| <a name="input_vm_policy_retention_yearly_weekdays"></a> [vm\_policy\_retention\_yearly\_weekdays](#input\_vm\_policy\_retention\_yearly\_weekdays) | The weekday backups to retain. | `list(string)` | n/a | yes |
| <a name="input_vm_policy_retention_yearly_weeks"></a> [vm\_policy\_retention\_yearly\_weeks](#input\_vm\_policy\_retention\_yearly\_weeks) | The weeks backups to retain. | `list(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_fs_policy_id"></a> [fs\_policy\_id](#output\_fs\_policy\_id) | The ID of the Azure File Share Backup Policy. |
| <a name="output_identity_principal_id"></a> [identity\_principal\_id](#output\_identity\_principal\_id) | The Principal ID associated with this Managed Service Identity. |
| <a name="output_identity_tenant_id"></a> [identity\_tenant\_id](#output\_identity\_tenant\_id) | The Tenant ID associated with this Managed Service Identity. |
| <a name="output_recovery_vault_id"></a> [recovery\_vault\_id](#output\_recovery\_vault\_id) | The ID of the Recovery Services Vault. |
| <a name="output_recovery_vault_name"></a> [recovery\_vault\_name](#output\_recovery\_vault\_name) | The Name of the Recovery Services Vault. |
| <a name="output_vm_policy_id"></a> [vm\_policy\_id](#output\_vm\_policy\_id) | The ID of the VM Backup Policy. |
| <a name="output_vm_workload_policy_id"></a> [vm\_workload\_policy\_id](#output\_vm\_workload\_policy\_id) | The ID of the Azure VM Workload Backup Policy. |

## Module Usage
```
#Reference to recovery services vault module
module "recovery_service_vault" {
  source                             = "../../modules/module_recovery_services_vault/recovery_service_module"
  resource_group_name                = var.resource_group_name
  location                           = var.location
  recovery_vault_name                = var.recovery_vault_name
  recovery_vault_sku                 = var.recovery_vault_sku
  recovery_vault_storage_mode_type   = var.recovery_vault_storage_mode_type
  cross_region_restore_enabled       = var.cross_region_restore_enabled
  recovery_vault_soft_delete_enabled = var.recovery_vault_soft_delete_enabled
  identity_type                      = var.identity_type
  encryption_key_id                  = var.encryption_key_id
  infrastructure_encryption_enabled  = var.infrastructure_encryption_enabled
  use_system_assigned_identity       = var.use_system_assigned_identity
  tags                               = var.tags

  enable_backup_policy_file_share      = var.enable_backup_policy_file_share
  backup_policy_file_share_name        = var.backup_policy_file_share_name
  backup_policy_file_share_timezone    = var.backup_policy_file_share_timezone
  backup_policy_file_share_frequency   = var.backup_policy_file_share_frequency
  backup_policy_file_share_time        = var.backup_policy_file_share_time
  backup_policy_file_share_count       = var.backup_policy_file_share_count
  fs_policy_retention_weekly_count     = var.fs_policy_retention_weekly_count
  fs_policy_retention_weekly_weekdays  = var.fs_policy_retention_weekly_weekdays
  fs_policy_retention_monthly_count    = var.fs_policy_retention_monthly_count
  fs_policy_retention_monthly_weekdays = var.fs_policy_retention_monthly_weekdays
  fs_policy_retention_monthly_weeks    = var.fs_policy_retention_monthly_weeks
  fs_policy_retention_yearly_count     = var.fs_policy_retention_yearly_count
  fs_policy_retention_yearly_weekdays  = var.fs_policy_retention_yearly_weekdays
  fs_policy_retention_yearly_weeks     = var.fs_policy_retention_yearly_weeks
  fs_policy_retention_yearly_months    = var.fs_policy_retention_yearly_months

  enable_backup_policy_vm                         = var.enable_backup_policy_vm
  backup_policy_vm_name                           = var.backup_policy_vm_name
  backup_policy_vm_type                           = var.backup_policy_vm_type
  backup_policy_vm_instant_restore_retention_days = var.backup_policy_vm_instant_restore_retention_days
  backup_policy_vm_timezone                       = var.backup_policy_vm_timezone
  backup_policy_vm_frequency                      = var.backup_policy_vm_frequency
  backup_policy_vm_time                           = var.backup_policy_vm_time
  backup_policy_vm_hour_interval                  = var.backup_policy_vm_hour_interval
  backup_policy_vm_hour_duration                  = var.backup_policy_vm_hour_duration
  backup_policy_vm_weekdays                       = var.backup_policy_vm_weekdays
  backup_policy_vm_count                          = var.backup_policy_vm_count
  vm_policy_retention_weekly_count                = var.vm_policy_retention_weekly_count
  vm_policy_retention_weekly_weekdays             = var.vm_policy_retention_weekly_weekdays
  vm_policy_retention_monthly_count               = var.vm_policy_retention_monthly_count
  vm_policy_retention_monthly_weekdays            = var.vm_policy_retention_monthly_weekdays
  vm_policy_retention_monthly_weeks               = var.vm_policy_retention_monthly_weeks
  vm_policy_retention_yearly_count                = var.vm_policy_retention_yearly_count
  vm_policy_retention_yearly_weekdays             = var.vm_policy_retention_yearly_weekdays
  vm_policy_retention_yearly_weeks                = var.vm_policy_retention_yearly_weeks
  vm_policy_retention_yearly_months               = var.vm_policy_retention_yearly_months

  enable_backup_policy_vm_workload              = var.enable_backup_policy_vm_workload
  backup_policy_vm_workload_name                = var.backup_policy_vm_workload_name
  backup_policy_vm_workload_type                = var.backup_policy_vm_workload_type
  backup_policy_vm_workload_timezone            = var.backup_policy_vm_workload_timezone
  backup_policy_vm_workload_compression_enabled = var.backup_policy_vm_workload_compression_enabled
  //vm_workload_simple_retention_count            = var.vm_workload_simple_retention_count
  backup_policy_vm_protection_policy            = var.backup_policy_vm_protection_policy

}

# System Managed Service Identity of Recovery Service Vault does not have enough permissions to create private 
#endpoint in resource group or join it to a subnet.
data "azurerm_role_definition" "contributor" {
  name = "Contributor"
}
resource "azurerm_role_assignment" "peprassign" {
  scope              = var.resource_group_id
  role_definition_id = data.azurerm_role_definition.contributor.id
  principal_id       = module.recovery_service_vault.identity_principal_id
}

#Reference to module that provisions private endpoint
// By default this module is optional
module "PrivateEndpointSql_module" {
  count                             = var.create_private-endpoint ? 1 : 0
  source                            = "../../modules/module_private_endpoint"
  resource_group_name               = var.resource_group_name
  location                          = var.location
  tags                              = var.tags
  private_endpoint_name             = var.private_endpoint_name
  private_service_connection_name   = var.private_service_connection_name
  subresource_names                 = var.subresource_names
  is_manual_connection              = var.is_manual_connection
  request_message                   = var.request_message
  private_connection_resource_id    = module.recovery_service_vault.recovery_vault_id
  subnet_id                         = var.subnet_id
  private_dns_zone_group            = var.private_dns_zone_group
  private_connection_resource_alias = var.private_connection_resource_alias
}

#Reference to module that provisions alerts resources
module "alert" {
  source                   = "../../modules/module_alert"
  action_group_name        = var.action_group_name
  resource_group_name      = var.resource_group_name
  resource_group_location  = var.location
  short_name               = var.short_name
  action_group_rule_name   = var.action_group_rule_name
  scope_type               = var.scope_type
  resource_id              = module.recovery_service_vault.recovery_vault_id
  activity_log_alert_name  = var.activity_log_alert_name
  resource_group_id        = var.resource_group_id
  operation_name_log_alert = var.operation_name_log_alert
  category_log_alert       = var.category_log_alert
  metric_alert_name        = var.metric_alert_name
  storage_account_id       = var.storage_account_id
  metric_namespace         = var.metric_namespace
  metric_name              = var.metric_name
  aggregation              = var.aggregation
  operator                 = var.operator
  threshold                = var.threshold
  dimension_name           = var.dimension_name
  dimension_operator       = var.dimension_operator
  values                   = var.values
}

#Reference to module that provisions diagnostic resources
module "diag_settings" {
  source                          = "../../modules/module_diagnostics_settings"
  enable_log_monitoring           = var.enable_log_monitoring
  diag_name                       = var.diag_name
  target_resource_id              = module.recovery_service_vault.recovery_vault_id
  log_analytics_workspace_id      = var.log_analytics_workspace_id
  log_analytics_destination_type  = var.log_analytics_destination_type
  storage_account_id              = var.storage_account_id
  eventhub_name                   = var.eventhub_name
  eventhub_authorization_rule_id  = var.eventhub_authorization_rule_id
  log_enabled                     = var.log_enabled
  log_retention_policy_enabled    = var.log_retention_policy_enabled
  log_retention_days              = var.log_retention_days
  metric_retention_policy_enabled = var.metric_retention_policy_enabled
  metric_retention_days           = var.metric_retention_days
}
```

## Recovery Service Vault : MSDOC
* Please refer this link to explore more about Azure Recovery Service Vault: [Recovery_Service_Vault](https://docs.microsoft.com/en-us/azure/backup/backup-azure-recovery-services-vault-overview)

## Recovery Service Vault : Terraform
* Please refer this link to understand more about Azure Recovery Service Vault configurations through terraform: [Recovery_Service_Vault_Terraform_Registry](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/recovery_services_vault)

## Backup Policy File Share : Terraform
* Please refer this link to understand more about Azure Backup Policy File Share configurations through terraform: [Backup_Policy_File_Share_Terraform_Registry](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/backup_policy_file_share)

## Backup Policy VM : Terraform
* Please refer this link to understand more about Azure Backup Policy VM configurations through terraform: [Backup_Policy_VM_Terraform_Registry](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/backup_policy_vm)

## Backup Policy VM Workload : Terraform
* Please refer this link to understand more about Azure Backup Policy VM Workload configurations through terraform: [Backup_Policy_VM_Workload_Terraform_Registry](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/backup_policy_vm_workload)

<!-- END_TF_DOCS -->