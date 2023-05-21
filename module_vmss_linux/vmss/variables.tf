#------------------------------------------RESOURCE: SSH PRIVATE KEY TLS RESOURCE---------------------------------------------#
variable "enable_ssh_key_authentication" {
  type        = bool
  description = "User want to user ssh_key authentication method or not."
}
variable "generate_ssh_key" {
  type        = bool
  description = "User want to generate the ssh_key using the script."
}
variable "existed_public_key" {
  type        = string
  description = "User want to use existing ssh keys."
}

variable "ssh_key_algorithm" {
  type        = string
  description = "Specifies the name of the Key Vault Secret. Changing this forces a new resource to be created."
}

variable "ssh_key_rsa_bits" {
  type        = number
  description = "Specifies the value of the Key Vault Secret."
}

#---------------------------------------RESOURCE: KEY VAULT SECRET----------------------------------------------------------#

variable "key_vault_id" {
  type        = string
  description = "Specifies the ID of the Key Vault instance where the Secret resides."
}
variable "password_secret_name" {
  type        = string
  description = "Password secret name if the user want to use password authentication."
}

variable "private_key_secret_name" {
  type        = string
  description = "Specifies the name of the Key Vault Secret."
}

variable "secret_content_type" {
  type        = string
  description = "Specifies the content type for the Key Vault Secret."
}
variable "secret_not_before_date" {
  type        = string
  description = "Key not usable before the provided UTC datetime (Y-m-d'T'H:M:S'Z')."
}
variable "secret_expiration_date" {
  type        = string
  description = "Expiration UTC datetime (Y-m-d'T'H:M:S'Z')."
}


#---------------------------------------RESOURCE: VMSS----------------------------------------------------------#


variable "resource_group_name" {
  type        = string
  description = "The name of the Resource Group in which the Windows Virtual Machine Scale Set should be exist. Changing this forces a new resource to be created."
}

variable "location" {
  type        = string
  description = "The Azure location where the Windows Virtual Machine Scale Set should exist. Changing this forces a new resource to be created."
}

variable "linux_vmss" {
  type        = string
  description = "The name of the Windows Virtual Machine Scale Set. Changing this forces a new resource to be created."
}


variable "vmss_instances" {
  type        = number
  description = "The number of Virtual Machines in the Scale Set."
}

variable "vmss_sku" {
  type        = string
  description = "The Virtual Machine SKU for the Scale Set."
}

variable "admin_username" {
  type        = string
  description = "value"
}

variable "ssh_key_username" {
  type        = string
  description = "value"
}

variable "network_interface" {
  type        = string
  description = " The Name which should be used for this Network Interface. Changing this forces a new resource to be created."
}

variable "network_interface_primary" {
  type        = bool
  description = "Is this the Primary IP Configuration? true/false"
}

variable "nsg_id" {
  type        = string
  default     = null
  description = "The ID of a Network Security Group which should be assigned to this Network Interface."
}

variable "dns_server" {
  type        = list(string)
  default     = null
  description = "A list of IP Addresses of DNS Servers which should be assigned to the Network Interface."
}

variable "enable_accelerated_networking" {
  type        = bool
  default     = false
  description = "Does this Network Interface support Accelerated Networking? Defaults to false."
}

variable "enable_ip_forwarding" {
  type        = bool
  default     = false
  description = "Does this Network Interface support IP Forwarding? Defaults to false."
}

variable "lb_frontend_ip_config" {
  type        = string
  description = "The Name which should be used for this IP Configuration."
}

variable "ip_config_primary" {
  type        = bool
  default     = false
  description = "Is this the Primary IP Configuration for this Network Interface? Defaults to false."
}

variable "subnet_id" {
  type        = string
  default     = null
  description = "The ID of the Subnet which this IP Configuration should be connected to."
}

variable "load_balancer_backend_address_pool_ids" {
  type        = list(string)
  default     = null
  description = "A list of Backend Address Pools ID's from a Load Balancer which this Virtual Machine Scale Set should be connected to."
}

variable "application_gateway_backend_address_pool_ids" {
  type        = list(string)
  default     = null
  description = " A list of Backend Address Pools ID's from a Application Gateway which this Virtual Machine Scale Set should be connected to."
}

variable "application_security_group_ids" {
  type        = list(string)
  default     = null
  description = "A list of Application Security Group ID's which this Virtual Machine Scale Set should be connected to."
}

variable "load_balancer_inbound_nat_rules_ids" {
  type        = list(string)
  default     = null
  description = "A list of NAT Rule ID's from a Load Balancer which this Virtual Machine Scale Set should be connected to."
}

variable "enable_public_ip_address" {
  type        = bool
  default     = false
  description = "Wants to enable public ip address?"
}

variable "public_ip_address_name" {
  type        = string
  description = "The Name of the Public IP Address Configuration."
}

variable "domain_name_label" {
  type        = string
  default     = null
  description = "The Prefix which should be used for the Domain Name Label for each Virtual Machine Instance. Azure concatenates the Domain Name Label and Virtual Machine Index to create a unique Domain Name Label for each Virtual Machine."
}

variable "idle_timeout_in_minutes" {
  type        = string
  default     = null
  description = "The Idle Timeout in Minutes for the Public IP Address. Possible values are in the range 4 to 32."
}

variable "public_ip_prefix_id" {
  type        = string
  default     = null
  description = "The ID of the Public IP Address Prefix from where Public IP Addresses should be allocated. Changing this forces a new resource to be created."
}

variable "os_disk_caching" {
  type        = string
  description = "The Type of Caching which should be used for the Internal OS Disk. Possible values are None, ReadOnly and ReadWrite"
}
variable "os_disk_storage_account_type" {
  type        = string
  description = "The Type of Storage Account which should back this the Internal OS Disk. Possible values include Standard_LRS, StandardSSD_LRS and Premium_LRS."
}

variable "diff_disk_settings_option" {
  type        = string
  description = "Specifies the Ephemeral Disk Settings for the OS Disk. At this time the only possible value is Local. Changing this forces a new resource to be created."
}

variable "diff_disk_settings_placement" {
  type        = string
  default     = "CacheDisk"
  description = "Specifies where to store the Ephemeral Disk. Possible values are CacheDisk and ResourceDisk. Defaults to CacheDisk. Changing this forces a new resource to be created."
}

variable "os_disk_encryption_set_id" {
  type        = string
  default     = null
  description = "The ID of the Disk Encryption Set which should be used to encrypt this OS Disk. Conflicts with secure_vm_disk_encryption_set_id."
}

variable "disk_size_gb" {
  type        = string
  default     = null
  description = "The Size of the Internal OS Disk in GB, if you wish to vary from the size used in the image this Virtual Machine Scale Set is sourced from."
}

variable "security_encryption_type" {
  type        = string
  default     = null
  description = "Encryption Type when the Virtual Machine Scale Set is Confidential VMSS. Possible values are VMGuestStateOnly and DiskWithVMGuestState. Changing this forces a new resource to be created."
}

variable "secure_vm_disk_encryption_set_id" {
  type        = string
  default     = null
  description = "The ID of the Disk Encryption Set which should be used to Encrypt the OS Disk when the Virtual Machine Scale Set is Confidential VMSS. Conflicts with disk_encryption_set_id. Changing this forces a new resource to be created."
}

variable "write_accelerator_enabled" {
  type        = bool
  default     = false
  description = "Should Write Accelerator be Enabled for this OS Disk? Defaults to false."
}

variable "ultra_ssd_enabled" {
  type        = bool
  default     = false
  description = "Should the capacity to enable Data Disks of the UltraSSD_LRS storage account type be supported on this Virtual Machine Scale Set? Defaults to false. Changing this forces a new resource to be created."
}

variable "health_probe_id" {
  type        = string
  default     = null
  description = "The ID of a Load Balancer Probe which should be used to determine the health of an instance. This is Required and can only be specified when upgrade_mode is set to Automatic or Rolling."
}

variable "vmss_upgrade_mode" {
  type        = string
  default     = "Manual"
  description = " Specifies how Upgrades (e.g. changing the Image/SKU) should be performed to Virtual Machine Instances. Possible values are Automatic, Manual and Rolling"
}

variable "enable_automatic_os_upgrade_policy" {
  type        = bool
  default     = false
  description = "Wants to enable automatic OS Upgrade Policy"

}
variable "disable_automatic_rollback" {
  type        = bool
  description = "Should automatic rollbacks be disabled?"
}

variable "enable_automatic_os_upgrade" {
  type        = bool
  description = "Should OS Upgrades automatically be applied to Scale Set instances in a rolling fashion when a newer version of the OS Image becomes available?"
}

variable "enable_automatic_instance_repair" {
  type        = bool
  default     = false
  description = "Should the automatic instance repair be enabled on this Virtual Machine Scale Set?"
}

variable "grace_period_for_automatic_instance_repair" {
  type        = string
  default     = null
  description = "Amount of time (in minutes, between 30 and 90, defaults to 30 minutes) for which automatic repairs will be delayed. The grace period starts right after the VM is found unhealthy. The time duration should be specified in ISO 8601 format."
}

variable "storage_account_uri" {
  type        = string
  default     = null
  description = "The Primary/Secondary Endpoint for the Azure Storage Account which should be used to store Boot Diagnostics, including Console Output and Screenshots from the Hypervisor."
}

variable "capacity_reservation_group_id" {
  type        = string
  default     = null
  description = "Specifies the ID of the Capacity Reservation Group which the Virtual Machine Scale Set should be allocated to. Changing this forces a new resource to be created."
}

variable "prefix" {
  type        = string
  default     = null
  description = "The prefix which should be used for the name of the Virtual Machines in this Scale Set. If unspecified this defaults to the value for the name field. If the value of the name field is not a valid computer_name_prefix, then you must specify computer_name_prefix."
}

variable "custom_data" {
  type        = string
  default     = null
  description = "The Base64-Encoded Custom Data which should be used for this Virtual Machine Scale Set."
}

variable "add_data_disk" {
  type        = bool
  default     = false
  description = "Wants to add Data Disk?"
}

variable "data_disk_caching" {
  type        = string
  description = "The type of Caching which should be used for this Data Disk. Possible values are None, ReadOnly and ReadWrite."
}

variable "data_disk_create_option" {
  type        = string
  default     = "Empty"
  description = "The create option which should be used for this Data Disk. Possible values are Empty and FromImage. Defaults to Empty. (FromImage should only be used if the source image includes data disks)."
}

variable "data_disk_disk_size_gb" {
  description = "The size of the Data Disk which should be created."
  type        = number
}

variable "data_disk_lun" {
  description = "The Logical Unit Number of the Data Disk, which must be unique within the Virtual Machine."
  type        = number
}

variable "data_disk_storage_account_type" {
  type        = string
  description = "The Type of Storage Account which should back this Data Disk. Possible values include Standard_LRS, StandardSSD_LRS, Premium_LRS and UltraSSD_LRS."
}

variable "data_disk_encryption_set_id" {
  type        = string
  default     = null
  description = "The ID of the Disk Encryption Set which should be used to encrypt this Data Disk."
}

variable "data_disk_mbps_read_write" {
  type        = string
  default     = null
  description = "Specifies the Read-Write IOPS for this Data Disk. Only settable for UltraSSD disks."
}

variable "data_disk_iops_read_write" {
  type        = string
  default     = null
  description = "Specifies the Read-Write IOPS for this Data Disk. Only settable for UltraSSD disks."
}

variable "data_disk_write_accelerator_enabled" {
  type        = bool
  default     = false
  description = "Should Write Accelerator be enabled for this Data Disk? Defaults to false."
}

variable "do_not_run_extensions_on_overprovisioned_machines" {
  type        = bool
  default     = false
  description = "Should Virtual Machine Extensions be run on Overprovisioned Virtual Machines in the Scale Set? Defaults to false."
}

variable "edge_zone" {
  type        = string
  default     = null
  description = "Specifies the Edge Zone within the Azure Region where this Windows Virtual Machine Scale Set should exist. Changing this forces a new Windows Virtual Machine Scale Set to be created."
}

variable "encryption_at_host_enabled" {
  type        = bool
  default     = false
  description = "Should all of the disks (including the temp disk) attached to this Virtual Machine be encrypted by enabling Encryption at Host?"
}

variable "ext_value" {
  type = map(object({
    name                       = string
    publisher                  = string
    type                       = string
    type_handler_version       = string
    auto_upgrade_minor_version = bool
    automatic_upgrade_enabled  = bool
    force_update_tag           = string
    protected_settings         = string
    provision_after_extensions = list(string)
    settings                   = string
  }))
  default     = null
  description = "This is a Map of objects, where a object is defiend as a extension."
}

variable "extensions_time_budget" {
  type        = string
  default     = null
  description = "Specifies the duration allocated for all extensions to start. The time duration should be between 15 minutes and 120 minutes (inclusive) and should be specified in ISO 8601 format. Defaults to 90 minutes (PT1H30M)."
}

variable "eviction_policy" {
  type        = string
  default     = null
  description = "Specifies the eviction policy for Virtual Machines in this Scale Set. Possible values are Deallocate and Delete. Changing this forces a new resource to be created."
}

variable "managed_identity_type" {
  type        = string
  default     = null
  description = "Specifies the type of Managed Service Identity that should be configured on this Windows Virtual Machine Scale Set. Possible values are SystemAssigned, UserAssigned, SystemAssigned, UserAssigned (to enable both)."
}

variable "managed_identity_ids" {
  type        = list(string)
  default     = null
  description = "Specifies a list of User Assigned Managed Identity IDs to be assigned to this Windows Virtual Machine Scale Set."
}


variable "license_type" {
  type        = string
  default     = null
  description = "Specifies the type of on-premise license (also known as Azure Hybrid Use Benefit) which should be used for this Virtual Machine Scale Set. Possible values are None, Windows_Client and Windows_Server."
}

variable "max_bid_price" {
  type        = string
  default     = "-1"
  description = "The maximum price you're willing to pay for each Virtual Machine in this Scale Set, in US Dollars; which must be greater than the current spot price. If this bid price falls below the current spot price the Virtual Machines in the Scale Set will be evicted using the eviction_policy. Defaults to -1, which means that each Virtual Machine in the Scale Set should not be evicted for price reasons."
}

variable "overprovision" {
  type        = bool
  default     = true
  description = "Should Azure over-provision Virtual Machines in this Scale Set? This means that multiple Virtual Machines will be provisioned and Azure will keep the instances which become available first - which improves provisioning success rates and improves deployment time. You're not billed for these over-provisioned VM's and they don't count towards the Subscription Quota. Defaults to true."
}

variable "name_of_image" {
  type        = string
  description = "Specifies the name of the image from the marketplace. Changing this forces a new resource to be created."
}

variable "publisher_of_image" {
  type        = string
  description = "Specifies the publisher of the image. Changing this forces a new resource to be created."
}

variable "product_of_image" {
  type        = string
  description = "Specifies the product of the image from the marketplace. Changing this forces a new resource to be created."
}

variable "platform_fault_domain_count" {
  type        = string
  default     = null
  description = "Specifies the number of fault domains that are used by this Linux Virtual Machine Scale Set. Changing this forces a new resource to be created."
}

variable "priority" {
  type        = string
  default     = "Regular"
  description = "The Priority of this Virtual Machine Scale Set. Possible values are Regular and Spot. Defaults to Regular. Changing this value forces a new resource."
}

variable "provision_vm_agent" {
  type        = bool
  default     = true
  description = "Should the Azure VM Agent be provisioned on each Virtual Machine in the Scale Set? Defaults to true. Changing this value forces a new resource to be created."
}

variable "proximity_placement_group_id" {
  type        = string
  default     = null
  description = "The ID of the Proximity Placement Group in which the Virtual Machine Scale Set should be assigned to. Changing this forces a new resource to be created."
}

variable "enable_rolling_upgrade_policy" {
  type        = bool
  default     = false
  description = "Wants to enable rolling upgrade policy?"
}

variable "max_batch_instance_percent" {
  type        = string
  description = "The maximum percent of total virtual machine instances that will be upgraded simultaneously by the rolling upgrade in one batch. As this is a maximum, unhealthy instances in previous or future batches can cause the percentage of instances in a batch to decrease to ensure higher reliability."
}

variable "max_unhealthy_instance_percent" {
  type        = string
  description = "The maximum percentage of the total virtual machine instances in the scale set that can be simultaneously unhealthy, either as a result of being upgraded, or by being found in an unhealthy state by the virtual machine health checks before the rolling upgrade aborts. This constraint will be checked prior to starting any batch."
}

variable "max_unhealthy_upgraded_instance_percent" {
  type        = string
  description = "The maximum percentage of upgraded virtual machine instances that can be found to be in an unhealthy state. This check will happen after each batch is upgraded. If this percentage is ever exceeded, the rolling update aborts."
}

variable "pause_time_between_batches" {
  type        = string
  description = "The wait time between completing the update for all virtual machines in one batch and starting the next batch. The time duration should be specified in ISO 8601 format."
}

variable "scale_in_policy" {
  type        = string
  default     = "Default"
  description = "The scale-in policy rule that decides which virtual machines are chosen for removal when a Virtual Machine Scale Set is scaled in. Possible values for the scale-in policy rules are Default, NewestVM and OldestVM, defaults to Default. For more information about scale in policy, please refer to this doc."
}

variable "add_secret" {
  type = map(object({
    key_vault_id = string
    certificate  = map(string)
  }))
  default     = null
  description = "Map of secret which have keyvault id and a object of certificate."
}

variable "single_placement_group" {
  type        = bool
  default     = true
  description = "Should this Virtual Machine Scale Set be limited to a Single Placement Group, which means the number of instances will be capped at 100 Virtual Machines. Defaults to true."
}

variable "source_image_id" {
  type        = string
  default     = null
  description = "The ID of an Image which each Virtual Machine in this Scale Set should be based on."
}


variable "using_source_image_reference" {
  type        = bool
  default     = false
  description = "VM Image is defiend Using Source Image Reference?"
}

variable "publisher_type" {
  type        = string
  description = "Specifies the publisher of the image used to create the virtual machines."
}

variable "offer_type" {
  type        = string
  description = "Specifies the offer of the image used to create the virtual machines."
}

variable "sku_type" {
  type        = string
  description = "Specifies the SKU of the image used to create the virtual machines."
}

variable "version_type" {
  type        = string
  description = "Specifies the version of the image used to create the virtual machines."
}

variable "terminate_notification_enabled" {
  type        = bool
  default     = false
  description = "Should the terminate notification be enabled on this Virtual Machine Scale Set? Defaults to false."
}
variable "terminate_notification_timeout" {
  type        = string
  default     = null
  description = "Length of time (in minutes, between 5 and 15) a notification to be sent to the VM on the instance metadata server till the VM gets deleted. The time duration should be specified in ISO 8601 format."
}

variable "user_data" {
  type        = string
  default     = null
  description = "The Base64-Encoded User Data which should be used for this Virtual Machine Scale Set."
}

variable "zones" {
  type        = list(string)
  default     = null
  description = "Specifies a list of Availability Zones in which this Windows Virtual Machine Scale Set should be located. Changing this forces a new Windows Virtual Machine Scale Set to be created."
}

variable "zone_balance" {
  type        = bool
  default     = false
  description = "Should the Virtual Machines in this Scale Set be strictly evenly distributed across Availability Zones? Defaults to false. Changing this forces a new resource to be created."
}

variable "tags" {
  type        = map(any)
  description = "A mapping of tags which should be assigned to this Virtual Machine Scale Set."
}

