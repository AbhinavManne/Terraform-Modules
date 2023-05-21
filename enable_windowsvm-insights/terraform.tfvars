#-------------------------------------DEFAULT VALUES OF WINDOWS VM MODULE-------------------------#

#----DEFAULT VALUES: DATA SOURCE: RESOURCE GROUP----#
resource_group = "myrg-wvm"

#----DEFAULT VALUES: RESOURCE: VIRTUAL NETWORK & SUBNET----#
virtual_network  = "wvm-network12"
address_space    = ["10.1.0.0/29"]
subnet           = "internal12"
address_prefixes = ["10.1.0.0/29"]

#----DEFAULT VALUES: RESOURCE: NETWORK INTERFACE----#
network_interface             = "wvm-nic12"
interface_ip                  = "testconfiguration1"
private_ip_address_allocation = "Dynamic"

#----DEFAULT VALUES: RESOURCE: STORAGE ACCOUNT----#
storage_account          = "wvmstore12"
account_tier             = "Standard"
account_replication_type = "LRS"

#----DEFAULT VALUES: RESOURCE: AVAILABILITY SET----#
availability_set             = "wvm-aset12"
platform_update_domain_count = 5
platform_fault_domain_count  = 3

#----DEFAULT VALUES: RESOURCE: PUBLIC IP----#
public_ip            = "publicip"
public_ip_allocation = "Dynamic"

#----DEFAULT VALUES: RESOURCE: NETWORK SECURITY GROUP----#
nsg_name                             = "tls_webserver"
security_rule_access                 = "Allow"
security_rule_direction              = "Inbound"
security_rule_name                   = "tls"
security_rule_priority               = 100
security_rule_protocol               = "Tcp"
security_rule_source_port_range      = "*"
security_rule_source_address_prefix  = "*"
security_rule_destination_port_range = "443"

#----DEFAULT VALUES: RESOURCES: LOAD BALANCER----#
lb_name               = "lvm-lb"
lb_frontend_ip_config = "PublicIPAddress"

lb_backend_address_pool = "BackEndAddressPool"

lb_nat_rule               = "HTTPSAccess"
lb_nat_rule_protocol      = "Tcp"
lb_nat_rule_frontend_port = 443
lb_nat_rule_backend_port  = 443

interface_address_association = "testconfiguration1"

application_security_group = "asp-vm"

#----DEFAULT VALUES: RESOURCE: VIRTUAL MACHINE----#
virtual_machine      = "wvm121"
vm_size              = "Standard_F2"
license_type         = "Windows_Server"
publisher            = "MicrosoftSQLServer"
offer                = "SQL2016SP2-WS2016"
sku                  = "SQLDEV"
latest_version       = "latest"
storage_os_disk      = "mystoragedisk1"
caching              = "ReadWrite"
storage_account_type = "Standard_LRS"
admin_username       = "testadmin"
admin_password       = "Password1234!"
identity_type        = "SystemAssigned"
tags = {

  Contact_name     = "ABC"
  Cost_Center      = "999"
  Application_name = "WINDOWS_VM"
}
policy_name          = "Audit VMs without managed disks Assignment"
policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/06a78e20-9358-41c9-923c-fb736d382a4d"

#----DEFAULT VALUES: RESOURCE: VIRTUAL MACHINE SHUTDOWN----#
vm_shutdown_schedule_enabled  = true
daily_recurrence_time         = "2200"
timezone                      = "AUS Eastern Standard Time"
notification_settings_enabled = false

#----DEFAULT VALUES: RESOURCE: LOG ANALYTICS WORKSPACE----#
log_analytics_workspace = "wvm-workspace12"
log_sku                 = "PerGB2018"
retention_in_days       = 30
data_source_type        = "customlogs"
log_storage_insights_name = "example-storageinsightconfig"
log_data_export_name      = "dataExport1"
log_data_export_table_names = ["Heartbeat"]
log_data_export_enabled     = true
log_saved_search            = "exampleSavedSearch"
log_saved_search_category   = "exampleCategory"
log_saved_search_display_name = "exampleDisplayName"
log_saved_search_query        = "exampleQuery"
automation_account            = "automation-01"
automation_account_sku_name   = "Basic"
datasource_windows_event_name = "lad-wpc"
datasource_windows_event_log_name = "Application"
datasource_windows_event_types = ["error","warning", "information"]
datasource_windows_performance_name = "example-lad-wpc"
datasource_windows_performance_object_name = "CPU"
datasource_windows_performance_instance_name = "*"
datasource_windows_performance_counter_name = "CPU"
datasource_windows_performance_interval = 10

#----DEFAULT VALUES: RESOURCE: VIRTUAL MACHINE EXTENSION FOR MONITORING----#
vm_monitoring_agent_name              = "monitor-wvm12"
monitoring_publisher                  = "Microsoft.EnterpriseCloud.Monitoring"
monitoring_type                       = "MicrosoftMonitoringAgent" #"OmsAgentForWindows" "MicrosoftMonitoringAgent"
monitoring_type_handler_version       = "1.0"                      #"1.12"
monitoring_auto_upgrade_minor_version = "true"

#----DEFAULT VALUES: RESOURCE: LOG ANALYTICS SOLUTION----#
solution_name  = "VMInsights"
plan_publisher = "Microsoft"
plan_product   = "OMSGallery/VMInsights"

#----DEFAULT VALUES: RESOURCE: VIRTUAL MACHINE EXTENSION: DEPENDENCY AGENT----#
vm_dependency_agent_name = "dependagent"
dependency_agent_publisher = "Microsoft.Azure.Monitoring.DependencyAgent"
dependency_agent_type = "DependencyAgentWindows"
dependency_agent_type_handler = "9.5"
dependency_agent_auto_upgrade = "true"

#----DEFAULT VALUES: RESOURCE: VIRTUAL MACHINE EXTENSION FOR DIAGNOSTICS----#
diag_name                       = "WindowsDiagnostics"
diag_publisher                  = "Microsoft.Azure.Diagnostics"
diag_type                       = "IaaSDiagnostics"
diag_type_handler_version       = "1.16"
diag_auto_upgrade_minor_version = "true"

#----DEFAULT VALUES: RESOURCES: SECURITY CENTER----#
security_center_subscription_pricing_tier = "Standard"
security_resource_type                    = "VirtualMachines"

security_center_email               = "abc@gds.ey.com"
security_center_phone               = "9874892932"
security_center_alert_notifications = true
security_center_alerts_to_admins    = true

security_center_setting_name   = "MCAS"
enable_security_center_setting = "false"

enable_security_center_auto_provisioning = "Off"

#----DEFAULT VALUES: RESOURCES: AZURE VM BACKUP----#
recovery_service_vault_name  = "wvm-recovery-vault"
recovery_service_vault_sku   = "Standard"
recovery_soft_delete_enabled = true

backup_policy_vm_name = "backup"
backup_frequency      = "Daily"
backup_time           = "23:00"
retention_daily_count = 10

#----DEFAULT VALUES: RESOURCES: AZURE DISK ENCRYPTION FOR AZURE VM DISKS----#
keyvault_name                        = "vm0-keyvault079"
keyvault_sku_name                    = "premium"
keyvault_enabled_for_disk_encryption = true
#keyvault_soft_delete_enabled = true
purge_protection_enabled = true

keyvault_key_name = "wvm-key"
key_type          = "RSA"
key_size          = 2048

disk_encryption_name          = "des-wvm1"
disk_encryption_identity_type = "SystemAssigned"


#----------------------------------------------------------------------------------------------------------#