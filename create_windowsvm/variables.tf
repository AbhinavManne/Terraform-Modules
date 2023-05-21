variable "resource_group_name" {
  type        = string
  description = "Resource group name"
}

variable "location" {
  type        = string
  description = "The location/region to keep all your resources. To get the list of all locations with table format from azure cli, run 'az account list-locations -o table'"
}

variable "resource_group_id" {
  type        = string
  description = "Resource group ID "
}

variable "virtual_machine_name" {
  type        = string
  description = "Name of the virtual machine"
}

variable "network_interface_ids" {
  type        = string
  description = "Network interface IDs"
}

variable "vm_size" {
  type        = string
  description = "Specifies the size of the Virtual Machine."
}

variable "license_type" {
  type        = string
  description = "Specifies the BYOL Type for this Virtual Machine. This is only applicable to Windows Virtual Machines. Possible values are Windows_Client and Windows_Server."
}

variable "availability_set_id" {
  type        = string
  description = "ID of the availability set in azure"
}

variable "admin_username" {
  type        = string
  description = "Specifies the name of the local administrator account."
}

variable "admin_password" {
  type        = string
  description = "The password associated with the local administrator account."
}

variable "source_image_id" {
  description = "The ID of an Image which each Virtual Machine should be based on"
}

variable "provision_vm_agent" {
  type        = bool
  description = " Should the Azure VM Agent be provisioned on this Virtual Machine?"
}

variable "allow_extension_operations" {
  type        = bool
  description = "Should Extension Operations be allowed on this Virtual Machine?"
}

variable "dedicated_host_id" {
  type        = string
  description = "The ID of a Dedicated Host where this machine should be run on."
}

variable "custom_data" {
  type        = string
  description = "Base64 encoded file of a bash script that gets run once by cloud-init upon VM creation"
}

variable "enable_automatic_updates" {
  type        = bool
  description = "Specifies if Automatic Updates are Enabled for the Windows Virtual Machine."
}

variable "enable_encryption_at_host" {
  type        = bool
  description = " Should all of the disks (including the temp disk) attached to this Virtual Machine be encrypted by enabling Encryption at Host?"
}

variable "proximity_placement_group_id" {
  type        = string
  description = "ID of proximity placement group"
}

variable "patch_mode" {
  type        = string
  description = "Specifies the mode of in-guest patching to this Windows Virtual Machine. Possible values are `Manual`, `AutomaticByOS` and `AutomaticByPlatform`"
}

variable "vm_availability_zone" {
  type        = string
  description = "The Zone in which this Virtual Machine should be created. Conflicts with availability set and shouldn't use both"
}

variable "vm_time_zone" {
  type        = string
  description = "Specifies the Time Zone which should be used by the Virtual Machine"
}

variable "capacity_reservation_group_id" {
  type        = string
  description = "Specifies the ID of the Capacity Reservation Group which the Virtual Machine should be allocated to. "
}

variable "computer_name" {
  type        = string
  description = "Specifies the Hostname which should be used for this Virtual Machine. If unspecified this defaults to the value for the name field. If the value of the name field is not a valid computer_name, then you must specify computer_name.  "
}

variable "dedicated_host_group_id" {
  type        = string
  description = " The ID of a Dedicated Host Group that this Windows Virtual Machine should be run within. Conflicts with dedicated_host_id. "
}

variable "edge_zone" {
  type        = string
  description = "Specifies the Edge Zone within the Azure Region where this Windows Virtual Machine should exist.  "
}

variable "eviction_policy" {
  type        = string
  description = "Specifies what should happen when the Virtual Machine is evicted for price reasons when using a Spot instance. At this time the only supported value is Deallocate.  "
}

variable "extensions_time_budget" {
  type        = string
  description = " Specifies the duration allocated for all extensions to start. The time duration should be between 15 minutes and 120 minutes (inclusive) and should be specified in ISO 8601 format. Defaults to 90 minutes (PT1H30M)."
}

variable "hotpatching_enabled" {
  type        = bool
  description = "Should the VM be patched without requiring a reboot? Possible values are true or false. Defaults to false. "
}

variable "max_bid_price" {
  type        = number
  description = "The maximum price you're willing to pay for this Virtual Machine, in US Dollars; which must be greater than the current spot price. If this bid price falls below the current spot price the Virtual Machine will be evicted using the eviction_policy. Defaults to -1, which means that the Virtual Machine should not be evicted for price reasons. "
}

variable "priority" {
  type        = string
  description = "Specifies the priority of this Virtual Machine. Possible values are Regular and Spot. Defaults to Regular.  "
}

variable "secure_boot_enabled" {
  type        = string
  description = " Specifies if Secure Boot and Trusted Launch is enabled for the Virtual Machine.  "
}

variable "user_data" {
  type        = string
  description = "The Base64-Encoded User Data which should be used for this Virtual Machine. "
}

variable "virtual_machine_scale_set_id" {
  type        = string
  description = "Specifies the Orchestrated Virtual Machine Scale Set that this Virtual Machine should be created within. "
}

variable "vtpm_enabled" {
  type        = string
  description = "Specifies if vTPM (virtual Trusted Platform Module) and Trusted Launch is enabled for the Virtual Machine.  "
}

variable "platform_fault_domain" {
  type        = string
  description = " Specifies the Platform Fault Domain in which this Windows Virtual Machine should be created. Defaults to -1, which means this will be automatically assigned to a fault domain that best maintains balance across the available fault domains. Changing this forces a new Windows Virtual Machine to be created."
}

variable "publisher" {
  type        = string
  description = "Specifies the publisher of the image used to create the virtual machine."
}

variable "offer" {
  type        = string
  description = "Specifies the offer of the image used to create the virtual machine"
}

variable "vm_sku" {
  type        = string
  description = "Specifies the SKU of the image used to create the virtual machine."
}

variable "latest_version" {
  type        = string
  description = "Specifies the version of the image used to create the virtual machine."
}

variable "storage_os_disk" {
  type        = string
  description = "Name of os disk"
}

variable "caching" {
  type        = string
  description = "Specifies the caching requirements for the OS Disk. Possible values include None, ReadOnly and ReadWrite."
}

variable "storage_account_type" {
  type        = string
  description = "Storage account type of the VM."
}

variable "disk_size_gb" {
  type        = string
  description = "The Size of the Internal OS Disk in GB, if you wish to vary from the size used in the image this Virtual Machine is sourced from."
}

variable "enable_os_disk_write_accelerator" {
  type        = bool
  description = "Should Write Accelerator be Enabled for this OS Disk? This requires that the `storage_account_type` is set to `Premium_LRS` and that `caching` is set to `None`."
}

variable "security_encryption_type" {
  type        = string
  description = "Encryption Type when the Virtual Machine is a Confidential VM. Possible values are VMGuestStateOnly and DiskWithVMGuestState. Changing this forces a new resource to be created."
}

variable "enable_diff_disk_settings" {
  type        = bool
  description = "Should diff disk settings be Enabled for this OS Disk? "
}

variable "diff_disk_settings_option" {
  type        = string
  description = "Specifies the Ephemeral Disk Settings for the OS Disk. At this time the only possible value is Local. Changing this forces a new resource to be created."
}

variable "diff_disk_settings_placement" {
  type        = string
  description = "Specifies where to store the Ephemeral Disk. Possible values are CacheDisk and ResourceDisk. Defaults to CacheDisk. Changing this forces a new resource to be created."
}

variable "plan_vm" {
  type        = string
  description = "Specifies the Name of the Marketplace Image this Virtual Machine should be created from. Changing this forces a new resource to be created."
}

variable "product_vm" {
  type        = string
  description = "Specifies the Product of the Marketplace Image this Virtual Machine should be created from. Changing this forces a new resource to be created."
}

variable "publisher_vm" {
  type        = string
  description = "Specifies the Publisher of the Marketplace Image this Virtual Machine should be created from. Changing this forces a new resource to be created."
}

variable "enable_secret_vm" {
  type        = string
  description = "Enable secrets block in azure vm"
}

variable "secret_certificate_store" {
  type        = string
  description = "The certificate store on the Virtual Machine where the certificate should be added."
}

variable "secret_certificate_url" {
  type        = string
  description = "The Secret URL of a Key Vault Certificate."
}

variable "key_vault_id" {
  type        = string
  description = "keyvault ID"
}

variable "enable_termination_notification" {
  type        = bool
  description = "Should the termination notification be enabled on this Virtual Machine? Defaults to false"
}

variable "termination_notification_timeout" {
  type        = string
  description = " Length of time (in minutes, between 5 and 15) a notification to be sent to the VM on the instance metadata server till the VM gets deleted. The time duration should be specified in ISO 8601 format."
}

variable "enable_ultra_ssd" {
  type        = bool
  description = "Should the capacity to enable Data Disks of the UltraSSD_LRS storage account type be supported on this Virtual Machine"
}

variable "winrm_protocol" {
  type        = string
  description = "Specifies the protocol of winrm listener. Possible values are `Http` or `Https`"
}

variable "key_vault_certificate_secret_url" {
  type        = string
  description = "The Secret URL of a Key Vault Certificate, which must be specified when `protocol` is set to `Https`"
}

variable "additional_unattend_content" {
  type        = string
  description = "The XML formatted content that is added to the unattend.xml file for the specified path and component."
}

variable "additional_unattend_content_setting" {
  type        = string
  description = "The name of the setting to which the content applies. Possible values are `AutoLogon` and `FirstLogonCommands`"
}

variable "enable_boot_diagnostics" {
  type        = bool
  description = "Should the boot diagnostics enabled?"
}

variable "str_primary_blob_endpoint" {
  type        = string
  description = "str_primary_blob_endpoint"
}

variable "storage_account_uri" {
  type        = string
  description = "The Primary/Secondary Endpoint for the Azure Storage Account which should be used to store Boot Diagnostics, including Console Output and Screenshots from the Hypervisor. Passing a `null` value will utilize a Managed Storage Account to store Boot Diagnostics."
}

variable "managed_identity_type" {
  type        = string
  description = "The type of Managed Identity which should be assigned to the Virtual Machine. Possible values are `SystemAssigned`, `UserAssigned` and `SystemAssigned, UserAssigned`"
}

variable "managed_identity_ids" {
  type        = list(string)
  description = "A list of User Managed Identity ID's which should be assigned to the Virtual Machine."
}

variable "tags" {
  type        = map(any)
  description = "Tags"
}


//RESOURCE: DATA DISKS
variable "no_of_managed_disks" {
  type        = number
  description = "Number of required managed disks"
}

variable "managed_disk_name" {
  type        = string
  description = "Name of the managed disk "
}

variable "data_disk_storage_account_type" {
  type        = string
  description = "Storage account type of data disk "
}

variable "data_disk_create_option" {
  type        = string
  description = "Create option of data disk "
}

variable "data_disk_disk_size_gb" {
  type        = number
  description = "Disk size gb of data disk "
}

variable "data_disk_attachment_caching" {
  type        = string
  description = "Data disk attachment caching"
}


//RESOURCE: POLICY ASSIGNMENT
variable "policy_name" {
  type        = string
  description = "Name of the policy "
}

variable "policy_definition_id" {
  type        = string
  description = "Policy definition ID "
}


//RESOURCE: GLOBAL VM SHUTDOWN SCHEDULE
variable "vm_shutdown_schedule_enabled" {
  type        = bool
  description = "Whether to enable the schedule."
}

variable "daily_recurrence_time" {
  type        = string
  description = "The time each day when the schedule takes effect. "
}

variable "timezone" {
  type        = string
  description = " The time zone ID"
}

variable "notification_settings_enabled" {
  type        = bool
  description = "Whether to enable pre-shutdown notifications. Possible values are true and false. Defaults to false"
}


//RESOURCE: VIRTUAL MACHINE EXTENSION(MONITORING AGENT)
variable "log_analytics_workspace_id" {
  type        = string
  description = "Specifies the ID of the Log Analytics Workspace."
}

variable "log_primary_shared_key" {
  type        = string
  description = "Specifies the log_primary_shared_key of the Log Analytics Workspace."
}

variable "vm_monitoring_agent_name" {
  type        = string
  description = "The name of the virtual machine extension peering."
}

variable "monitoring_publisher" {
  type        = string
  description = "The publisher of the extension, available publishers can be found by using the Azure CLI."
}

variable "monitoring_type" {
  type        = string
  description = "The type of extension, available types for a publisher can be found using the Azure CLI."
}

variable "monitoring_type_handler_version" {
  type        = string
  description = "Specifies the version of the extension to use, available versions can be found using the Azure CLI."
}

variable "monitoring_auto_upgrade_minor_version" {
  type        = string
  description = "Specifies if the platform deploys the latest minor version update to the type_handler_version specified."
}


//RESOURCE: VIRTUAL MACHINE EXTENSION(DEPENDENCY AGENT)
variable "vm_dependency_agent_name" {
  type        = string
  description = "The name of the virtual machine extension peering."
}

variable "dependency_agent_publisher" {
  type        = string
  description = " The publisher of the extension, available publishers can be found by using the Azure CLI. "
}

variable "dependency_agent_type" {
  type        = string
  description = "The type of extension, available types for a publisher can be found using the Azure CLI."
}

variable "dependency_agent_type_handler" {
  type        = string
  description = "Specifies the version of the extension to use, available versions can be found using the Azure CLI."
}

variable "dependency_agent_auto_upgrade" {
  type        = string
  description = "Specifies if the platform deploys the latest minor version update to the type_handler_version specified."
}


//RESOURCE: VIRTUAL MACHINE EXTENSION(INGUEST MONITORING)
variable "storage_account_name" {
  type        = string
  description = "Storage account name"
}

variable "storage_primary_access_key" {
  type        = string
  description = "Storage account primary access key"
}

variable "diag_name" {
  type        = string
  description = "The name of the virtual machine extension peering."
}

variable "diag_publisher" {
  type        = string
  description = " The publisher of the extension, available publishers can be found by using the Azure CLI. "
}

variable "diag_type" {
  type        = string
  description = "The type of extension, available types for a publisher can be found using the Azure CLI."
}

variable "diag_type_handler_version" {
  type        = string
  description = "Specifies the version of the extension to use, available versions can be found using the Azure CLI."
}

variable "diag_auto_upgrade_minor_version" {
  type        = string
  description = "Specifies if the platform deploys the latest minor version update to the type_handler_version specified."
}


//RESOURCE: SECURITY CENTER
variable "log_analytics_id" {
  type        = string
  description = "Specifies the ID of the Log Analytics Workspace."
}

variable "security_center_workspace" {
  type        = bool
  description = " "
}


//RESOURCE: BACKUP POLICY VM
variable "recovery_service_vault_name" {
  type        = string
  description = "Specifies the name of the Recovery Services Vault."
}

variable "backup_policy_vm_name" {
  type        = string
  description = "Specifies the name of the Backup Policy."
}

variable "backup_frequency" {
  type        = string
  description = "Sets the backup frequency. Must be either Daily orWeekly."
}

variable "backup_time" {
  type        = string
  description = " The time of day to perform the backup in 24hour format."
}

variable "retention_daily_count" {
  type        = number
  description = " The number of daily backups to keep. Must be between 7 and 9999."
}


//RESOURCES: SSE WITH CMK
variable "enable_disk_encryption" {
  type        = bool
  description = "enable_disk_encryption"
}

variable "keyvault_key_name" {
  type        = string
  description = "Specifies the name of the Key Vault Key."
}

variable "keyvault_id" {
  type        = string
  description = "keyvault_id"
}

variable "disk_encryption_name" {
  type        = string
  description = "The name of disk encryption. Changing this forces a new resource to be created."
}

variable "disk_encryption_identity_type" {
  type        = string
  description = "Identity type of disk encryption"
}


#--------------------------------MODULE: ALERTS -----------------------------------------------#
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
