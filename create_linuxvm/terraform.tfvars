#-------------------------------------DEFAULT VALUES OF VM_MODULE-------------------------#

resource_group_name = "cil-lvm-testing"
location            = "East US"
resource_group_id   = "/subscriptions/33875161-8f7d-43d4-86b9-ab0b607cb103/resourceGroups/cil-lvm-testing" //

#----DEFAULT VALUES: RESOURCE: VIRTUAL MACHINE----#
generate_admin_ssh_key           = false//true
virtual_machine_name             = "lvm-testing"
vm_size                          = "Standard_D2s_v3"//"Standard_F2"//"Standard_B2s"
admin_username                   = "testadmin1"
admin_password                   = "Password1234!"
disable_password_authentication  = false//true
allow_extension_operations       = true
availability_set_id              = "/subscriptions/33875161-8f7d-43d4-86b9-ab0b607cb103/resourceGroups/cil-lvm-testing/providers/Microsoft.Compute/availabilitySets/lvm-testing-avails" // "availability_set_id": conflicts with zone
provision_vm_agent               = true
network_interface_ids            = "/subscriptions/33875161-8f7d-43d4-86b9-ab0b607cb103/resourceGroups/cil-lvm-testing/providers/Microsoft.Network/networkInterfaces/lvm-testing-nic" //
license_type                     = "SLES_BYOS"//"RHEL_BYOS"
capacity_reservation_group_id    = null
computer_name                    = "lvm-cil-test"
custom_data                      = null
dedicated_host_id                = null
dedicated_host_group_id          = null
edge_zone                        = null
encryption_at_host_enabled       = false //true #Message="The property 'securityProfile.encryptionAtHost' is not valid because the 'Microsoft.Compute/EncryptionAtHost' feature is not enabled for this subscription."(Error while testing)
eviction_policy                  = null //"Deallocate" //This can only be configured when priority is set to Spot.
extensions_time_budget           = "PT1H30M"
patch_mode                       = "ImageDefault"
max_bid_price                    = -1
platform_fault_domain            = null
priority                         = "Regular"//"Spot"
proximity_placement_group_id     = null
//secure_boot_enabled              = false//true
source_image_id                  = null//"/subscriptions/33875161-8f7d-43d4-86b9-ab0b607cb103/resourceGroups/Demo-ansible/providers/Microsoft.Compute/galleries/ansible_controllersnap/images/controlleran"
user_data                        = null
//vtpm_enabled                     = null
virtual_machine_scale_set_id     = null
vm_availability_zone             = null//"Zone 1" //"availability_set_id": conflicts with zone
enable_ultra_ssd                 = false//true #Message="Property 'additionalCapabilities.ultraSSDEnabled' is not allowed for Virtual Machines in an Availability Set."
admin_ssh_key_public_key         = null
admin_ssh_key_username           = "azureroot"
enable_boot_diagnostics          = true//false
storage_account_name             = "/subscriptions/33875161-8f7d-43d4-86b9-ab0b607cb103/resourceGroups/cil-lvm-testing/providers/Microsoft.Storage/storageAccounts/lvmtestingstracc" //
str_primary_blob_endpoint        = "https://lvmtestingstracc.blob.core.windows.net/"  //
storage_account_uri              = null
enable_secret_vm                 = false
secret_certificate_store         = null
secret_certificate_url           = null
keyvault_id                     = "/subscriptions/33875161-8f7d-43d4-86b9-ab0b607cb103/resourceGroups/cil-lvm-testing/providers/Microsoft.KeyVault/vaults/lvm-testing-kv" //
storage_os_disk                  = "mystoragedisk1"
caching                          = "ReadWrite"//"ReadOnly" //when diff_disk_setting is true
storage_account_type             = "Standard_LRS"
disk_size_gb                     = null //48
enable_os_disk_write_accelerator = true//false
security_encryption_type         = null //"VMGuestStateOnly" 
enable_diff_disk_settings        = false//true
diff_disk_settings_option        = "Local"//null //This block will work with few vm sizes like "Standard_D2s_v3"
diff_disk_settings_placement     = "CacheDisk"//null
publisher                        = "Canonical" // null
offer                            = "UbuntuServer"
sku                              = "18.04-LTS" //"16.04-LTS"
latest_version                   = "latest"//"Gen2" 
plan_name                        = null
plan_product                     = null
plan_publisher                   = null
enable_termination_notification  = true
termination_notification_timeout = "PT5M"//null
managed_identity_type            = "SystemAssigned, UserAssigned"
managed_identity_ids             = ["/subscriptions/33875161-8f7d-43d4-86b9-ab0b607cb103/resourceGroups/cil-lvm-testing/providers/Microsoft.ManagedIdentity/userAssignedIdentities/lvm-testing-usi"] //
tags = {

  Contact_name     = "ABC"
  Cost_Center      = "999"
  Application_name = "Linux_VM"
}

#----DEFAULT VALUES: RESOURCE: DATA DISKS----#
no_of_managed_disks            = 2 #0
managed_disk_name              = "mdisks"
data_disk_storage_account_type = "Standard_LRS"
data_disk_create_option        = "Empty"
data_disk_disk_size_gb         = 10
data_disk_attachment_caching   = "ReadWrite"

#----DEFAULT VALUES: RESOURCE: POLICY ASSIGNMENT----#
policy_name          = "Audit VMs without managed disks Assignment"
policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/06a78e20-9358-41c9-923c-fb736d382a4d"


#----DEFAULT VALUES: RESOURCE: VIRTUAL MACHINE SHUTDOWN----#
vm_shutdown_schedule_enabled  = true
daily_recurrence_time         = "2200"
timezone                      = "AUS Eastern Standard Time"
notification_settings_enabled = false
email                         = ""//
before_shutdown_time_in_minutes = 30
webhook_url                     = "" //

#----DEFAULT VALUES: RESOURCE: VIRTUAL MACHINE EXTENSION FOR MONITORING----#
vm_monitoring_agent_name              = "monitor-lvm123"
monitoring_publisher                  = "Microsoft.EnterpriseCloud.Monitoring"
monitoring_type                       = "OmsAgentForLinux"
monitoring_type_handler_version       = "1.12"
monitoring_auto_upgrade_minor_version = "true"
log_analytics_workspace_id            = "8b38308d-e034-4598-a6b7-aeefc222cf0d" //
log_primary_shared_key                = "WW1nGDeWO+ugHy6Uii79/aobTtlgE+OvjGdt/k6BsjfDFHCJeKDLpxZ612StkDO5lCBMYFhxXEgXtAmSRKX7sQ==" //

#----DEFAULT VALUES: RESOURCE: VIRTUAL MACHINE EXTENSION :DEPENDENCY AGENT FOR LINUX----#
vm_dependency_agent_name                 = "dependagent"
vm_dependency_agent_publisher            = "Microsoft.Azure.Monitoring.DependencyAgent"
vm_dependency_agent_type                 = "DependencyAgentLinux"
vm_dependency_agent_type_handler_version = "9.5"
vm_dependency_auto_upgrade_minor_version = "true"

#----DEFAULT VALUES: RESOURCE: VIRTUAL MACHINE EXTENSION FOR DIAGNOSTICS----#
storage_account_primary_connection_string = "DefaultEndpointsProtocol=https;AccountName=lvmtestingstracc;AccountKey=Hi1bIW0gF/djCtoD+wp+byQ4bpFRbvSsT0AHGStw7x1QEFgiMrvVJhC4FOnABpcPLgz9sX+5BPEf+ASttRpC8g==;EndpointSuffix=core.windows.net" //
ex_diag                                   = "LinuxDiagnostics"
diag_publisher                            = "Microsoft.Azure.Diagnostics"
diag_type                                 = "LinuxDiagnostic"
diag_type_handler_version                 = "4.0"

#----DEFAULT VALUES: RESOURCES: SECURITY CENTER----#
security_center_subscription_pricing_tier          = "Standard"
security_center_subscription_pricing_resource_type = "VirtualMachines"

#----DEFAULT VALUES: RESOURCES: AZURE VM BACKUP----#
recovery_service_vault_name = "lvm-testing-rsv" //
backup_policy_vm_name       = "backup"
backup_frequency            = "Daily"
backup_time                 = "23:00"
retention_daily_count       = 10

#----DEFAULT VALUES: RESOURCES: AZURE DISK ENCRYPTION FOR AZURE VM DISKS----#
enable_disk_encryption = true//false
keyvault_key_name      = "lvm-key123"

disk_encryption_name          = "des-lvm"
disk_encryption_identity_type = "SystemAssigned"


#----DEFAULT VALUES: ALERT MODULE----#
storage_account_id       = "/subscriptions/33875161-8f7d-43d4-86b9-ab0b607cb103/resourceGroups/cil-lvm-testing/providers/Microsoft.Storage/storageAccounts/lvmtestingstracc" //input
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
#----------------------------------------------------------------------------------------------------------#