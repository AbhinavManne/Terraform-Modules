#WINDOWS_VM : MODULE

#----------------------------------------------Locals---------------------------------------------#
locals {
  number_of_disks        = var.no_of_managed_disks != null ? var.no_of_managed_disks : null
  disk_encryption_set_id = var.enable_disk_encryption ? azurerm_disk_encryption_set.disken.0.id : " "
  principal_id           = var.enable_disk_encryption ? azurerm_disk_encryption_set.disken.0.identity[0].principal_id : " "
  tenant_id              = var.enable_disk_encryption ? azurerm_disk_encryption_set.disken.0.identity.0.tenant_id : " "
  object_id              = var.enable_disk_encryption ? azurerm_disk_encryption_set.disken.0.identity.0.principal_id : " "

}

#-----------------------------------------RESOURCE: VIRTUAL MACHINE----------------------------------------#
resource "azurerm_windows_virtual_machine" "vm1" {
  name                  = var.virtual_machine_name
  location              = var.location                
  resource_group_name   = var.resource_group_name     
  network_interface_ids = [var.network_interface_ids] 
  size                  = var.vm_size
  license_type          = var.license_type
  availability_set_id   = var.availability_set_id  
  admin_username        = var.admin_username
  admin_password        = var.admin_password
  source_image_id              = var.source_image_id != null ? var.source_image_id : null
  provision_vm_agent           = var.patch_mode == "AutomaticByPlatform" ? true : var.provision_vm_agent
  allow_extension_operations   = var.allow_extension_operations
  dedicated_host_id            = var.dedicated_host_id
  custom_data                  = var.custom_data != null ? var.custom_data : null
  enable_automatic_updates     = var.patch_mode != "Manual" ? var.enable_automatic_updates : false
  encryption_at_host_enabled   = var.enable_encryption_at_host
  proximity_placement_group_id = var.proximity_placement_group_id 
  patch_mode                   = var.patch_mode
  zone                         = var.vm_availability_zone
  timezone                     = var.vm_time_zone
  capacity_reservation_group_id= var.availability_set_id == null && var.proximity_placement_group_id == null && var.capacity_reservation_group_id !=null ?  var.capacity_reservation_group_id : null
  computer_name                = var.computer_name
  dedicated_host_group_id      = var.dedicated_host_id == null && var.dedicated_host_group_id != null ? var.dedicated_host_group_id : null
  edge_zone                    = var.edge_zone
  eviction_policy              = var.priority == "Spot" ? var.eviction_policy : null
  extensions_time_budget       = var.extensions_time_budget
  hotpatching_enabled          = var.patch_mode == "AutomaticByPlatform" ? var.hotpatching_enabled : false
  max_bid_price                = var.priority == "Spot" ? var.max_bid_price : null
  priority                     = var.priority
  secure_boot_enabled          = var.security_encryption_type != null ? true : var.secure_boot_enabled
  user_data                    = var.user_data
  virtual_machine_scale_set_id = var.virtual_machine_scale_set_id
  vtpm_enabled                 = var.security_encryption_type != null ? true : var.vtpm_enabled
  platform_fault_domain        = var.platform_fault_domain

  source_image_reference {
    publisher = var.publisher
    offer     = var.offer
    sku       = var.vm_sku
    version   = var.latest_version
  }

  os_disk {
    name                      = var.storage_os_disk
    caching                   = var.caching
    storage_account_type      = var.storage_account_type
    disk_encryption_set_id    = var.enable_disk_encryption ? local.disk_encryption_set_id : null
    disk_size_gb              = var.disk_size_gb 
    write_accelerator_enabled = var.storage_account_type == "Premium_LRS" && var.caching == "None" ? var.enable_os_disk_write_accelerator : false
    secure_vm_disk_encryption_set_id = var.security_encryption_type == "DiskWithVMGuestState" ? local.disk_encryption_set_id : null
    security_encryption_type         = var.security_encryption_type

    dynamic "diff_disk_settings" {
      for_each  = var.enable_diff_disk_settings ? [1] : []
      content{
      option    = var.diff_disk_settings_option
      placement = var.diff_disk_settings_placement
      }
    }
  }
  
  dynamic "plan" {
      for_each  = var.plan_vm != null ? [1] : []
      content{
        name      = var.plan_vm
        product   = var.product_vm
        publisher = var.publisher_vm
      }
  }

  dynamic "secret" {
       for_each = var.enable_secret_vm ? [1] :[]
       content{
          dynamic "certificate"{
            for_each = var.secret_certificate_store != null ? [1] : []
            content{
              store  = var.secret_certificate_store
              url    = var.secret_certificate_url
            }
         }
          key_vault_id = var.key_vault_id
       } 
  }

  dynamic "termination_notification" {
       for_each = var.enable_termination_notification ? [1] : []
       content{
        enabled = var.enable_termination_notification
        timeout = var.termination_notification_timeout
       }
    
  }

  dynamic "additional_capabilities" {
        for_each = var.enable_ultra_ssd != null ? [1] : []
        content {
         ultra_ssd_enabled = var.enable_ultra_ssd
        }
  }

  dynamic "winrm_listener" {
    for_each = var.winrm_protocol != null ? [1] : []
    content {
      protocol        = var.winrm_protocol
      certificate_url = var.winrm_protocol == "Https" ? var.key_vault_certificate_secret_url : null
    }
  }

  dynamic "additional_unattend_content" {
    for_each = var.additional_unattend_content != null ? [1] : []
    content {
      content = var.additional_unattend_content
      setting = var.additional_unattend_content_setting
    }
  }

  dynamic "boot_diagnostics" {
    for_each = var.enable_boot_diagnostics ? [1] : []
    content {
      storage_account_uri = var.storage_account_name != null ? var.str_primary_blob_endpoint : var.storage_account_uri
    }
  }

  dynamic "identity" {
    for_each = var.managed_identity_type != null ? [1] : []
    content {
      type         = var.managed_identity_type
      identity_ids = var.managed_identity_type == "UserAssigned" || var.managed_identity_type == "SystemAssigned, UserAssigned" ? var.managed_identity_ids : null
    }
  }

  tags = var.tags
}

#----------------------------------------RESOURCE: DATA DISKS ---------------------------------------------#
resource "azurerm_managed_disk" "mdisk" {
  count                = local.number_of_disks 
  name                 = "${var.managed_disk_name}-${count.index+1}" 
  location             = var.location
  resource_group_name  = var.resource_group_name
  storage_account_type = var.data_disk_storage_account_type
  create_option        = var.data_disk_create_option
  disk_size_gb         = var.data_disk_disk_size_gb
  disk_encryption_set_id = var.enable_disk_encryption ? local.disk_encryption_set_id : null
}

resource "azurerm_virtual_machine_data_disk_attachment" "dda" {
  count              = local.number_of_disks 
  managed_disk_id    = azurerm_managed_disk.mdisk.*.id[count.index]
  virtual_machine_id = azurerm_windows_virtual_machine.vm1.id
  lun                = "${count.index}"
  caching            = var.data_disk_attachment_caching
}

#-----------------------------------------RESOURCE: POLICY ASSIGNMENT--------------------------------------#
resource "azurerm_resource_policy_assignment" "policy" {
  name                 = var.policy_name
  resource_id          = azurerm_windows_virtual_machine.vm1.id
  policy_definition_id = var.policy_definition_id
}

#-----------------------------------------RESOURCE: VM SHUTDOWN SCHEDULE------------------------------------#
resource "azurerm_dev_test_global_vm_shutdown_schedule" "shutdown" {
  virtual_machine_id    = azurerm_windows_virtual_machine.vm1.id
  location              = var.location
  enabled               = var.vm_shutdown_schedule_enabled
  daily_recurrence_time = var.daily_recurrence_time
  timezone              = var.timezone
  notification_settings {
    enabled = var.notification_settings_enabled

  }
}

#-----------------------------------------RESOURCE: VM EXTENSIONS------------------------------------#
#Create a Virtual Machine Extension (a monitoring agent)
resource "azurerm_virtual_machine_extension" "mmaagent" {
  name                       = var.vm_monitoring_agent_name
  virtual_machine_id         = azurerm_windows_virtual_machine.vm1.id
  publisher                  = var.monitoring_publisher
  type                       = var.monitoring_type
  type_handler_version       = var.monitoring_type_handler_version
  settings                   = <<SETTINGS
    {
      "workspaceId": "${var.log_analytics_workspace_id}"
    }
SETTINGS
  protected_settings         = <<PROTECTED_SETTINGS
   {
      "workspaceKey": "${var.log_primary_shared_key}"
   }
PROTECTED_SETTINGS
}

#Create a VM Extension (a dependency agent for windows)
resource "azurerm_virtual_machine_extension" "da" {
  name                       = var.vm_dependency_agent_name
  virtual_machine_id         = azurerm_windows_virtual_machine.vm1.id
  publisher                  = var.dependency_agent_publisher
  type                       = var.dependency_agent_type
  type_handler_version       = var.dependency_agent_type_handler
  auto_upgrade_minor_version = var.dependency_agent_auto_upgrade
}

#Create a VM Extension (FOR DIAG SETTINGS)
resource "azurerm_virtual_machine_extension" "InGuestDiagnostics" {
  name                       = var.diag_name
  virtual_machine_id         = azurerm_windows_virtual_machine.vm1.id
  publisher                  = var.diag_publisher
  type                       = var.diag_type
  type_handler_version       = var.diag_type_handler_version
  auto_upgrade_minor_version = var.diag_auto_upgrade_minor_version

  settings           = <<SETTINGS
    {
      "xmlCfg": "${base64encode(templatefile("${path.module}/templates/wadcfgxml.tmpl", { vmid = azurerm_windows_virtual_machine.vm1.id }))}",
      "storageAccount": "${var.storage_account_name}"
    }
SETTINGS
  protected_settings = <<PROTECTEDSETTINGS
    {
      "storageAccountName": "${var.storage_account_name}",
      "storageAccountKey": "${var.storage_primary_access_key}",
      "storageAccountEndPoint": "https://core.windows.net"
    }
PROTECTEDSETTINGS
}

#-----------------------------------------RESOURCE: SECURITY ----------------------------------------#

resource "azurerm_security_center_workspace" "main" {
  count        = var.security_center_workspace ? 1 :0
  scope        = azurerm_windows_virtual_machine.vm1.id
  workspace_id = var.log_analytics_id
}

#-----------------------------------------RESOURCE: VM BACKUP POLICY---------------------------------#
resource "azurerm_backup_policy_vm" "backuppol" {
  name                = var.backup_policy_vm_name
  resource_group_name = var.resource_group_name
  recovery_vault_name = var.recovery_service_vault_name 
  backup {
    frequency = var.backup_frequency
    time      = var.backup_time
  }
  retention_daily {
    count = var.retention_daily_count
  }
}

resource "azurerm_backup_protected_vm" "vm1" {
  resource_group_name = var.resource_group_name
  recovery_vault_name = var.recovery_service_vault_name
  source_vm_id        = azurerm_windows_virtual_machine.vm1.id
  backup_policy_id    = azurerm_backup_policy_vm.backuppol.id
}

#--------------------------------------------RESOURCES: FOR DISK ENCRYPTION(SSE WITH CMK)-------------------------#
data "azurerm_key_vault_key" "data_key" {
  count        = var.enable_disk_encryption ? 1 : 0
  name         = var.keyvault_key_name
  key_vault_id = var.keyvault_id 
}

resource "azurerm_role_assignment" "disk-encryption-read-keyvault" {
  count                = var.enable_disk_encryption ? 1 : 0
  scope                = var.keyvault_id 
  role_definition_name = "Reader"
  principal_id         = local.principal_id 
}

resource "azurerm_disk_encryption_set" "disken" {
  count               = var.enable_disk_encryption ? 1 : 0
  name                = var.disk_encryption_name
  resource_group_name = var.resource_group_name
  location            = var.location
  key_vault_key_id    = data.azurerm_key_vault_key.data_key.0.id
  identity {
    type = var.disk_encryption_identity_type
  }
}

