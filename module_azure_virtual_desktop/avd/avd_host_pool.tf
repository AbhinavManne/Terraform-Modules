#Resource group data source
data "azurerm_resource_group" "example" {
  name = var.resource_group_name
}

#Azure Virtual desktop host pool
resource "azurerm_virtual_desktop_host_pool" "pooledbreadthfirst" {
  name                = var.host_pool_name
  location            = data.azurerm_resource_group.example.location
  resource_group_name = data.azurerm_resource_group.example.name

  type               = var.host_pool_type
  load_balancer_type = var.host_pool_load_balancer_type
}

resource "azurerm_virtual_desktop_host_pool_registration_info" "example" {
  hostpool_id     = azurerm_virtual_desktop_host_pool.pooledbreadthfirst.id
  expiration_date = timeadd(timestamp(), "2h")
}

#Application group in virtual desktop host pool
resource "azurerm_virtual_desktop_application_group" "remoteapp" {
  name                = var.application_group_name
  location            = data.azurerm_resource_group.example.location
  resource_group_name = data.azurerm_resource_group.example.name

  type          = var.application_group_type
  host_pool_id  = azurerm_virtual_desktop_host_pool.pooledbreadthfirst.id
  friendly_name = var.application_group_friendly_name
  description   = var.application_group_description
}

#Applicaton in host pool application group
resource "azurerm_virtual_desktop_application" "chrome" {
  name                         = var.vda_name
  application_group_id         = azurerm_virtual_desktop_application_group.remoteapp.id
  friendly_name                = var.vda_friendly_name
  description                  = var.vda_description
  path                         = var.vda_path
  command_line_argument_policy = var.command_line_argument_policy
  command_line_arguments       = var.command_line_arguments
  show_in_portal               = var.show_in_portal
  icon_path                    = var.icon_path
  icon_index                   = var.icon_index
}

#Client Config data source
data "azurerm_client_config" "example" {}

# Assign Azure AD users/groups to App Groups
resource "azurerm_role_assignment" "example" {
  scope                = azurerm_virtual_desktop_application_group.remoteapp.id
  role_definition_name = var.role_definition_name0
  principal_id         = data.azurerm_client_config.example.object_id
}

# Assign Azure AD users/groups to App Groups
resource "azurerm_role_assignment" "example1" {
  scope                = data.azurerm_resource_group.example.id
  role_definition_name = var.role_definition_name1
  principal_id         = data.azurerm_client_config.example.object_id
}

resource "azurerm_role_assignment" "example2" {
  scope                = data.azurerm_resource_group.example.id
  role_definition_name = var.role_definition_name2
  principal_id         = data.azurerm_client_config.example.object_id
}

# AVD Workspace
resource "azurerm_virtual_desktop_workspace" "wvd_workspace1" {
  name                = var.avd_workspace_name
  resource_group_name = data.azurerm_resource_group.example.name
  location            = data.azurerm_resource_group.example.location
  friendly_name       = var.avd_workspace_friendly_name
  description         = var.avd_workspace_description
  tags                = var.tags
}

# Connect App Groups to Workspaces
resource "azurerm_virtual_desktop_workspace_application_group_association" "workspace_appgroup" {
  workspace_id         = azurerm_virtual_desktop_workspace.wvd_workspace1.id
  application_group_id = azurerm_virtual_desktop_application_group.remoteapp.id
}

#----------------------------------
# Session Host VM
#----------------------------------

#Virtual network data source
data "azurerm_virtual_network" "example" {
  name                = var.vnet
  resource_group_name = data.azurerm_resource_group.example.name
}

#Subnet data source
data "azurerm_subnet" "example" {
  name                 = var.subnet
  virtual_network_name = data.azurerm_virtual_network.example.name
  resource_group_name  = data.azurerm_resource_group.example.name
}

# Create a NIC for the Session Host VM
resource "azurerm_network_interface" "wvd_vm1_nic" {
  name                = var.nic_name
  resource_group_name = data.azurerm_resource_group.example.name
  location            = data.azurerm_resource_group.example.location

  ip_configuration {
    name                          = var.ipconfig_name
    subnet_id                     = data.azurerm_subnet.example.id
    private_ip_address_allocation = var.private_ip_address_allocation
  }
}

# Create the Session Host VM
resource "azurerm_windows_virtual_machine" "wvd_vm1" {
  name                  = var.vm_name
  resource_group_name   = data.azurerm_resource_group.example.name
  location              = data.azurerm_resource_group.example.location
  size                  = var.disk_size
  network_interface_ids = [azurerm_network_interface.wvd_vm1_nic.id]
  provision_vm_agent    = var.provision_vm_agent
  timezone              = var.timezone

  admin_username = var.admin_username
  admin_password = var.admin_password

  os_disk {
    name                 = var.os_disk_name
    caching              = var.caching
    storage_account_type = var.os_storage_account_type
  }

  boot_diagnostics {
    storage_account_uri = var.boot_storage_account_uri # Passing a null value will utilize a Managed Storage Account to store Boot Diagnostics
  }

  source_image_reference {
    publisher = var.publisher
    offer     = var.offer
    sku       = var.sku # This is the Windows 10 Enterprise Multi-Session image
    version   = var.os_version
  }
}

resource "azurerm_virtual_machine_extension" "AADLoginForWindows" {
  name                       = var.vm_aad_extension_name
  virtual_machine_id         = azurerm_windows_virtual_machine.wvd_vm1.id
  publisher                  = var.vm_aad_extension_publisher
  type                       = var.vm_aad_extension_type
  type_handler_version       = var.vm_aad_extension_type_handler_version
  auto_upgrade_minor_version = var.vm_aad_extension_auto_upgrade_minor_version

}

# VM Extension for Desired State Config
resource "azurerm_virtual_machine_extension" "vm1ext_dsc" {
  name                       = var.vm_dsc_extension_name
  virtual_machine_id         = azurerm_windows_virtual_machine.wvd_vm1.id
  publisher                  = var.vm_dsc_extension_publisher
  type                       = var.vm_dsc_extension_type
  type_handler_version       = var.vm_dsc_extension_type_handler_version
  auto_upgrade_minor_version = var.vm_dsc_extension_auto_upgrade_minor_version

  settings = <<-SETTINGS
    {
      "modulesUrl": "https://wvdportalstorageblob.blob.core.windows.net/galleryartifacts/Configuration.zip",
      "configurationFunction": "Configuration.ps1\\AddSessionHost",
      "properties": {
        "hostPoolName": "${var.host_pool_name}",
        "registrationInfoToken": "${azurerm_virtual_desktop_host_pool_registration_info.example.id}"
        
      }
    }
    SETTINGS

  lifecycle {
    ignore_changes = [settings]
  }

  depends_on = [azurerm_virtual_machine_extension.AADLoginForWindows]
}

#--------------------------------------------Storage Account---------------------------------------------
resource "azurerm_storage_account" "storage_account" {

  name                     = var.storage_account_name
  resource_group_name      = data.azurerm_resource_group.example.name
  location                 = data.azurerm_resource_group.example.location
  account_tier             = var.storage_account_tier
  account_replication_type = var.storage_account_replication_type

}