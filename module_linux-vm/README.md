<!-- BEGIN_TF_DOCS -->
###### Last Updated[DD/MM/YYYY]: 24/08/2022
##  Introduction 
This module helps us to provision Linux Virtual Machine along with the following resources-:
* Managed Disks
* Virtual Machine Data Disk Attachment
* Resource Policy Assignment
* VM Shutdown Schedule
* VM Extensions (diagnostics settings, monitoring agent, a dependency agent)
* Backup Policy VM
* Backup Protected VM
* Disk Encryption Set

## File Structure 

- This module has a templates folder which consists a .tmpl file. This file is used for enabling diagnostics settings in a virtual machine.

This particular module is having the following configuration files.
- vm.tf : This file is having the terraform code to provision the resources as per requirements.
- Variables.tf : This file consists of all the variable definitions needed for the terraform code mentioned in vm.tf
- Output.tf : This file will be having the resource output details generated.

##  Requirements 

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 2.77, < 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |
| <a name="provider_tls"></a> [tls](#provider\_tls) | 4.0.1 |


## Resources

| Name | Type |
|------|------|
| [azurerm_backup_policy_vm.backuppol](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/backup_policy_vm) | resource |
| [azurerm_backup_protected_vm.bpvm](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/backup_protected_vm) | resource |
| [azurerm_dev_test_global_vm_shutdown_schedule.shutdown](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dev_test_global_vm_shutdown_schedule) | resource |
| [azurerm_disk_encryption_set.disken](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/disk_encryption_set) | resource |
| [azurerm_linux_virtual_machine.lvm](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine) | resource |
| [azurerm_managed_disk.mdisk](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/managed_disk) | resource |
| [azurerm_resource_policy_assignment.policy](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_policy_assignment) | resource |
| [azurerm_role_assignment.disk-encryption-read-keyvault](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_security_center_subscription_pricing.defender](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/security_center_subscription_pricing) | resource |
| [azurerm_virtual_machine_data_disk_attachment.dda](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_machine_data_disk_attachment) | resource |
| [azurerm_virtual_machine_extension.da](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_machine_extension) | resource |
| [azurerm_virtual_machine_extension.diagnostics](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_machine_extension) | resource |
| [azurerm_virtual_machine_extension.mmaagent](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_machine_extension) | resource |
| [tls_private_key.rsa](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key) | resource |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/client_config) | data source |
| [azurerm_key_vault_key.data_key](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/key_vault_key) | data source |
| [azurerm_storage_account_sas.token](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/storage_account_sas) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_password"></a> [admin\_password](#input\_admin\_password) | The password associated with the local administrator account. | `string` | n/a | yes |
| <a name="input_admin_ssh_key_public_key"></a> [admin\_ssh\_key\_public\_key](#input\_admin\_ssh\_key\_public\_key) | The Public Key which should be used for authentication, which needs to be at least 2048-bit and in ssh-rsa format. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_admin_ssh_key_username"></a> [admin\_ssh\_key\_username](#input\_admin\_ssh\_key\_username) | The Username for which this Public SSH Key should be configured. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_admin_username"></a> [admin\_username](#input\_admin\_username) | Specifies the name of the local administrator account. | `string` | n/a | yes |
| <a name="input_allow_extension_operations"></a> [allow\_extension\_operations](#input\_allow\_extension\_operations) | Enable-allow\_extension\_operations | `string` | n/a | yes |
| <a name="input_availability_set_id"></a> [availability\_set\_id](#input\_availability\_set\_id) | ID of the availability set in azure | `string` | n/a | yes |
| <a name="input_backup_frequency"></a> [backup\_frequency](#input\_backup\_frequency) | Sets the backup frequency. Must be either Daily orWeekly. | `string` | n/a | yes |
| <a name="input_backup_policy_vm_name"></a> [backup\_policy\_vm\_name](#input\_backup\_policy\_vm\_name) | Specifies the name of the Backup Policy. | `string` | n/a | yes |
| <a name="input_backup_time"></a> [backup\_time](#input\_backup\_time) | The time of day to perform the backup in 24hour format. | `string` | n/a | yes |
| <a name="input_before_shutdown_time_in_minutes"></a> [before\_shutdown\_time\_in\_minutes](#input\_before\_shutdown\_time\_in\_minutes) | Time in minutes between 15 and 120 before a shutdown event at which a notification will be sent. Defaults to 30. | number | 30 | no |
| <a name="input_caching"></a> [caching](#input\_caching) | Specifies the caching requirements for the OS Disk. Possible values include None, ReadOnly and ReadWrite. | `string` | n/a | yes |
| <a name="input_capacity_reservation_group_id"></a> [capacity\_reservation\_group\_id](#input\_capacity\_reservation\_group\_id) | Specifies the ID of the Capacity Reservation Group which the Virtual Machine should be allocated to. | `string` | `null` | no |
| <a name="input_computer_name"></a> [computer\_name](#input\_computer\_name) | Specifies the Hostname which should be used for this Virtual Machine. If unspecified this defaults to the value for the name field. If the value of the name field is not a valid computer\_name, then you must specify computer\_name. | `string` | `null` | no |
| <a name="input_custom_data"></a> [custom\_data](#input\_custom\_data) | Base64 encoded file of a bash script that gets run once by cloud-init upon VM creation | `string` | `null` | no |
| <a name="input_daily_recurrence_time"></a> [daily\_recurrence\_time](#input\_daily\_recurrence\_time) | The time each day when the schedule takes effect. | `string` | n/a | yes |
| <a name="input_data_disk_attachment_caching"></a> [data\_disk\_attachment\_caching](#input\_data\_disk\_attachment\_caching) | Data disk attachment caching | `string` | `"ReadWrite"` | no |
| <a name="input_data_disk_create_option"></a> [data\_disk\_create\_option](#input\_data\_disk\_create\_option) | Create option of data disk | `string` | `"Empty"` | no |
| <a name="input_data_disk_disk_size_gb"></a> [data\_disk\_disk\_size\_gb](#input\_data\_disk\_disk\_size\_gb) | Disk size gb of data disk | `number` | `10` | no |
| <a name="input_data_disk_storage_account_type"></a> [data\_disk\_storage\_account\_type](#input\_data\_disk\_storage\_account\_type) | Storage account type of data disk | `string` | `"Standard_LRS"` | no |
| <a name="input_dedicated_host_group_id"></a> [dedicated\_host\_group\_id](#input\_dedicated\_host\_group\_id) | The ID of a Dedicated Host Group that this Windows Virtual Machine should be run within. Conflicts with dedicated\_host\_id. | `string` | `null` | no |
| <a name="input_dedicated_host_id"></a> [dedicated\_host\_id](#input\_dedicated\_host\_id) | The ID of a Dedicated Host where this machine should be run on. | `string` | `null` | no |
| <a name="input_diag_publisher"></a> [diag\_publisher](#input\_diag\_publisher) | The publisher of the extension, available publishers can be found by using the Azure CLI. | `string` | n/a | yes |
| <a name="input_diag_type"></a> [diag\_type](#input\_diag\_type) | The type of extension, available types for a publisher can be found using the Azure CLI. | `string` | n/a | yes |
| <a name="input_diag_type_handler_version"></a> [diag\_type\_handler\_version](#input\_diag\_type\_handler\_version) | Specifies the version of the extension to use, available versions can be found using the Azure CLI. | `string` | n/a | yes |
| <a name="input_diff_disk_settings_option"></a> [diff\_disk\_settings\_option](#input\_diff\_disk\_settings\_option) | Specifies the Ephemeral Disk Settings for the OS Disk. At this time the only possible value is Local. Changing this forces a new resource to be created. | `string` | `null` | no |
| <a name="input_diff_disk_settings_placement"></a> [diff\_disk\_settings\_placement](#input\_diff\_disk\_settings\_placement) | Specifies where to store the Ephemeral Disk. Possible values are CacheDisk and ResourceDisk. Defaults to CacheDisk. Changing this forces a new resource to be created. | `string` | `null` | no |
| <a name="input_disable_password_authentication"></a> [disable\_password\_authentication](#input\_disable\_password\_authentication) | true/false- disable\_password\_authentication | `string` | n/a | yes |
| <a name="input_disk_encryption_identity_type"></a> [disk\_encryption\_identity\_type](#input\_disk\_encryption\_identity\_type) | Identity type of disk encryption | `string` | n/a | yes |
| <a name="input_disk_encryption_name"></a> [disk\_encryption\_name](#input\_disk\_encryption\_name) | The name of disk encryption. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_disk_size_gb"></a> [disk\_size\_gb](#input\_disk\_size\_gb) | The Size of the Internal OS Disk in GB, if you wish to vary from the size used in the image this Virtual Machine is sourced from. | `string` | `null` | no |
| <a name="input_edge_zone"></a> [edge\_zone](#input\_edge\_zone) | Specifies the Edge Zone within the Azure Region where this Windows Virtual Machine should exist. | `string` | `null` | no |
| <a name="input_enable_boot_diagnostics"></a> [enable\_boot\_diagnostics](#input\_enable\_boot\_diagnostics) | Should the boot diagnostics enabled? | `bool` | `false` | no |
| <a name="input_enable_diff_disk_settings"></a> [enable\_diff\_disk\_settings](#input\_enable\_diff\_disk\_settings) | Should diff disk settings be Enabled for this OS Disk? | `bool` | `false` | no |
| <a name="input_enable_disk_encryption"></a> [enable\_disk\_encryption](#input\_enable\_disk\_encryption) | enable\_disk\_encryption | `bool` | `true` | no |
| <a name="input_enable_os_disk_write_accelerator"></a> [enable\_os\_disk\_write\_accelerator](#input\_enable\_os\_disk\_write\_accelerator) | Should Write Accelerator be Enabled for this OS Disk? This requires that the `storage_account_type` is set to `Premium_LRS` and that `caching` is set to `None`. | `bool` | `false` | no |
| <a name="input_enable_secret_vm"></a> [enable\_secret\_vm](#input\_enable\_secret\_vm) | Enable secrets block in azure vm | `string` | `false` | no |
| <a name="input_enable_termination_notification"></a> [enable\_termination\_notification](#input\_enable\_termination\_notification) | Should the termination notification be enabled on this Virtual Machine? Defaults to false | `bool` | `false` | no |
| <a name="input_enable_ultra_ssd"></a> [enable\_ultra\_ssd](#input\_enable\_ultra\_ssd) | Should the capacity to enable Data Disks of the UltraSSD\_LRS storage account type be supported on this Virtual Machine | `bool` | `false` | no |
| <a name="input_encryption_at_host_enabled"></a> [encryption\_at\_host\_enabled](#input\_encryption\_at\_host\_enabled) | Should all of the disks (including the temp disk) attached to this Virtual Machine be encrypted by enabling Encryption at Host? | `bool` | `false` | no |
| <a name="input_email"></a> [email](#input\_email) | E-mail address to which the notification will be sent. | `string` | n/a | no |
| <a name="input_eviction_policy"></a> [eviction\_policy](#input\_eviction\_policy) | Specifies what should happen when the Virtual Machine is evicted for price reasons when using a Spot instance. At this time the only supported value is Deallocate. | `string` | `"Deallocate"` | no |
| <a name="input_ex_diag"></a> [ex\_diag](#input\_ex\_diag) | The name of the virtual machine extension peering. | `string` | n/a | yes |
| <a name="input_extensions_time_budget"></a> [extensions\_time\_budget](#input\_extensions\_time\_budget) | Specifies the duration allocated for all extensions to start. The time duration should be between 15 minutes and 120 minutes (inclusive) and should be specified in ISO 8601 format. Defaults to 90 minutes (PT1H30M). | `string` | `"PT1H30M"` | no |
| <a name="input_generate_admin_ssh_key"></a> [generate\_admin\_ssh\_key](#input\_generate\_admin\_ssh\_key) | Wants to generate admin ssh key? | `bool` | n/a | yes |
| <a name="input_key_vault_id"></a> [key\_vault\_id](#input\_key\_vault\_id) | keyvault ID | `string` | `null` | no |
| <a name="input_keyvault_id"></a> [keyvault\_id](#input\_keyvault\_id) | keyvault\_id | `string` | n/a | yes |
| <a name="input_keyvault_key_name"></a> [keyvault\_key\_name](#input\_keyvault\_key\_name) | Specifies the name of the Key Vault Key. | `string` | n/a | yes |
| <a name="input_latest_version"></a> [latest\_version](#input\_latest\_version) | Specifies the version of the image used to create the virtual machine. | `string` | n/a | yes |
| <a name="input_license_type"></a> [license\_type](#input\_license\_type) | Specifies the BYOL Type for this Virtual Machine. This is only applicable to Windows Virtual Machines. Possible values are Windows\_Client and Windows\_Server. | `string` | `"RHEL_BYOS"` | no |
| <a name="input_location"></a> [location](#input\_location) | The location/region to keep all your resources. To get the list of all locations with table format from azure cli, run 'az account list-locations -o table' | `string` | n/a | yes |
| <a name="input_log_analytics_workspace_id"></a> [log\_analytics\_workspace\_id](#input\_log\_analytics\_workspace\_id) | Log analytics workspace ID | `string` | `null` | no |
| <a name="input_log_primary_shared_key"></a> [log\_primary\_shared\_key](#input\_log\_primary\_shared\_key) | Log analytics primary shared key | `string` | `null` | no |
| <a name="input_managed_disk_name"></a> [managed\_disk\_name](#input\_managed\_disk\_name) | Name of the managed disk | `string` | `"mdisks"` | no |
| <a name="input_managed_identity_ids"></a> [managed\_identity\_ids](#input\_managed\_identity\_ids) | A list of User Managed Identity ID's which should be assigned to the Virtual Machine. | `list(string)` | `null` | no |
| <a name="input_managed_identity_type"></a> [managed\_identity\_type](#input\_managed\_identity\_type) | The type of Managed Identity which should be assigned to the Virtual Machine. Possible values are `SystemAssigned`, `UserAssigned` and `SystemAssigned, UserAssigned` | `string` | `"SystemAssigned, UserAssigned"` | no |
| <a name="input_max_bid_price"></a> [max\_bid\_price](#input\_max\_bid\_price) | The maximum price you're willing to pay for this Virtual Machine, in US Dollars; which must be greater than the current spot price. If this bid price falls below the current spot price the Virtual Machine will be evicted using the eviction\_policy. Defaults to -1, which means that the Virtual Machine should not be evicted for price reasons. | `number` | `-1` | no |
| <a name="input_monitoring_auto_upgrade_minor_version"></a> [monitoring\_auto\_upgrade\_minor\_version](#input\_monitoring\_auto\_upgrade\_minor\_version) | Specifies if the platform deploys the latest minor version update to the type\_handler\_version specified. | `string` | n/a | yes |
| <a name="input_monitoring_publisher"></a> [monitoring\_publisher](#input\_monitoring\_publisher) | The publisher of the extension, available publishers can be found by using the Azure CLI. | `string` | n/a | yes |
| <a name="input_monitoring_type"></a> [monitoring\_type](#input\_monitoring\_type) | The type of extension, available types for a publisher can be found using the Azure CLI. | `string` | n/a | yes |
| <a name="input_monitoring_type_handler_version"></a> [monitoring\_type\_handler\_version](#input\_monitoring\_type\_handler\_version) | Specifies the version of the extension to use, available versions can be found using the Azure CLI. | `string` | n/a | yes |
| <a name="input_network_interface_ids"></a> [network\_interface\_ids](#input\_network\_interface\_ids) | Network interface IDs | `string` | n/a | yes |
| <a name="input_no_of_managed_disks"></a> [no\_of\_managed\_disks](#input\_no\_of\_managed\_disks) | Number of required managed disks | `number` | `2` | no |
| <a name="input_notification_settings_enabled"></a> [notification\_settings\_enabled](#input\_notification\_settings\_enabled) | Whether to enable pre-shutdown notifications. Possible values are true and false. Defaults to false | `string` | n/a | yes |
| <a name="input_offer"></a> [offer](#input\_offer) | Specifies the offer of the image used to create the virtual machine | `string` | n/a | yes |
| <a name="input_patch_mode"></a> [patch\_mode](#input\_patch\_mode) | Specifies the mode of in-guest patching to this Windows Virtual Machine. Possible values are `Manual`, `AutomaticByOS` and `AutomaticByPlatform` | `string` | `"ImageDefault"` | no |
| <a name="input_plan_name"></a> [plan\_name](#input\_plan\_name) | Specifies the Name of the Marketplace Image this Virtual Machine should be created from. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_plan_product"></a> [plan\_product](#input\_plan\_product) | Specifies the Product of the Marketplace Image this Virtual Machine should be created from. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_plan_publisher"></a> [plan\_publisher](#input\_plan\_publisher) | Specifies the Publisher of the Marketplace Image this Virtual Machine should be created from. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_platform_fault_domain"></a> [platform\_fault\_domain](#input\_platform\_fault\_domain) | Specifies the Platform Fault Domain in which this Windows Virtual Machine should be created. Defaults to -1, which means this will be automatically assigned to a fault domain that best maintains balance across the available fault domains. Changing this forces a new Windows Virtual Machine to be created. | `string` | `null` | no |
| <a name="input_policy_definition_id"></a> [policy\_definition\_id](#input\_policy\_definition\_id) | Policy definition ID | `string` | `"/providers/Microsoft.Authorization/policyDefinitions/06a78e20-9358-41c9-923c-fb736d382a4d"` | no |
| <a name="input_policy_name"></a> [policy\_name](#input\_policy\_name) | Name of the policy | `string` | `"Audit VMs without managed disks Assignment"` | no |
| <a name="input_principal_id"></a> [principal\_id](#input\_principal\_id) | principal id | `string` | n/a | yes |
| <a name="input_priority"></a> [priority](#input\_priority) | Specifies the priority of this Virtual Machine. Possible values are Regular and Spot. Defaults to Regular. | `string` | `"Regular"` | no |
| <a name="input_provision_vm_agent"></a> [provision\_vm\_agent](#input\_provision\_vm\_agent) | Should the Azure Virtual Machine Guest Agent be installed on this Virtual Machine? Defaults to false | `string` | n/a | yes |
| <a name="input_proximity_placement_group_id"></a> [proximity\_placement\_group\_id](#input\_proximity\_placement\_group\_id) | proximity\_placement\_group\_id | `string` | `null` | no |
| <a name="input_publisher"></a> [publisher](#input\_publisher) | Specifies the publisher of the image used to create the virtual machine. | `string` | n/a | yes |
| <a name="input_recovery_service_vault_name"></a> [recovery\_service\_vault\_name](#input\_recovery\_service\_vault\_name) | Specifies the name of the Recovery Services Vault. | `string` | n/a | yes |
| <a name="input_resource_group_id"></a> [resource\_group\_id](#input\_resource\_group\_id) | Reading Resource group ID from other module | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Resource group name | `string` | n/a | yes |
| <a name="input_retention_daily_count"></a> [retention\_daily\_count](#input\_retention\_daily\_count) | The number of daily backups to keep. Must be between 7 and 9999. | `number` | n/a | yes |
| <a name="input_secret_certificate_store"></a> [secret\_certificate\_store](#input\_secret\_certificate\_store) | The certificate store on the Virtual Machine where the certificate should be added. | `string` | `null` | no |
| <a name="input_secret_certificate_url"></a> [secret\_certificate\_url](#input\_secret\_certificate\_url) | The Secret URL of a Key Vault Certificate. | `string` | `null` | no |
| <a name="input_security_center_subscription_pricing_resource_type"></a> [security\_center\_subscription\_pricing\_resource\_type](#input\_security\_center\_subscription\_pricing\_resource\_type) | The resource type this setting affects. | `string` | n/a | yes |
| <a name="input_security_center_subscription_pricing_tier"></a> [security\_center\_subscription\_pricing\_tier](#input\_security\_center\_subscription\_pricing\_tier) | The pricing tier to use. Possible values are Free and Standard. | `string` | n/a | yes |
| <a name="input_security_encryption_type"></a> [security\_encryption\_type](#input\_security\_encryption\_type) | Encryption Type when the Virtual Machine is a Confidential VM. Possible values are VMGuestStateOnly and DiskWithVMGuestState. Changing this forces a new resource to be created. | `string` | `"VMGuestStateOnly"` | no |
| <a name="input_sku"></a> [sku](#input\_sku) | Specifies the SKU of the image used to create the virtual machine. | `string` | n/a | yes |
| <a name="input_source_image_id"></a> [source\_image\_id](#input\_source\_image\_id) | The ID of an Image which each Virtual Machine should be based on | `string` | `null` | no |
| <a name="input_storage_account_name"></a> [storage\_account\_name](#input\_storage\_account\_name) | Storage account name | `string` | `null` | no |
| <a name="input_storage_account_primary_connection_string"></a> [storage\_account\_primary\_connection\_string](#input\_storage\_account\_primary\_connection\_string) | storage account primary connection string | `string` | n/a | yes |
| <a name="input_storage_account_type"></a> [storage\_account\_type](#input\_storage\_account\_type) | Storage account type of OS disk | `string` | n/a | yes |
| <a name="input_storage_account_uri"></a> [storage\_account\_uri](#input\_storage\_account\_uri) | The Primary/Secondary Endpoint for the Azure Storage Account which should be used to store Boot Diagnostics, including Console Output and Screenshots from the Hypervisor. Passing a `null` value will utilize a Managed Storage Account to store Boot Diagnostics. | `string` | `null` | no |
| <a name="input_storage_os_disk"></a> [storage\_os\_disk](#input\_storage\_os\_disk) | Name of os disk | `string` | `"mystoragedisk"` | no |
| <a name="input_str_primary_blob_endpoint"></a> [str\_primary\_blob\_endpoint](#input\_str\_primary\_blob\_endpoint) | str\_primary\_blob\_endpoint | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags | `map(any)` | n/a | yes |
| <a name="input_termination_notification_timeout"></a> [termination\_notification\_timeout](#input\_termination\_notification\_timeout) | Length of time (in minutes, between 5 and 15) a notification to be sent to the VM on the instance metadata server till the VM gets deleted. The time duration should be specified in ISO 8601 format. | `string` | `"6"` | no |
| <a name="input_timezone"></a> [timezone](#input\_timezone) | The time zone ID | `string` | n/a | yes |
| <a name="input_user_data"></a> [user\_data](#input\_user\_data) | The Base64-Encoded User Data which should be used for this Virtual Machine. | `string` | `null` | no |
| <a name="input_virtual_machine_name"></a> [virtual\_machine\_name](#input\_virtual\_machine\_name) | Name of the virtual machine | `string` | n/a | yes |
| <a name="input_virtual_machine_scale_set_id"></a> [virtual\_machine\_scale\_set\_id](#input\_virtual\_machine\_scale\_set\_id) | Specifies the Orchestrated Virtual Machine Scale Set that this Virtual Machine should be created within. | `string` | `null` | no |
| <a name="input_vm_availability_zone"></a> [vm\_availability\_zone](#input\_vm\_availability\_zone) | The Zone in which this Virtual Machine should be created. Conflicts with availability set and shouldn't use both | `string` | `null` | no |
| <a name="input_vm_dependency_agent_name"></a> [vm\_dependency\_agent\_name](#input\_vm\_dependency\_agent\_name) | The name of the virtual machine extension peering. | `string` | n/a | yes |
| <a name="input_vm_dependency_agent_publisher"></a> [vm\_dependency\_agent\_publisher](#input\_vm\_dependency\_agent\_publisher) | The publisher of the extension, available publishers can be found by using the Azure CLI. | `string` | n/a | yes |
| <a name="input_vm_dependency_agent_type"></a> [vm\_dependency\_agent\_type](#input\_vm\_dependency\_agent\_type) | The type of extension, available types for a publisher can be found using the Azure CLI. | `string` | n/a | yes |
| <a name="input_vm_dependency_agent_type_handler_version"></a> [vm\_dependency\_agent\_type\_handler\_version](#input\_vm\_dependency\_agent\_type\_handler\_version) | Specifies the version of the extension to use, available versions can be found using the Azure CLI. | `string` | n/a | yes |
| <a name="input_vm_dependency_auto_upgrade_minor_version"></a> [vm\_dependency\_auto\_upgrade\_minor\_version](#input\_vm\_dependency\_auto\_upgrade\_minor\_version) | Enable auto upgrade minor version or not | `string` | n/a | yes |
| <a name="input_vm_monitoring_agent_name"></a> [vm\_monitoring\_agent\_name](#input\_vm\_monitoring\_agent\_name) | The name of the virtual machine extension peering. | `string` | n/a | yes |
| <a name="input_vm_shutdown_schedule_enabled"></a> [vm\_shutdown\_schedule\_enabled](#input\_vm\_shutdown\_schedule\_enabled) | Whether to enable the schedule. | `string` | n/a | yes |
| <a name="input_vm_size"></a> [vm\_size](#input\_vm\_size) | Specifies the size of the Virtual Machine. | `string` | n/a | yes |
| <a name="input_webhook_url"></a> [webhook\_url](#input\_webhook\_url) | The webhook URL to which the notification will be sent. Required if enabled is true. Optional otherwise. | `string` | n/a | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_vm_id"></a> [vm\_id](#output\_vm\_id) | ID of the Linux VM |

## Module Usage
```
data "azurerm_client_config" "current" {}

#Reference to LINUX VIRTUAL MACHINE module
module "linux_virtual_machine" {
  source                           = "../../modules/module_linux-vm"
  resource_group_name              = var.resource_group_name
  location                         = var.location
  resource_group_id                = var.resource_group_id
  generate_admin_ssh_key           = var.generate_admin_ssh_key
  virtual_machine_name             = var.virtual_machine_name
  vm_size                          = var.vm_size
  admin_username                   = var.admin_username
  admin_password                   = var.admin_password
  allow_extension_operations       = var.allow_extension_operations
  availability_set_id              = var.availability_set_id
  provision_vm_agent               = var.provision_vm_agent
  network_interface_ids            = var.network_interface_ids
  license_type                     = var.license_type
  capacity_reservation_group_id    = var.capacity_reservation_group_id
  computer_name                    = var.computer_name
  custom_data                      = var.custom_data
  dedicated_host_id                = var.dedicated_host_id
  dedicated_host_group_id          = var.dedicated_host_group_id
  disable_password_authentication  = var.disable_password_authentication
  edge_zone                        = var.edge_zone
  encryption_at_host_enabled       = var.encryption_at_host_enabled
  eviction_policy                  = var.eviction_policy
  extensions_time_budget           = var.extensions_time_budget
  patch_mode                       = var.patch_mode
  max_bid_price                    = var.max_bid_price
  platform_fault_domain            = var.platform_fault_domain
  priority                         = var.priority
  proximity_placement_group_id     = var.proximity_placement_group_id
  //secure_boot_enabled              = var.secure_boot_enabled
  source_image_id                  = var.source_image_id
  user_data                        = var.user_data
  //vtpm_enabled                     = var.vtpm_enabled
  virtual_machine_scale_set_id     = var.virtual_machine_scale_set_id
  vm_availability_zone             = var.vm_availability_zone
  enable_ultra_ssd                 = var.enable_ultra_ssd
  admin_ssh_key_public_key         = var.admin_ssh_key_public_key
  admin_ssh_key_username           = var.admin_ssh_key_username
  enable_boot_diagnostics          = var.enable_boot_diagnostics
  storage_account_name             = var.storage_account_name
  str_primary_blob_endpoint        = var.str_primary_blob_endpoint
  storage_account_uri              = var.storage_account_uri
  enable_secret_vm                 = var.enable_secret_vm
  secret_certificate_store         = var.secret_certificate_store
  secret_certificate_url           = var.secret_certificate_url
  key_vault_id                     = var.key_vault_id
  storage_os_disk                  = var.storage_os_disk
  caching                          = var.caching
  storage_account_type             = var.storage_account_type
  disk_size_gb                     = var.disk_size_gb
  enable_os_disk_write_accelerator = var.enable_os_disk_write_accelerator
  security_encryption_type         = var.security_encryption_type
  enable_diff_disk_settings        = var.enable_diff_disk_settings
  diff_disk_settings_option        = var.diff_disk_settings_option
  diff_disk_settings_placement     = var.diff_disk_settings_placement
  publisher                        = var.publisher
  offer                            = var.offer
  sku                              = var.sku
  latest_version                   = var.latest_version
  plan_name                        = var.plan_name
  plan_product                     = var.plan_product
  plan_publisher                   = var.plan_publisher
  enable_termination_notification  = var.enable_termination_notification
  termination_notification_timeout = var.termination_notification_timeout
  managed_identity_type            = var.managed_identity_type
  managed_identity_ids             = var.managed_identity_ids
  tags                             = var.tags

  no_of_managed_disks            = var.no_of_managed_disks
  managed_disk_name              = var.managed_disk_name
  data_disk_storage_account_type = var.data_disk_storage_account_type
  data_disk_create_option        = var.data_disk_create_option
  data_disk_disk_size_gb         = var.data_disk_disk_size_gb
  data_disk_attachment_caching   = var.data_disk_attachment_caching

  policy_name          = var.policy_name
  policy_definition_id = var.policy_definition_id

  vm_shutdown_schedule_enabled  = var.vm_shutdown_schedule_enabled
  daily_recurrence_time         = var.daily_recurrence_time
  timezone                      = var.timezone
  notification_settings_enabled = var.notification_settings_enabled
  email                         = var.email
  before_shutdown_time_in_minutes= var.before_shutdown_time_in_minutes
  webhook_url                    = var.webhook_url

  vm_monitoring_agent_name              = var.vm_monitoring_agent_name
  monitoring_publisher                  = var.monitoring_publisher
  monitoring_type                       = var.monitoring_type
  monitoring_type_handler_version       = var.monitoring_type_handler_version
  monitoring_auto_upgrade_minor_version = var.monitoring_auto_upgrade_minor_version
  log_analytics_workspace_id            = var.log_analytics_workspace_id
  log_primary_shared_key                = var.log_primary_shared_key

  vm_dependency_agent_name                 = var.vm_dependency_agent_name
  vm_dependency_agent_publisher            = var.vm_dependency_agent_publisher
  vm_dependency_agent_type                 = var.vm_dependency_agent_type
  vm_dependency_agent_type_handler_version = var.vm_dependency_agent_type_handler_version
  vm_dependency_auto_upgrade_minor_version = var.vm_dependency_auto_upgrade_minor_version

  storage_account_primary_connection_string = var.storage_account_primary_connection_string
  ex_diag                                   = var.ex_diag
  diag_publisher                            = var.diag_publisher
  diag_type                                 = var.diag_type
  diag_type_handler_version                 = var.diag_type_handler_version

  security_center_subscription_pricing_tier          = var.security_center_subscription_pricing_tier
  security_center_subscription_pricing_resource_type = var.security_center_subscription_pricing_resource_type

  backup_policy_vm_name       = var.backup_policy_vm_name
  recovery_service_vault_name = var.recovery_service_vault_name
  backup_frequency            = var.backup_frequency
  backup_time                 = var.backup_time
  retention_daily_count       = var.retention_daily_count

  enable_disk_encryption        = var.enable_disk_encryption
  keyvault_key_name             = var.keyvault_key_name
  keyvault_id                   = var.keyvault_id
  principal_id                  = data.azurerm_client_config.current.object_id
  disk_encryption_name          = var.disk_encryption_name
  disk_encryption_identity_type = var.disk_encryption_identity_type

}

#Reference to ALERTS module
module "alert" {
  source = "../../modules/module_alert"
  action_group_name        = var.action_group_name
  resource_group_name      = var.resource_group_name
  resource_group_location  = var.location
  short_name               = var.short_name
  action_group_rule_name   = var.action_group_rule_name
  scope_type               = var.scope_type
  resource_id              = module.linux_virtual_machine.vm_id
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
```

## Virtual Machine Extensions

* <u>Monitoring Agent : </u>
   - Collects events and performance data from the virtual machine and delivers it to the Log Analytics workspace.


* <u>Dependency Agent for Windows : </u>
   - Collects discovered data about processes running on the virtual machine and external process dependencies, which are used by the Map feature in VM insights. The Dependency agent relies on the Log Analytics agent to deliver its data to Azure Monitor.


* <u>Diagnostics Setting : </u>
   -  The Azure Diagnostics Extension helps you configure the VM to collect diagnostics data that can be used to monitor the health of your application.


## Azure Virtual Machine
* Please refer this link to understand more about Azure Linux VM: [Linux_Virtual_Machine](https://docs.microsoft.com/en-us/azure/virtual-machines/linux/quick-create-portal)

## Azure Virtual Machine Backup
* Please refer this link to understand more about Azure VM Backup in Recovery Services Vault: [Azure_VM_Backup](https://docs.microsoft.com/en-us/azure/backup/backup-azure-arm-vms-prepare)

## Disk Encryption- SSE with CMK
* Please refer this link to understand more about Azure VM Disk Encryption: [Disk_Encryption(SSEwithCMK)](https://docs.microsoft.com/en-us/azure/virtual-machines/disks-enable-customer-managed-keys-portal)

## Linux Virtual Machine
* Please refer this link to understand more about Linux VM configurations through terraform: [Linux_VM_Terraform_Registry](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine)
<!-- END_TF_DOCS -->