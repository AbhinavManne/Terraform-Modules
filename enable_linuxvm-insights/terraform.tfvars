#-------------------------------------DEFAULT VALUES OF COSMOS DB MONGO_DB_MODULE-------------------------#

#----DEFAULT VALUES: DATA SOURCE: RESOURCE GROUP----#
resource_group = "myrg-lvm"

#----DEFAULT VALUES: RESOURCE: VIRTUAL NETWORK & SUBNET----#
virtual_network  = "vm-network123"
address_space    = ["10.1.0.0/29"]
subnet           = "internal123"
address_prefixes = ["10.1.0.0/29"]

#----DEFAULT VALUES: RESOURCE: NETWORK INTERFACE----#
network_interface             = "lvm-nic123"
interface_ip                  = "testconfiguration1"
private_ip_address_allocation = "Dynamic"

#----DEFAULT VALUES: RESOURCE: STORAGE ACCOUNT----#
storage_account          = "lvmstore123"
account_tier             = "Standard"
account_replication_type = "LRS"

storage_container     = "content"
container_access_type = "private"

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

#----DEFAULT VALUES: RESOURCE: AVAILABILITY SET----#
availability_set             = "lvm-aset123"
platform_update_domain_count = 5
platform_fault_domain_count  = 3

#----DEFAULT VALUES: RESOURCE: VIRTUAL MACHINE----#
virtual_machine                 = "lvm121"
vm_size                         = "Standard_F2"
admin_username                  = "testadmin1"
admin_password                  = "Password1234!"
allow_extension_operations      = true
disable_password_authentication = false
provision_vm_agent              = true
caching                         = "ReadWrite"
os_disk_storage_acct_type       = "Standard_LRS"
publisher                       = "Canonical"
offer                           = "UbuntuServer"
sku                             = "16.04-LTS"
latest_version                  = "latest"
identity_type                   = "SystemAssigned"
tags = {

  Contact_name     = "ABC"
  Cost_Center      = "999"
  Application_name = "Linux_VM"
}

#----DEFAULT VALUES: RESOURCE: VIRTUAL MACHINE SHUTDOWN----#
vm_shutdown_schedule_enabled  = true
daily_recurrence_time         = "2200"
timezone                      = "AUS Eastern Standard Time"
notification_settings_enabled = false

#----DEFAULT VALUES: RESOURCE: LOG ANALYTICS WORKSPACE----#
log_analytics_workspace = "lvm-workspace123"
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

#----DEFAULT VALUES: RESOURCE: VIRTUAL MACHINE EXTENSION FOR MONITORING----#
vm_monitoring_agent_name              = "monitor-lvm123"
monitoring_publisher                  = "Microsoft.EnterpriseCloud.Monitoring"
monitoring_type                       = "OmsAgentForLinux"
monitoring_type_handler_version       = "1.12"
monitoring_auto_upgrade_minor_version = "true"

#----DEFAULT VALUES: RESOURCE: LOG ANALYTICS SOLUTION----#
solution_name  = "VMInsights"
plan_publisher = "Microsoft"
plan_product   = "OMSGallery/VMInsights"

#----DEFAULT VALUES: RESOURCE: VIRTUAL MACHINE EXTENSION :DEPENDENCY AGENT FOR LINUX----#
vm_dependency_agent_name                 = "dependagent"
vm_dependency_agent_publisher            = "Microsoft.Azure.Monitoring.DependencyAgent"
vm_dependency_agent_type                 = "DependencyAgentLinux"
vm_dependency_agent_type_handler_version = "9.5"
vm_dependency_auto_upgrade_minor_version = "true"

#----DEFAULT VALUES: RESOURCE: VIRTUAL MACHINE EXTENSION FOR DIAGNOSTICS----#
ex_diag                   = "LinuxDiagnostics"
diag_publisher            = "Microsoft.Azure.Diagnostics"
diag_type                 = "LinuxDiagnostic"
diag_type_handler_version = "4.0"

#----DEFAULT VALUES: RESOURCES: SECURITY CENTER----#
security_center_subscription_pricing_tier = "Standard"
security_resource_type                    = "VirtualMachines"

security_center_email               = "abc.xz@gds.ey.com"
security_center_phone               = "9874892932"
security_center_alert_notifications = true
security_center_alerts_to_admins    = true

security_center_setting_name   = "MCAS"
enable_security_center_setting = "false"

enable_security_center_auto_provisioning = "Off"

#----DEFAULT VALUES: RESOURCES: AZURE VM BACKUP----#
recovery_service_vault_name  = "lvm-recovery-vault"
recovery_service_vault_sku   = "Standard"
recovery_soft_delete_enabled = true

backup_policy_vm_name = "backup"
backup_frequency      = "Daily"
backup_time           = "23:00"
retention_daily_count = 10

#----DEFAULT VALUES: RESOURCES: AZURE DISK ENCRYPTION FOR AZURE VM DISKS----#
keyvault_name                        = "lvkeyvault12"
keyvault_sku_name                    = "premium"
keyvault_enabled_for_disk_encryption = true
#keyvault_soft_delete_enabled = true
purge_protection_enabled = true

keyvault_key_name = "lvm-key123"
key_type          = "RSA"
key_size          = 2048

disk_encryption_name          = "des-lvm"
disk_encryption_identity_type = "SystemAssigned"

#----------------------------------------------------------------------------------------------------------#