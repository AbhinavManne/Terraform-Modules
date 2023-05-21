#LINUX_VM : MODULE

#----------------------------------------------Locals---------------------------------------------#
locals {
  number_of_disks        = var.no_of_managed_disks != null ? var.no_of_managed_disks : null
  disk_encryption_set_id = var.enable_disk_encryption ? azurerm_disk_encryption_set.disken.0.id : " "
  principal_id           = var.enable_disk_encryption ? azurerm_disk_encryption_set.disken.0.identity[0].principal_id : " "
  tenant_id              = var.enable_disk_encryption ? azurerm_disk_encryption_set.disken.0.identity.0.tenant_id : " "
  object_id              = var.enable_disk_encryption ? azurerm_disk_encryption_set.disken.0.identity.0.principal_id : " "

}
resource "tls_private_key" "rsa" {
    count     = var.generate_admin_ssh_key ? 1 : 0
    algorithm = "RSA"
    rsa_bits = 4096
}
#-----------------------------------------RESOURCE: VIRTUAL MACHINE----------------------------------------#
resource "azurerm_linux_virtual_machine" "lvm" {
  name                            = var.virtual_machine_name
  resource_group_name             = var.resource_group_name
  location                        = var.location
  size                            = var.vm_size
  admin_username                  = var.admin_username
  admin_password                  = var.disable_password_authentication ? null : var.admin_password
  allow_extension_operations      = var.allow_extension_operations
  availability_set_id             = var.availability_set_id
  provision_vm_agent              = var.patch_mode == "AutomaticByPlatform" ? true : var.provision_vm_agent
  network_interface_ids           = [var.network_interface_ids]  //--->
  license_type                    = var.license_type
  capacity_reservation_group_id   = var.availability_set_id == null && var.proximity_placement_group_id == null && var.capacity_reservation_group_id != null ? var.capacity_reservation_group_id : null
  computer_name                   = var.computer_name
  custom_data                     = var.custom_data != null ? var.custom_data : null
  dedicated_host_id               = var.dedicated_host_id
  dedicated_host_group_id         = var.dedicated_host_id == null && var.dedicated_host_group_id != null ? var.dedicated_host_group_id : null
  disable_password_authentication = var.disable_password_authentication
  edge_zone                       = var.edge_zone
  encryption_at_host_enabled      = var.encryption_at_host_enabled
  eviction_policy                 = var.priority == "Spot" ? var.eviction_policy : null
  extensions_time_budget          = var.extensions_time_budget
  patch_mode                      = var.patch_mode
  max_bid_price                   = var.priority == "Spot" ? var.max_bid_price : null
  platform_fault_domain           = var.platform_fault_domain
  priority                        = var.priority
  proximity_placement_group_id    = var.proximity_placement_group_id
  secure_boot_enabled             = var.security_encryption_type != null ? true : false //var.secure_boot_enabled
  source_image_id                 = var.source_image_id != null && var.plan_name == null && var.publisher == null ? var.source_image_id : null
  user_data                       = var.user_data
  vtpm_enabled                    = var.security_encryption_type != null ? true : false //var.vtpm_enabled
  virtual_machine_scale_set_id    = var.virtual_machine_scale_set_id
  zone                            = var.availability_set_id == null ? var.vm_availability_zone : null

  dynamic "additional_capabilities" {
    for_each = var.enable_ultra_ssd != null ? [1] : []
    content {
      ultra_ssd_enabled = var.enable_ultra_ssd
    }
  }

  dynamic "admin_ssh_key" {
    for_each = var.disable_password_authentication ? [1] : []
    content {
      public_key = var.admin_ssh_key_public_key == null ? tls_private_key.rsa[0].public_key_openssh : file(var.admin_ssh_key_public_key)//"xxxxxxxxx"//file("~/.ssh/id_rsa.pub") //var.admin_ssh_key_public_key
      username   = var.admin_ssh_key_username
    }
  }

  dynamic "boot_diagnostics" {
    for_each = var.enable_boot_diagnostics ? [1] : []
    content {
      storage_account_uri = var.storage_account_name != null ? var.str_primary_blob_endpoint : var.storage_account_uri
    }
  }

  dynamic "secret" {
    for_each = var.enable_secret_vm ? [1] : []
    content {
      dynamic "certificate" {
        for_each = var.secret_certificate_store != null ? [1] : []
        content {
          url   = var.secret_certificate_url
        }
      }
      key_vault_id = var.key_vault_id
    }
  }

  os_disk {
    name                             = var.storage_os_disk
    caching                          = var.caching
    storage_account_type             = var.storage_account_type
    disk_encryption_set_id           = var.enable_disk_encryption ? local.disk_encryption_set_id : null
    disk_size_gb                     = var.disk_size_gb
    write_accelerator_enabled        = var.storage_account_type == "Premium_LRS" && var.caching == "None" ? var.enable_os_disk_write_accelerator : false
    secure_vm_disk_encryption_set_id = var.security_encryption_type == "DiskWithVMGuestState" ? local.disk_encryption_set_id : null
    security_encryption_type         = var.security_encryption_type

    dynamic "diff_disk_settings" {
      for_each = var.enable_diff_disk_settings ? [1] : []
      content {
        option    = var.diff_disk_settings_option
        placement = var.diff_disk_settings_placement
      }
    }
  }

  dynamic "source_image_reference" {
    for_each = var.publisher != null && var.plan_name == null && var.source_image_id == null ? [1] : []
    content {
      publisher = var.publisher
      offer     = var.offer
      sku       = var.sku
      version   = var.latest_version
    }
  }

  dynamic "plan" {
    for_each = var.plan_name != null && var.publisher == null && var.source_image_id == null? [1] : []
    content {
      name      = var.plan_name
      product   = var.plan_product
      publisher = var.plan_publisher
    }
  }

  dynamic "termination_notification" {
    for_each = var.enable_termination_notification ? [1] : []
    content {
      enabled = var.enable_termination_notification
      timeout = var.termination_notification_timeout
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
  count                  = local.number_of_disks
  name                   = "${var.managed_disk_name}-${count.index + 1}"
  location               = var.location
  resource_group_name    = var.resource_group_name
  storage_account_type   = var.data_disk_storage_account_type
  create_option          = var.data_disk_create_option
  disk_size_gb           = var.data_disk_disk_size_gb
  disk_encryption_set_id = var.enable_disk_encryption ? local.disk_encryption_set_id : null
}

resource "azurerm_virtual_machine_data_disk_attachment" "dda" {
  count              = local.number_of_disks
  managed_disk_id    = azurerm_managed_disk.mdisk.*.id[count.index]
  virtual_machine_id = azurerm_linux_virtual_machine.lvm.id
  lun                = count.index
  caching            = var.data_disk_attachment_caching
}

#-----------------------------------------RESOURCE: POLICY ASSIGNMENT--------------------------------------#
resource "azurerm_resource_policy_assignment" "policy" {
  name                 = var.policy_name
  resource_id          = azurerm_linux_virtual_machine.lvm.id
  policy_definition_id = var.policy_definition_id
}

#-----------------------------------------RESOURCE: VM SHUTDOWN SCHEDULE------------------------------------#
resource "azurerm_dev_test_global_vm_shutdown_schedule" "shutdown" {
  virtual_machine_id    = azurerm_linux_virtual_machine.lvm.id
  location              = var.location
  enabled               = var.vm_shutdown_schedule_enabled
  daily_recurrence_time = var.daily_recurrence_time
  timezone              = var.timezone

  notification_settings {
      enabled         = var.notification_settings_enabled
      email           = var.email 
      time_in_minutes = var.before_shutdown_time_in_minutes
      webhook_url     = var.notification_settings_enabled ? var.webhook_url : var.webhook_url
    }
  }


#-----------------------------------------RESOURCE: VM EXTENSION------------------------------------------#
#Create a Virtual Machine Extension (a monitoring agent)
#Collects events and performance data from the virtual machine and delivers it to the Log Analytics workspace.
resource "azurerm_virtual_machine_extension" "mmaagent" {
  name                       = var.vm_monitoring_agent_name
  virtual_machine_id         = azurerm_linux_virtual_machine.lvm.id
  publisher                  = var.monitoring_publisher
  type                       = var.monitoring_type
  type_handler_version       = var.monitoring_type_handler_version
  auto_upgrade_minor_version = var.monitoring_auto_upgrade_minor_version
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


#-----------------------------------------RESOURCE: VM EXTENSION------------------------------------------#
#Create a VM Extension (a dependency agent for linux)
#Collects discovered data about processes running on the virtual machine and external process dependencies, which are used by the Map feature in VM insights. The Dependency agent relies on the Log Analytics agent to deliver its data to Azure Monitor.
resource "azurerm_virtual_machine_extension" "da" {
  name                       = var.vm_dependency_agent_name
  virtual_machine_id         = azurerm_linux_virtual_machine.lvm.id
  publisher                  = var.vm_dependency_agent_publisher
  type                       = var.vm_dependency_agent_type
  type_handler_version       = var.vm_dependency_agent_type_handler_version
  auto_upgrade_minor_version = var.vm_dependency_auto_upgrade_minor_version
}

#-----------------------------------------RESOURCE: VM EXTENSION------------------------------------------#
#Create a VM Extension (FOR DIAG SETTINGS)
data "azurerm_storage_account_sas" "token" {
  connection_string = var.storage_account_primary_connection_string
  https_only        = true

  resource_types {
    service   = true
    container = true
    object    = true
  }

  services {
    blob  = true
    table = true
    queue = false
    file  = false
  }

  start  = "2021-12-17T00:00:00Z"
  expiry = "2021-12-17T00:00:00Z"

  permissions {
    tag     = true
    filter  = true
    read    = true
    write   = true
    delete  = true
    list    = true
    add     = true
    create  = true
    update  = true
    process = true
  }
}

//=== Install Diagnostic Extension ===//
resource "azurerm_virtual_machine_extension" "diagnostics" {
  name                 = var.ex_diag
  virtual_machine_id   = azurerm_linux_virtual_machine.lvm.id
  publisher            = var.diag_publisher
  type                 = var.diag_type
  type_handler_version = var.diag_type_handler_version

  settings = <<SETTINGS
    {
      "StorageAccount": "${var.storage_account_name}",
      "ladCfg": {
          "diagnosticMonitorConfiguration": {
                "eventVolume": "Medium", 
                "metrics": {
                     "metricAggregation": [
                        {
                            "scheduledTransferPeriod": "PT1H"
                        }, 
                        {
                            "scheduledTransferPeriod": "PT1M"
                        }
                    ], 
                    "resourceId": "${azurerm_linux_virtual_machine.lvm.id}"
                },
                "performanceCounters": ${file("${path.module}/configs/performancecounters.json")},
                "syslogEvents": ${file("${path.module}/configs/syslogevents.json")}
          }, 
          "sampleRateInSeconds": 15
      }
    }
  SETTINGS

  protected_settings = <<SETTINGS
    {
        "storageAccountName": "${var.storage_account_name}",
        "storageAccountSasToken": "${data.azurerm_storage_account_sas.token.sas}",
        "storageAccountEndPoint": "https://core.windows.net",
         "sinksConfig":  {
              "sink": [
                {
                    "name": "SyslogJsonBlob",
                    "type": "JsonBlob"
                },
                {
                    "name": "LinuxCpuJsonBlob",
                    "type": "JsonBlob"
                }
              ]
        }
    }
    SETTINGS
}

#-----------------------------RESOURCE: SECURITY CENTER: MICROSOFT DEFENDER FOR KEYVAULT-------------------#
resource "azurerm_security_center_subscription_pricing" "defender" {
  tier          = var.security_center_subscription_pricing_tier
  resource_type = var.security_center_subscription_pricing_resource_type
}

#-----------------------------------------RESOURCE: VM BACKUP POLICY---------------------------------------#
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

resource "azurerm_backup_protected_vm" "bpvm" {
  resource_group_name = var.resource_group_name
  recovery_vault_name = var.recovery_service_vault_name
  source_vm_id        = azurerm_linux_virtual_machine.lvm.id
  backup_policy_id    = azurerm_backup_policy_vm.backuppol.id
}

#--------------------------------------------RESOURCES: SSE WITH CMK-------------------------------#
data "azurerm_client_config" "current" {}

data "azurerm_key_vault_key" "data_key" {
  count        = var.enable_disk_encryption ? 1 : 0
  name         = var.keyvault_key_name
  key_vault_id = var.keyvault_id
}

resource "azurerm_role_assignment" "disk-encryption-read-keyvault" {
  scope                = var.keyvault_id
  role_definition_name = "Reader"
  principal_id         = data.azurerm_client_config.current.object_id //var.principa_id
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
#---------------------------------------------------------------------------------------------------------#