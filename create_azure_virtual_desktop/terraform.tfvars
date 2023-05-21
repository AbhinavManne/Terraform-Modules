resource_group_name             = "AVD-code"
host_pool_name                  = "AVD-hostpool-code"
host_pool_type                  = "Pooled"
host_pool_load_balancer_type    = "BreadthFirst"
application_group_name          = "demo-app-group"
application_group_type          = "RemoteApp"
application_group_friendly_name = "TestAppGroup"
application_group_description   = "Acceptance Test: An application group"

vda_name                     = "googlechrome"
vda_friendly_name            = "Google Chrome"
vda_description              = "Chromium based web browser"
vda_path                     = "C:\\Program Files\\Google\\Chrome\\Application\\chrome.exe"
command_line_argument_policy = "DoNotAllow"
command_line_arguments       = "--incognito"
show_in_portal               = false
icon_path                    = "C:\\Program Files\\Google\\Chrome\\Application\\chrome.exe"
icon_index                   = 0

role_definition_name0 = "Desktop Virtualization User"
role_definition_name1 = "Virtual Machine User Login"
role_definition_name2 = "Virtual Machine Administrator Login"

avd_workspace_name          = "AVD-workspace-demo"
avd_workspace_friendly_name = "First AVD Workspace"
avd_workspace_description   = "Short description of the first Workspace"

vnet   = "AVD-vnet"
subnet = "default"

nic_name                      = "AVD-session-Nic"
ipconfig_name                 = "IpConfiguration"
private_ip_address_allocation = "dynamic"

vm_name            = "AVD-vm1"
disk_size          = "Standard_B1s"
provision_vm_agent = true
timezone           = "Central Standard Time"

admin_username = "admin1234"
admin_password = "admincil@12345"

os_disk_name            = "Diskavd"
caching                 = "ReadWrite"
os_storage_account_type = "Standard_LRS"

boot_storage_account_uri = ""

publisher  = "MicrosoftWindowsDesktop"
offer      = "Windows-10"
sku        = "20h2-evd"
os_version = "latest"

vm_aad_extension_name                       = "AADLoginForWindows"
vm_aad_extension_publisher                  = "Microsoft.Azure.ActiveDirectory"
vm_aad_extension_type                       = "AADLoginForWindows"
vm_aad_extension_type_handler_version       = "1.0"
vm_aad_extension_auto_upgrade_minor_version = true

vm_dsc_extension_name                       = "Microsoft.PowerShell.DSC"
vm_dsc_extension_publisher                  = "Microsoft.Powershell"
vm_dsc_extension_type                       = "DSC"
vm_dsc_extension_type_handler_version       = "2.73"
vm_dsc_extension_auto_upgrade_minor_version = true

storage_account_name             = "workflow145"
storage_account_tier             = "Standard"
storage_account_replication_type = "LRS"


tags = {
  Contact_name     = "ABC"
  Cost_Center      = "111"
  Application_name = "AVD"
}