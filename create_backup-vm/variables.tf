#-------------------------------------DATA SOURCE: RESOURCE GROUP-----------------------------------------#
variable "resource_group" {
  type        = string
  description = "Name of the resource group"
}

#----------------------------------------------------------------------------------------------------------#
#                                         BACKUP VM                                                        #
#----------------------------------------------------------------------------------------------------------#

#-----------------------------------RESOURCE: RECOVERY SERVICES VAULT--------------------------------------#
variable "recovery_service_vault_name" {
  type = string
  description = "Specifies the name of the Recovery Services Vault."
}


variable "recovery_service_vault_sku" {
  type = string
  description = "Sets the vault's SKU. Possible values include: Standard, RS0."
}


variable "recovery_soft_delete_enabled" {
  type = string
  description = " Is soft delete enable for this Vault? Defaults to true."
}


#-----------------------------------RESOURCE: BACKUP POLICY VM--------------------------------------------#
variable "backup_policy_vm_name" {
  type = string
  description = "Specifies the name of the Backup Policy."
}


variable "backup_frequency" {
  type = string
  description = "Sets the backup frequency. Must be either Daily orWeekly."
}


variable "backup_time" {
  type = string
  description = " The time of day to perform the backup in 24hour format."
}


variable "retention_daily_count" {
  type = number
  description = " The number of daily backups to keep. Must be between 7 and 9999."
}

#--------------------------------------RESOURCE: VIRTUAL MACHINE------------------------------------------#
variable "virtual_machine" {
  type        = string
  description = "Name of the virtual machine"
}


variable "vm_size" {
  type = string
  description = "Specifies the size of the Virtual Machine."
}


variable "delete_os_disk_on_termination" {
  type = string
  description = "Should the OS Disk (either the Managed Disk / VHD Blob) be deleted when the Virtual Machine is destroyed? Defaults to false."
}


variable "delete_data_disks_on_termination" {
  type = string
  description = "Should the Data Disks (either the Managed Disks / VHD Blobs) be deleted when the Virtual Machine is destroyed? Defaults to false."
}


variable "license_type" {
  type = string
  description = "Specifies the BYOL Type for this Virtual Machine. This is only applicable to Windows Virtual Machines. Possible values are Windows_Client and Windows_Server."
}


variable "publisher" {
  type = string
  description = "Specifies the publisher of the image used to create the virtual machine."
}


variable "offer" {
  type = string
  description = "Specifies the offer of the image used to create the virtual machine"
}


variable "sku" {
  type = string
  description = "Specifies the SKU of the image used to create the virtual machine."
}


variable "latest_version" {
  type = string
  description = "Specifies the version of the image used to create the virtual machine."
}


variable "storage_os_disk" {
  type        = string
  description = "Name of os disk"
}

variable "caching" {
  type = string
  description = "Specifies the caching requirements for the OS Disk. Possible values include None, ReadOnly and ReadWrite."
}


variable "create_option" {
  type = string
  description = "Specifies how the OS Disk should be created. Possible values are Attach (managed disks only) and FromImage."
}


variable "managed_disk_type" {
  type = string
  description = "Specifies the type of Managed Disk which should be created. Possible values are Standard_LRS, StandardSSD_LRS or Premium_LRS."
}


variable "storage_data_disk" {
  type = string
  description = "The name of the Data Disk"
}


variable "storage_data_disk_caching" {
  type = string
  description = "Specifies the caching requirements for the Data Disk. Possible values include None, ReadOnly and ReadWrite."
}


variable "storage_data_disk_create_option" {
  type = string
  description = "Specifies how the data disk should be created. Possible values are Attach, FromImage and Empty."
}


variable "lun" {
  type = number
  description = "Specifies the logical unit number of the data disk. This needs to be unique within all the Data Disks on the Virtual Machine."
}


variable "disk_size_gb" {
  type = number
  description = "Specifies the size of the data disk in gigabytes."
}


variable "os_profile" {
  type        = string
  description = "Name of os profile"
}


variable "admin_username" {
  type = string
  description = "Specifies the name of the local administrator account."
}


variable "admin_password" {
  type = string
  description = "The password associated with the local administrator account."
}


variable "provision_vm_agent" {
  type = string
  description = "Should the Azure Virtual Machine Guest Agent be installed on this Virtual Machine? Defaults to false"
}


variable "boot_diagnostics_enabled" {
  type = string
  description = "Should Boot Diagnostics be enabled for this Virtual Machine?"
}


variable "identity_type" {
  type = string
  description = "The Managed Service Identity Type of this Virtual Machine. "
}


variable "tags" {
  type        = map(any)
  description = "Tags"
}


#----------------------------------------------------------------------------------------------------------#
#                                      VIRTUAL MACHINES RESOURCES                                          #
#----------------------------------------------------------------------------------------------------------#
#-------------------------------------RESOURCE: VIRTUAL NETWORK & SUBNET---------------------------------#
variable "virtual_network" {
  type        = string
  description = "Name of vnet"
}


variable "address_space" {
  type        = list(string)
  description = "The address space that is used the virtual network."
}


variable "subnet" {
  type        = string
  description = "Name of the subnet"
}


variable "address_prefixes" {
  type        = list(string)
  description = "The address prefixes to use for the subnet"
}


variable "enforce_private_link_service_network_policies" {
  type        = bool
  description = "enforce_private_link_service_network_policies in subnet"
}


variable "enforce_private_link_endpoint_network_policies" {
  type        = bool
  description = "enforce_private_link_endpoint_network_policies in subnet"
}

#---------------------------------------RESOURCE: NETWORK INTERFACE----------------------------------------#
variable "network_interface" {
  type        = string
  description = "Name of the network interface"
}


variable "interface_ip" {
  type        = string
  description = "ip configuration block name"
}

variable "private_ip_address_allocation" {
  type        = string
  description = "The allocation method used for the Private IP Address. Possible values are Dynamic and Static."
}


#---------------------------------------RESOURCE: STORAGE ACCOUNT-----------------------------------------#
variable "storage_account" {
  type        = string
  description = "Specifies the name of the storage account. Changing this forces a new resource to be created."
}


variable "account_tier" {
  type        = string
  description = "Defines the Tier to use for this storage account. Valid options are Standard and Premium"
}


variable "account_replication_type" {
  type        = string
  description = "Defines the type of replication to use for this storage account. Valid options are LRS, GRS, RAGRS, ZRS, GZRS and RAGZRS"
}


#---------------------------------------RESOURCE: AVAILABILITY SET----------------------------------------#
variable "availability_set" {
  type        = string
  description = "Specifies the name of the availability set."
}


variable "platform_update_domain_count" {
  type        = number
  description = "Specifies the number of update domains that are used. Defaults to 5"
}


variable "platform_fault_domain_count" {
  type        = number
  description = "Specifies the number of update domains that are used. Defaults to 5"
}

#------------------------------------RESOURCE: PUBLIC IP---------------------------------------------------#
variable "public_ip" {
  type        = string
  description = "Name of the public ip"
}


variable "public_ip_allocation" {
  type        = string
  description = "Allocation method of the public ip"
}


#---------------------------------RESOURCE: NETWORK SECURITY GROUP-----------------------------------------#
variable "nsg_name" {
  type        = string
  description = "Specifies the name of the network security group. "
}


variable "security_rule_access" {
  type        = string
  description = "Specifies whether network traffic is allowed or denied. Possible values are Allow and Deny. "
}


variable "security_rule_direction" {
  type        = string
  description = " The direction specifies if rule will be evaluated on incoming or outgoing traffic. Possible values are Inbound and Outbound"
}


variable "security_rule_name" {
  type        = string
  description = "The name of the security rule. "
}


variable "security_rule_priority" {
  type        = string
  description = " Specifies the priority of the rule."
}


variable "security_rule_protocol" {
  type        = string
  description = "Network protocol this rule applies to. Possible values include Tcp, Udp, Icmp, Esp, Ah or * "
}


variable "security_rule_source_port_range" {
  type        = string
  description = "List of source ports or port ranges. This is required if source_port_range is not specified."
}


variable "security_rule_source_address_prefix" {
  type        = string
  description = "CIDR or source IP range or * to match any IP. Tags such as ‘VirtualNetwork’, ‘AzureLoadBalancer’ and ‘Internet’ can also be used. This is required if source_address_prefixes is not specified."
}


variable "security_rule_destination_port_range" {
  type        = string
  description = "List of destination ports or port ranges. This is required if destination_port_range is not specified."
}


#--------------------------------------RESOURCES: LOAD BALANCER-------------------------------------------#
variable "lb_name" {
  type        = string
  description = "Specifies the name of the Load Balancer."
}


variable "lb_frontend_ip_config" {
  type        = string
  description = "One or multiple frontend_ip_configuration blocks"
}


variable "lb_backend_address_pool" {
  type        = string
  description = "Specifies the name of the Backend Address Pool."
}


variable "lb_nat_rule" {
  type        = string
  description = "Specifies the name of the NAT pool."
}


variable "lb_nat_rule_protocol" {
  type        = string
  description = "The transport protocol for the external endpoint. Possible values are Udp or Tcp."
}


variable "lb_nat_rule_frontend_port" {
  type        = string
  description = "The first port number in the range of external ports that will be used to provide Inbound Nat to NICs associated with this Load Balancer."
}


variable "lb_nat_rule_backend_port" {
  type        = string
  description = "The port used for the internal endpoint. Possible values range between 1 and 65535, inclusive."
}


variable "interface_address_association" {
  type        = string
  description = " "
}

variable "application_security_group" {
  type        = string
  description = "Name of the application security group "
}

#-------------------------------------RESOURCE: GLOBAL VM SHUTDOWN SCHEDULE-------------------------------#
variable "vm_shutdown_schedule_enabled" {
  type = string
  description = "Whether to enable the schedule."
}


variable "daily_recurrence_time" {
  type = string
  description = "The time each day when the schedule takes effect. "
}


variable "timezone" {
  type = string
  description = " The time zone ID"
}


variable "notification_settings_enabled" {
  type = string
  description = "Whether to enable pre-shutdown notifications. Possible values are true and false. Defaults to false"
}


#-----------------------------------------RESOURCE: LOG ANALYTICS WORKSPACE-------------------------------#
variable "log_analytics_workspace" {
  type = string
  description = "Specifies the name of the Log Analytics Workspace."
}


variable "log_sku" {
  type = string
  description = " Specifies the Sku of the Log Analytics Workspace."
}


variable "retention_in_days" {
  type = number
  description = "The workspace data retention in days. Possible values are either 7 (Free Tier only) or range between 30 and 730."
}


#----------------------------------RESOURCE: VIRTUAL MACHINE EXTENSION(MONITORING AGENT)-------------------#
variable "vm_monitoring_agent_name" {
  type = string
  description = "The name of the virtual machine extension peering."
}


variable "monitoring_publisher" {
  type = string
  description = "The publisher of the extension, available publishers can be found by using the Azure CLI."
}


variable "monitoring_type" {
  type = string
  description = "The type of extension, available types for a publisher can be found using the Azure CLI."
}


variable "monitoring_type_handler_version" {
  type = string
  description = "Specifies the version of the extension to use, available versions can be found using the Azure CLI."
}


variable "monitoring_auto_upgrade_minor_version" {
  type = string
  description = "Specifies if the platform deploys the latest minor version update to the type_handler_version specified."
}



#------------------------------------------RESOURCE: LOG ANALYTICS SOLUTION--------------------------------#
variable "solution_name" {
  type = string
  description = "Specifies the name of the solution to be deployed."
}


variable "plan_publisher" {
  type = string
  description = "The publisher of the solution. For example Microsoft"
}


variable "plan_product" {
  type = string
  description = "The product name of the solution. For example OMSGallery/Containers"
}

#----------------------------------RESOURCE: VIRTUAL MACHINE EXTENSION(DEPENDENCY AGENT)-----------------#
variable "vm_dependency_agent_name" {
  type = string
  description = "The name of the virtual machine extension peering."
}


variable "dependency_agent_publisher" {
  type = string
  description = " The publisher of the extension, available publishers can be found by using the Azure CLI. "
}


variable "dependency_agent_type" {
  type = string
  description = "The type of extension, available types for a publisher can be found using the Azure CLI."
}


variable "dependency_agent_type_handler" {
  type = string
  description = "Specifies the version of the extension to use, available versions can be found using the Azure CLI."
}


variable "dependency_agent_auto_upgrade" {
  type = string
  description = "Specifies if the platform deploys the latest minor version update to the type_handler_version specified."
}


#----------------------------------RESOURCE: VIRTUAL MACHINE EXTENSION(INGUEST MONITORING)-----------------#
variable "diag_name" {
  type = string
  description = "The name of the virtual machine extension peering."
}


variable "diag_publisher" {
  type = string
  description = " The publisher of the extension, available publishers can be found by using the Azure CLI. "
}


variable "diag_type" {
  type = string
  description = "The type of extension, available types for a publisher can be found using the Azure CLI."
}


variable "diag_type_handler_version" {
  type = string
  description = "Specifies the version of the extension to use, available versions can be found using the Azure CLI."
}


variable "diag_auto_upgrade_minor_version" {
  type = string
  description = "Specifies if the platform deploys the latest minor version update to the type_handler_version specified."
}


#--------------------------------------RESOURCE: SECURITY CENTER SUBSCRIPTION PRICING---------------------#
variable "security_center_subscription_pricing_tier" {
  type = string
  description = "The pricing tier to use. Possible values are Free and Standard."
}


variable "security_resource_type" {
  type = string
  description = "The resource type this setting affects."
}


#--------------------------------------RESOURCE: SECURITY CENTER CONTACT----------------------------------#
variable "security_center_email" {
  type = string
  description = "The email of the Security Center Contact."
}


variable "security_center_phone" {
  type = string
  description = "The phone number of the Security Center Contact."
}


variable "security_center_alert_notifications" {
  type = string
  description = "Whether to send security alerts notifications to the security contact."
}


variable "security_center_alerts_to_admins" {
  type = string
  description = "Whether to send security alerts notifications to subscription admins."
}


#--------------------------------------RESOURCE: SECURITY CENTER SETTING-----------------------------------#
variable "security_center_setting_name" {
  type = string
  description = "The setting to manage. Possible values are MCAS and WDATP."
}


variable "enable_security_center_setting" {
  type = string
  description = "Boolean flag to enable/disable data access."
}


#------------------------------------RESOURCE: SECURITY CENTER AUTO PROVISIONING---------------------------#
variable "enable_security_center_auto_provisioning" {
  type = string
  description = "Should the security agent be automatically provisioned on Virtual Machines in this subscription"
}

#------------------------------------VARIABLES: RESOURCE: ROLE ASSIGNMENT----------------------------------#
variable "role_definition_name" {
  type        = list(string)
  description = "List of Role Definitions"
  default     = ["Reader", "Contributor"]
}
#----------------------------------------------------------------------------------------------------------#

