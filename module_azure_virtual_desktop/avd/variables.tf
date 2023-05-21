variable "resource_group_name" {
  type        = string
  description = "RG name in Azure"
}

variable "host_pool_name" {
  type        = string
  description = "host pool name"
}

variable "host_pool_type" {
  type        = string
  description = "host pool type"
}

variable "host_pool_load_balancer_type" {
  type        = string
  description = "host pool load balancer type"
}

variable "application_group_name" {
  type        = string
  description = "Virtual desktop application group name"
}

variable "application_group_type" {
  type        = string
  description = "Virtual desktop application group type"
}

variable "application_group_friendly_name" {
  type        = string
  description = "Virtual desktop application group friendly name"
}

variable "application_group_description" {
  type        = string
  description = "Virtual desktop application group description"
}

variable "vda_name" {
  type        = string
  description = "Virtual desktop name"
}
variable "vda_friendly_name" {
  type        = string
  description = "Virtual desktop friendly namw"
}
variable "vda_description" {
  type        = string
  description = "Virtual desktop description"
}
variable "vda_path" {
  type        = string
  description = "Virtual desktop Path"
}
variable "command_line_argument_policy" {
  type        = string
  description = "Command Line Argument Policy"
}
variable "command_line_arguments" {
  type        = string
  description = "Command Line Argument"
}
variable "show_in_portal" {
  type        = bool
  description = "Status on portal"
}
variable "icon_path" {
  type        = string
  description = "Icon Path"
}
variable "icon_index" {
  type        = number
  description = "Icon Index"
}

variable "role_definition_name0" {
  type        = string
  description = "Description of Role Definition"
}
variable "role_definition_name1" {
  type        = string
  description = "Description of Role Definition"
}
variable "role_definition_name2" {
  type        = string
  description = "Description of Role Definition"
}


variable "avd_workspace_name" {
  type        = string
  description = "AVD Workspace Name"
}
variable "avd_workspace_friendly_name" {
  type        = string
  description = "AVD Workspace friendly Name"
}
variable "avd_workspace_description" {
  type        = string
  description = "AVD Workspace description"
}

variable "vnet" {
  type        = string
  description = "Virtual Network Name"
}
variable "subnet" {
  type        = string
  description = "Subnet Name"
}

variable "nic_name" {
  type        = string
  description = "Network Interface Name"
}
variable "ipconfig_name" {
  type        = string
  description = "IPconfiguration Name"
}
variable "private_ip_address_allocation" {
  type        = string
  description = "value"
}


variable "vm_name" {
  type        = string
  description = "Virtual Machine Name "
}
variable "disk_size" {
  type        = string
  description = "Disk Size"
}
variable "provision_vm_agent" {
  type        = bool
  description = "Status of VM agent"
}
variable "timezone" {
  type        = string
  description = "Timezone"
}
variable "admin_username" {
  type        = string
  description = "Admin Username"
}
variable "admin_password" {
  type        = string
  description = "Admin Password"
}
variable "os_disk_name" {
  type        = string
  description = "OS Disk Name"
}
variable "caching" {
  type        = string
  description = "Caching"
}
variable "os_storage_account_type" {
  type        = string
  description = "OS Storage Account Type"
}
variable "boot_storage_account_uri" {
  type        = string
  description = "Storage URL"
}
variable "publisher" {
  type        = string
  description = "Publisher"
}
variable "offer" {
  type        = string
  description = "Offer"
}
variable "sku" {
  type        = string
  description = "sku"
}
variable "os_version" {
  type        = string
  description = "version"
}


variable "vm_aad_extension_name" {
  type        = string
  description = "Azure Active directory extension name"
}
variable "vm_aad_extension_publisher" {
  type        = string
  description = "Azure Active directory extension publisher"
}
variable "vm_aad_extension_type" {
  type        = string
  description = "Azure Active directory extension type "
}
variable "vm_aad_extension_type_handler_version" {
  type        = string
  description = "Azure Active directory extension handler version"
}
variable "vm_aad_extension_auto_upgrade_minor_version" {
  type        = bool
  description = "Azure Active directory extension auto upgrade version status"
}

variable "vm_dsc_extension_name" {
  type        = string
  description = "DSC Extendion Name"
}
variable "vm_dsc_extension_publisher" {
  type        = string
  description = "DSC Extendion publisher"
}
variable "vm_dsc_extension_type" {
  type        = string
  description = "DSC Extendion type"
}
variable "vm_dsc_extension_type_handler_version" {
  type        = string
  description = "DSC Extendion handler version"
}
variable "vm_dsc_extension_auto_upgrade_minor_version" {
  type        = bool
  description = "DSC Extendion auto upgrade status version status"
}

variable "tags" {
  description = "Tag Name"
  type        = map(any)
}

#---------variables for Storage Account--------#

variable "storage_account_name" {
  type        = string
  description = "Resource Group Name"
}

variable "storage_account_tier" {
  type        = string
  description = "Storage Account Tier"
}

variable "storage_account_replication_type" {
  type        = string
  description = "Storage Account Replication Type"
}


