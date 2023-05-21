
resource_group_name = "cil-vm-testing"
location            = "East US"
resource_group_id   = "/subscriptions/33875161-8f7d-43d4-86b9-ab0b607cb103/resourceGroups/cil-vm-testing" //
tags = {
  Contact_name     = "ABC"
  Cost_Center      = "111"
  Application_name = "CIL VM TEST"
}

#----DEFAULT VALUES: VIRTUAL MACHINE MODULE----#
virtual_machine_name                = "wvm-test"
network_interface_ids               = "/subscriptions/33875161-8f7d-43d4-86b9-ab0b607cb103/resourceGroups/cil-vm-testing/providers/Microsoft.Network/networkInterfaces/cil-vm-nic" //
vm_size                             = "Standard_D2s_v3"                                                                                                                            #"Standard_B2s"#"Standard_F2" Code="NotSupported" Message="Ephemeral OS disk is not supported for VM size Standard_F2." // while enabling diff_disk_settings_option
license_type                        = "Windows_Server"
availability_set_id                 = "/subscriptions/33875161-8f7d-43d4-86b9-ab0b607cb103/resourceGroups/cil-vm-testing/providers/Microsoft.Compute/availabilitySets/vm-test-avail" //
admin_username                      = "testadmin"
admin_password                      = "Password1234!"
source_image_id                     = null  # The ID of the Image which this Virtual Machine should be created from.
provision_vm_agent                  = true  #
allow_extension_operations          = true  #
dedicated_host_id                   = null  #The ID of a Dedicated Host where this machine should be run on.
custom_data                         = null  #The Base64-Encoded Custom Data which should be used for this Virtual Machine
enable_automatic_updates            = true  #
enable_encryption_at_host           = false //true #Message="The property 'securityProfile.encryptionAtHost' is not valid because the 'Microsoft.Compute/EncryptionAtHost' feature is not enabled for this subscription."
proximity_placement_group_id        = null
patch_mode                          = "AutomaticByOS" //"Manual" //"AutomaticByOS"
vm_availability_zone                = null            //
vm_time_zone                        = null
capacity_reservation_group_id       = null //Capacity reservations allow you to reserve capacity for your virtual machine needs.
computer_name                       = "vmtest"
dedicated_host_group_id             = null
edge_zone                           = null
eviction_policy                     = null      #"Deallocate" //This can only be configured when priority is set to Spot.
extensions_time_budget              = "PT1H30M" #null
hotpatching_enabled                 = false
max_bid_price                       = -1        // The maximum price you're willing to pay for this Virtual Machine, in US Dollars; which must be greater than the current spot price. If this bid price falls below the current spot price the Virtual Machine will be evicted using the eviction_policy.
priority                            = "Regular" # "Spot" //  Code="SkuNotAvailable" Message="The requested size for resource '/subscriptions/33875161-8f7d-43d4-86b9-ab0b607cb103/resourceGroups/cil-vm-testing/providers/Microsoft.Compute/virtualMachines/wvm-test' is currently not available in location 'eastus' zones '' for subscription '33875161-8f7d-43d4-86b9-ab0b607cb103'.
secure_boot_enabled                 = null      #true Message="Use of TrustedLaunch setting is not supported for the provided image."
user_data                           = null
virtual_machine_scale_set_id        = null
vtpm_enabled                        = null
platform_fault_domain               = null                     #"-1"
publisher                           = "MicrosoftWindowsServer" #"MicrosoftSQLServer"
offer                               = "WindowsServer"          #"SQL2016SP2-WS2016"
vm_sku                              = "2019-Datacenter"        #"SQLDEV"
latest_version                      = "latest"
storage_os_disk                     = "mystoragedisk1"
caching                             = "ReadOnly" #"ReadWrite" #`os_disk`: `diff_disk_settings` can only be set when `caching` is set to `ReadOnly`
storage_account_type                = "Standard_LRS"
disk_size_gb                        = null
enable_os_disk_write_accelerator    = false
security_encryption_type            = null  #"VMGuestStateOnly" #"Use of ConfidentialVM setting is not supported for the provided image."
enable_diff_disk_settings           = false #true #false #
diff_disk_settings_option           = null  #"Local"#null #Message="OS disk of Ephemeral VM with size greater than 50 GB is not allowed for VM size Standard_D2s_v3 when the DiffDiskPlacement is CacheDisk.
diff_disk_settings_placement        = null  #"CacheDisk"#null #
plan_vm                             = null
product_vm                          = null
publisher_vm                        = null
enable_secret_vm                    = false
secret_certificate_store            = null
secret_certificate_url              = null
key_vault_id                        = null
enable_termination_notification     = true                                         #false #
termination_notification_timeout    = null                                         #"P6" #
enable_ultra_ssd                    = false                                        //true #Message="Property 'additionalCapabilities.ultraSSDEnabled' is not allowed for Virtual Machines in an Availability Set."
winrm_protocol                      = "Http"                                       #
key_vault_certificate_secret_url    = null                                         #when protocol is "Https"
additional_unattend_content         = null                                         #The XML formatted content that is added to the unattend.xml file for the specified path and component.
additional_unattend_content_setting = null                                         #"AutoLogon" , "FirstLogonCommands"
enable_boot_diagnostics             = true                                         #
str_primary_blob_endpoint           = "https://cilvmstracc.blob.core.windows.net/" //
storage_account_uri                 = null                                         // not needed since we have given the str_primary_blob_endpoint value

managed_identity_type = "SystemAssigned, UserAssigned"
managed_identity_ids  = ["/subscriptions/33875161-8f7d-43d4-86b9-ab0b607cb103/resourceGroups/cil-vm-testing/providers/Microsoft.ManagedIdentity/userAssignedIdentities/cil-vm-userami"] //


//RESOURCE: DATA DISKS
no_of_managed_disks            = 2 #0
managed_disk_name              = "mdisks"
data_disk_storage_account_type = "Standard_LRS"
data_disk_create_option        = "Empty"
data_disk_disk_size_gb         = 10
data_disk_attachment_caching   = "ReadWrite"

//RESOURCE: POLICY ASSIGNMENT
policy_name          = "Audit VMs without managed disks Assignment"
policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/06a78e20-9358-41c9-923c-fb736d382a4d"

//RESOURCE: VIRTUAL MACHINE SHUTDOWN
vm_shutdown_schedule_enabled  = true
daily_recurrence_time         = "2200"
timezone                      = "AUS Eastern Standard Time"
notification_settings_enabled = false


//RESOURCE: VIRTUAL MACHINE EXTENSION FOR MONITORING
log_analytics_workspace_id            = "8d2b402d-d7a8-4076-9291-489fa510e47e"                                                     //
log_primary_shared_key                = "kic0bwETBsKfu7ctuLomLKLX64u/2qySfZGt8GTH6FKqgZiBcFGF8URfjisFdm0nJlwWWTZdHk8ljW/I9iUybQ==" //
vm_monitoring_agent_name              = "OMSextension"
monitoring_publisher                  = "Microsoft.EnterpriseCloud.Monitoring"
monitoring_type                       = "MicrosoftMonitoringAgent" #"OmsAgentForWindows" "MicrosoftMonitoringAgent"
monitoring_type_handler_version       = "1.0"                      #"1.12"
monitoring_auto_upgrade_minor_version = "true"

//RESOURCE: VIRTUAL MACHINE EXTENSION: DEPENDENCY AGENT
vm_dependency_agent_name      = "dependagent"
dependency_agent_publisher    = "Microsoft.Azure.Monitoring.DependencyAgent"
dependency_agent_type         = "DependencyAgentWindows"
dependency_agent_type_handler = "9.5"
dependency_agent_auto_upgrade = "false"

//RESOURCE: VIRTUAL MACHINE EXTENSION FOR DIAGNOSTICS
diag_name                       = "WindowsDiagnostics"
diag_publisher                  = "Microsoft.Azure.Diagnostics"
diag_type                       = "IaaSDiagnostics"
diag_type_handler_version       = "1.16"
diag_auto_upgrade_minor_version = "true"
storage_account_name            = "strdynam"
storage_primary_access_key      = "pmW802Jpffgn5UTTL1am7NQVpQYp774T/Mmw9KdhFDuMp/kCkxRFQCGSBUsi5324kR5f6lH0S0OO+AStC7PB/w=="

//RESOURCES: Security center
log_analytics_id          = "/subscriptions/33875161-8f7d-43d4-86b9-ab0b607cb103/resourcegroups/cil-vm-testing/providers/microsoft.operationalinsights/workspaces/cil-vm-log" //
security_center_workspace = false

//RESOURCES: AZURE VM BACKUP
recovery_service_vault_name = "cil-vm-rsv" //
backup_policy_vm_name       = "backup"
backup_frequency            = "Daily"
backup_time                 = "23:00"
retention_daily_count       = 10

//RESOURCES: SSE WITH CMK FOR AZURE VM DISKS
enable_disk_encryption        = true
keyvault_key_name             = "cil-cm-test-key" //
keyvault_id                   = "/subscriptions/33875161-8f7d-43d4-86b9-ab0b607cb103/resourceGroups/cil-vm-testing/providers/Microsoft.KeyVault/vaults/vm-test-kv999"
disk_encryption_name          = "vm-des12"
disk_encryption_identity_type = "SystemAssigned"

#----DEFAULT VALUES: ALERT MODULE----#
storage_account_id       = "/subscriptions/33875161-8f7d-43d4-86b9-ab0b607cb103/resourceGroups/cil-vm-testing/providers/Microsoft.Storage/storageAccounts/cilvmstracc" //input
action_group_name        = "test-action-groupvm"
short_name               = "actiongz"
action_group_rule_name   = "test-z"
scope_type               = "Resource"
activity_log_alert_name  = "test-activitylogalertvm"
operation_name_log_alert = "Microsoft.Network/networkSecurityGroups/write"
category_log_alert       = "Security"
metric_alert_name        = "test-metricalertvm"
metric_namespace         = "Microsoft.Storage/storageAccounts"
metric_name              = "Transactions"
aggregation              = "Total"
operator                 = "GreaterThan"
threshold                = 50
dimension_name           = "ApiName"
dimension_operator       = "Include"
values                   = ["*"]