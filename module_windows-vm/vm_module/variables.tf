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
  description = "Reading Resource group ID from other module "
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
  default     = "Windows_Server"
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
  type        = string
  description = "The ID of an Image which each Virtual Machine should be based on"
  default     = null
}

variable "provision_vm_agent" {
  type        = bool
  description = " Should the Azure VM Agent be provisioned on this Virtual Machine?"
  default     = false
}

variable "allow_extension_operations" {
  type        = bool
  description = "Should Extension Operations be allowed on this Virtual Machine?"
  default     = false
}

variable "dedicated_host_id" {
  type        = string
  description = "The ID of a Dedicated Host where this machine should be run on."
  default     = null
}

variable "custom_data" {
  type        = string
  description = "Base64 encoded file of a bash script that gets run once by cloud-init upon VM creation"
  default     = null
}

variable "enable_automatic_updates" {
  type        = bool
  description = "Specifies if Automatic Updates are Enabled for the Windows Virtual Machine."
  default     = false
}

variable "enable_encryption_at_host" {
  type        = bool
  description = " Should all of the disks (including the temp disk) attached to this Virtual Machine be encrypted by enabling Encryption at Host?"
  default     = false
}

variable "proximity_placement_group_id" {
  type        = string
  description = "proximity_placement_group_id"
  default     = null
}

variable "patch_mode" {
  type        = string
  description = "Specifies the mode of in-guest patching to this Windows Virtual Machine. Possible values are `Manual`, `AutomaticByOS` and `AutomaticByPlatform`"
  default     = "AutomaticByOS"
}

variable "vm_availability_zone" {
  type        = string
  description = "The Zone in which this Virtual Machine should be created. Conflicts with availability set and shouldn't use both"
  default     = null
}

variable "vm_time_zone" {
  type        = string
  description = "Specifies the Time Zone which should be used by the Virtual Machine"
  default     = null
}

variable "capacity_reservation_group_id" {
  type        = string
  description = "Specifies the ID of the Capacity Reservation Group which the Virtual Machine should be allocated to. "
  default     = null
}

variable "computer_name" {
  type        = string
  description = "Specifies the Hostname which should be used for this Virtual Machine. If unspecified this defaults to the value for the name field. If the value of the name field is not a valid computer_name, then you must specify computer_name.  "
  default     = null
}

variable "dedicated_host_group_id" {
  type        = string
  description = " The ID of a Dedicated Host Group that this Windows Virtual Machine should be run within. Conflicts with dedicated_host_id. "
  default     = null
}

variable "edge_zone" {
  type        = string
  description = "Specifies the Edge Zone within the Azure Region where this Windows Virtual Machine should exist.  "
  default     = null
}

variable "eviction_policy" {
  type        = string
  description = "Specifies what should happen when the Virtual Machine is evicted for price reasons when using a Spot instance. At this time the only supported value is Deallocate.  "
  default     = "Deallocate"
}

variable "extensions_time_budget" {
  type        = string
  description = " Specifies the duration allocated for all extensions to start. The time duration should be between 15 minutes and 120 minutes (inclusive) and should be specified in ISO 8601 format. Defaults to 90 minutes (PT1H30M)."
  default     = "PT1H30M"
}

variable "hotpatching_enabled" {
  type        = bool
  description = "Should the VM be patched without requiring a reboot? Possible values are true or false. Defaults to false. "
  default     = false
}

variable "max_bid_price" {
  type        = number
  description = "The maximum price you're willing to pay for this Virtual Machine, in US Dollars; which must be greater than the current spot price. If this bid price falls below the current spot price the Virtual Machine will be evicted using the eviction_policy. Defaults to -1, which means that the Virtual Machine should not be evicted for price reasons. "
  default     = -1
}

variable "priority" {
  type        = string
  description = "Specifies the priority of this Virtual Machine. Possible values are Regular and Spot. Defaults to Regular.  "
  default     = "Regular"
}

variable "secure_boot_enabled" {
  type        = string
  description = " Specifies if Secure Boot and Trusted Launch is enabled for the Virtual Machine.  "
  default     = null
}

variable "user_data" {
  type        = string
  description = "The Base64-Encoded User Data which should be used for this Virtual Machine. "
  default     = null
}

variable "virtual_machine_scale_set_id" {
  type        = string
  description = "Specifies the Orchestrated Virtual Machine Scale Set that this Virtual Machine should be created within. "
  default     = null
}

variable "vtpm_enabled" {
  type        = string
  description = "Specifies if vTPM (virtual Trusted Platform Module) and Trusted Launch is enabled for the Virtual Machine.  "
  default     = null
}

variable "platform_fault_domain" {
  type        = string
  description = "Specifies the Platform Fault Domain in which this Windows Virtual Machine should be created. Defaults to -1, which means this will be automatically assigned to a fault domain that best maintains balance across the available fault domains. Changing this forces a new Windows Virtual Machine to be created."
  default     = null//"-1"
}

variable "publisher" {
  type        = string
  description = "Specifies the publisher of the image used to create the virtual machine."
  default     = "MicrosoftSQLServer"
}

variable "offer" {
  type        = string
  description = "Specifies the offer of the image used to create the virtual machine"
  default     = "SQL2016SP2-WS2016"
}

variable "vm_sku" {
  type        = string
  description = "Specifies the SKU of the image used to create the virtual machine."
  default     = "SQLDEV"
}

variable "latest_version" {
  type        = string
  description = "Specifies the version of the image used to create the virtual machine."
  default     = "latest"
}

variable "storage_os_disk" {
  type        = string
  description = "Name of os disk"
  default     = "mystoragedisk1"
}

variable "caching" {
  type        = string
  description = "Specifies the caching requirements for the OS Disk. Possible values include None, ReadOnly and ReadWrite."
  default     = "ReadWrite"
}

variable "storage_account_type" {
  type        = string
  description = "Storage account type of the VM."
  default     = "Standard_LRS"
}

variable "disk_size_gb" {
  type        = string
  description = "The Size of the Internal OS Disk in GB, if you wish to vary from the size used in the image this Virtual Machine is sourced from."
  default     = null
}

variable "enable_os_disk_write_accelerator" {
  type        = bool
  description = "Should Write Accelerator be Enabled for this OS Disk? This requires that the `storage_account_type` is set to `Premium_LRS` and that `caching` is set to `None`."
  default     = false
}

variable "security_encryption_type" {
  type        = string
  description = "Encryption Type when the Virtual Machine is a Confidential VM. Possible values are VMGuestStateOnly and DiskWithVMGuestState. Changing this forces a new resource to be created."
  default     = "VMGuestStateOnly" #null
}

variable "enable_diff_disk_settings" {
  type        = bool
  description = "Should diff disk settings be Enabled for this OS Disk? "
  default     = false
}

variable "diff_disk_settings_option" {
  type        = string
  description = "Specifies the Ephemeral Disk Settings for the OS Disk. At this time the only possible value is Local. Changing this forces a new resource to be created."
  default     = null
}

variable "diff_disk_settings_placement" {
  type        = string
  description = "Specifies where to store the Ephemeral Disk. Possible values are CacheDisk and ResourceDisk. Defaults to CacheDisk. Changing this forces a new resource to be created."
  default     = null
}

variable "plan_vm" {
  type        = string
  description = "Specifies the Name of the Marketplace Image this Virtual Machine should be created from. Changing this forces a new resource to be created."
  default     = null
}

variable "product_vm" {
  type        = string
  description = "Specifies the Product of the Marketplace Image this Virtual Machine should be created from. Changing this forces a new resource to be created."
  default     = null
}

variable "publisher_vm" {
  type        = string
  description = "Specifies the Publisher of the Marketplace Image this Virtual Machine should be created from. Changing this forces a new resource to be created."
  default     = null
}

variable "enable_secret_vm" {
  type        = string
  description = "Enable secrets block in azure vm"
  default     = false
}

variable "secret_certificate_store" {
  type        = string
  description = "The certificate store on the Virtual Machine where the certificate should be added."
  default     = null
}

variable "secret_certificate_url" {
  type        = string
  description = "The Secret URL of a Key Vault Certificate."
  default     = null
}

variable "key_vault_id" {
  type        = string
  description = "keyvault ID"
}

variable "enable_termination_notification" {
  type        = bool
  description = "Should the termination notification be enabled on this Virtual Machine? Defaults to false"
  default     = false
}

variable "termination_notification_timeout" {
  type        = string
  description = " Length of time (in minutes, between 5 and 15) a notification to be sent to the VM on the instance metadata server till the VM gets deleted. The time duration should be specified in ISO 8601 format."
  default     = "6"
}

variable "enable_ultra_ssd" {
  type        = bool
  description = "Should the capacity to enable Data Disks of the UltraSSD_LRS storage account type be supported on this Virtual Machine"
  default     = false
}

variable "winrm_protocol" {
  type        = string
  description = "Specifies the protocol of winrm listener. Possible values are `Http` or `Https`"
  default     = null
}

variable "key_vault_certificate_secret_url" {
  type        = string
  description = "The Secret URL of a Key Vault Certificate, which must be specified when `protocol` is set to `Https`"
  default     = null
}

variable "additional_unattend_content" {
  type        = string
  description = "The XML formatted content that is added to the unattend.xml file for the specified path and component."
  default     = null
}

variable "additional_unattend_content_setting" {
  type        = string
  description = "The name of the setting to which the content applies. Possible values are `AutoLogon` and `FirstLogonCommands`"
  default     = null
}

variable "enable_boot_diagnostics" {
  type        = bool
  description = "Should the boot diagnostics enabled?"
  default     = false
}

variable "str_primary_blob_endpoint" {
  type        = string
  description = "str_primary_blob_endpoint"
  default     = null
}

variable "storage_account_uri" {
  type        = string
  description = "The Primary/Secondary Endpoint for the Azure Storage Account which should be used to store Boot Diagnostics, including Console Output and Screenshots from the Hypervisor. Passing a `null` value will utilize a Managed Storage Account to store Boot Diagnostics."
  default     = null
}

variable "managed_identity_type" {
  type        = string
  description = "The type of Managed Identity which should be assigned to the Virtual Machine. Possible values are `SystemAssigned`, `UserAssigned` and `SystemAssigned, UserAssigned`"
  default     = "SystemAssigned, UserAssigned"
}

variable "managed_identity_ids" {
  type        = list(string)
  description = "A list of User Managed Identity ID's which should be assigned to the Virtual Machine."
  default     = null
}

variable "tags" {
  type        = map(any)
  description = "Tags"
  default = {
      Contact_name     = "ABC"
      Cost_Center      = "999"
      Application_name = "WINDOWS_VM"
  }
}


//RESOURCE: DATA DISKS
variable "no_of_managed_disks" {
  type        = number
  description = "Number of required managed disks"
  default     = 2
}

variable "managed_disk_name" {
  type        = string
  description = "Name of the managed disk "
  default     = "mdisks"
}

variable "data_disk_storage_account_type" {
  type        = string
  description = "Storage account type of data disk "
  default     = "Standard_LRS"
}

variable "data_disk_create_option" {
  type        = string
  description = "Create option of data disk "
  default     = "Empty"
}

variable "data_disk_disk_size_gb" {
  type        = number
  description = "Disk size gb of data disk "
  default     = 10
}

variable "data_disk_attachment_caching" {
  type        = string
  description = "Data disk attachment caching"
  default     = "ReadWrite"
}


//RESOURCE: POLICY ASSIGNMENT
variable "policy_name" {
  type        = string
  description = "Name of the policy "
  default     = "Audit VMs without managed disks Assignment"
}

variable "policy_definition_id" {
  type        = string
  description = "Policy definition ID "
  default     = "/providers/Microsoft.Authorization/policyDefinitions/06a78e20-9358-41c9-923c-fb736d382a4d"
}


//RESOURCE: GLOBAL VM SHUTDOWN SCHEDULE
variable "vm_shutdown_schedule_enabled" {
  type        = bool
  description = "Whether to enable the schedule."
  default     = true
}

variable "daily_recurrence_time" {
  type        = string
  description = "The time each day when the schedule takes effect. "
  default     = "2200"
}

variable "timezone" {
  type        = string
  description = " The time zone ID"
  default     = "AUS Eastern Standard Time"
}

variable "notification_settings_enabled" {
  type        = bool
  description = "Whether to enable pre-shutdown notifications. Possible values are true and false. Defaults to false"
  default     = false
}


//RESOURCE: VIRTUAL MACHINE EXTENSION(MONITORING AGENT)
variable "log_analytics_workspace_id" {
  type        = string
  description = "Log analytics workspace ID"
  default     = null
}

variable "log_primary_shared_key" {
  type        = string
  description = "Log analytics primary shared key"
  default     = null
}

variable "vm_monitoring_agent_name" {
  type        = string
  description = "The name of the virtual machine extension peering."
  default     = "OMSextension"
}

variable "monitoring_publisher" {
  type        = string
  description = "The publisher of the extension, available publishers can be found by using the Azure CLI."
  default     = "Microsoft.EnterpriseCloud.Monitoring"
}

variable "monitoring_type" {
  type        = string
  description = "The type of extension, available types for a publisher can be found using the Azure CLI."
  default     = "MicrosoftMonitoringAgent"
}

variable "monitoring_type_handler_version" {
  type        = string
  description = "Specifies the version of the extension to use, available versions can be found using the Azure CLI."
  default     = "1.0" 
}

variable "monitoring_auto_upgrade_minor_version" {
  type        = string
  description = "Specifies if the platform deploys the latest minor version update to the type_handler_version specified."
  default     = "true"
}


//RESOURCE: VIRTUAL MACHINE EXTENSION(DEPENDENCY AGENT)
variable "vm_dependency_agent_name" {
  type        = string
  description = "The name of the virtual machine extension peering."
  default     = "dependagent"
}

variable "dependency_agent_publisher" {
  type        = string
  description = " The publisher of the extension, available publishers can be found by using the Azure CLI. "
  default     = "Microsoft.Azure.Monitoring.DependencyAgent"
}

variable "dependency_agent_type" {
  type        = string
  description = "The type of extension, available types for a publisher can be found using the Azure CLI."
  default     = "DependencyAgentWindows"
}

variable "dependency_agent_type_handler" {
  type        = string
  description = "Specifies the version of the extension to use, available versions can be found using the Azure CLI."
  default     = "9.5"
}

variable "dependency_agent_auto_upgrade" {
  type        = string
  description = "Specifies if the platform deploys the latest minor version update to the type_handler_version specified."
  default     = "false"
}


//RESOURCE: VIRTUAL MACHINE EXTENSION(INGUEST MONITORING)
variable "storage_account_name" {
  type        = string
  description = "Storage account name"
  default     = null
}

variable "storage_primary_access_key" {
  type        = string
  description = "Storage account primary access key"
  default     = null
}

variable "diag_name" {
  type        = string
  description = "The name of the virtual machine extension peering."
  default     = "WindowsDiagnostics"
}

variable "diag_publisher" {
  type        = string
  description = " The publisher of the extension, available publishers can be found by using the Azure CLI. "
  default     = "Microsoft.Azure.Diagnostics"
}

variable "diag_type" {
  type        = string
  description = "The type of extension, available types for a publisher can be found using the Azure CLI."
  default     = "IaaSDiagnostics"
}

variable "diag_type_handler_version" {
  type        = string
  description = "Specifies the version of the extension to use, available versions can be found using the Azure CLI."
  default     = "1.16"
}

variable "diag_auto_upgrade_minor_version" {
  type        = string
  description = "Specifies if the platform deploys the latest minor version update to the type_handler_version specified."
  default     = "true"
}


//RESOURCE: SECURITY CENTER
variable "log_analytics_id" {
  type        = string
  description = "log analytics workspace resource ID "
  default     = null
}

variable "security_center_workspace" {
  type        = bool
  description = " "
  default = false
}


//RESOURCE: BACKUP POLICY VM
variable "recovery_service_vault_name" {
  type        = string
  description = "Specifies the name of the Recovery Services Vault."
  default     = "recovery_service_vault_name"  
}

variable "backup_policy_vm_name" {
  type        = string
  description = "Specifies the name of the Backup Policy."
  default     = "backup"
}

variable "backup_frequency" {
  type        = string
  description = "Sets the backup frequency. Must be either Daily orWeekly."
  default     = "Daily"
}

variable "backup_time" {
  type        = string
  description = " The time of day to perform the backup in 24hour format."
  default     = "23:00"
}

variable "retention_daily_count" {
  type        = number
  description = " The number of daily backups to keep. Must be between 7 and 9999."
  default     = 10
}


#------------------------------------------RESOURCES: SSE WITH CMK--------------------------------------------#
variable "enable_disk_encryption" {
  type        = bool
  description = "enable_disk_encryption"
  default     = true
}

variable "keyvault_key_name" {
  type        = string
  description = "Specifies the name of the Key Vault Key."
  default     = "keyvault_key_name"
}

variable "keyvault_id" {
  type        = string
  description = "keyvault_id"
  default     = "keyvault_id"
}

variable "disk_encryption_name" {
  type        = string
  description = "The name of disk encryption. Changing this forces a new resource to be created."
  default     = "vm-des"
}

variable "disk_encryption_identity_type" {
  type        = string
  description = "Identity type of disk encryption"
  default     = "SystemAssigned"
}
