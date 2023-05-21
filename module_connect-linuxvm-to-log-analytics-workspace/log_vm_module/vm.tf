#LINUX_VM_WITH_LOG_ANALYTICS : MODULE

#-----------------------------------------DATA SOURCE: RESOURCE GROUP-------------------------------------#
data "azurerm_resource_group" "rg" {
  name = var.resource_group
}

#-----------------------------------------RESOURCE: VNET & SUBNET------------------------------------------#
resource "azurerm_virtual_network" "main" {
  name                = var.virtual_network
  address_space       = var.address_space
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
}

resource "azurerm_subnet" "internal" {
  name                 = var.subnet
  resource_group_name  = data.azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = var.address_prefixes
}

#-----------------------------------------RESOURCE: NETWORK INTERFACE--------------------------------------#
resource "azurerm_network_interface" "main" {
  name                = var.network_interface
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name

  ip_configuration {
    name                          = var.interface_ip
    subnet_id                     = azurerm_subnet.internal.id
    private_ip_address_allocation = var.private_ip_address_allocation
  }
}

#-----------------------------------------RESOURCE: STORAGE ACCOUNT----------------------------------------#
resource "azurerm_storage_account" "example" {
  name                     = var.storage_account
  resource_group_name      = data.azurerm_resource_group.rg.name
  location                 = data.azurerm_resource_group.rg.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
}

resource "azurerm_storage_container" "example" {
  name                  = var.storage_container
  storage_account_name  = azurerm_storage_account.example.name
  container_access_type = var.container_access_type
}

resource "azurerm_storage_blob" "example" {
  name                   = "my-awesome-content.zip" #var.storage_blob
  storage_account_name   = azurerm_storage_account.example.name
  storage_container_name = azurerm_storage_container.example.name
  type                   = "Block" #var.type
}

#-----------------------------------------RESOURCE: AVAILABILITY SET----------------------------------------#
resource "azurerm_availability_set" "example" {
  name                         = var.availability_set
  location                     = data.azurerm_resource_group.rg.location
  resource_group_name          = data.azurerm_resource_group.rg.name
  platform_update_domain_count = var.platform_update_domain_count
  platform_fault_domain_count  = var.platform_fault_domain_count

}

resource "azurerm_public_ip" "pip" {
  name                = var.public_ip
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = data.azurerm_resource_group.rg.location
  allocation_method   = var.public_ip_allocation
}

resource "azurerm_network_security_group" "webserver" {
  name                = var.nsg_name
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  security_rule {
    access                     = var.security_rule_access
    direction                  = var.security_rule_direction
    name                       = var.security_rule_name
    priority                   = var.security_rule_priority
    protocol                   = var.security_rule_protocol
    source_port_range          = var.security_rule_source_port_range
    source_address_prefix      = var.security_rule_source_address_prefix
    destination_port_range     = var.security_rule_destination_port_range
    destination_address_prefix = azurerm_subnet.internal.address_prefix
  }
}

resource "azurerm_lb" "example" {
  name                = var.lb_name
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name

  frontend_ip_configuration {
    name                 = var.lb_frontend_ip_config
    public_ip_address_id = azurerm_public_ip.pip.id
  }
}

resource "azurerm_lb_backend_address_pool" "example" {
  resource_group_name = data.azurerm_resource_group.rg.name
  loadbalancer_id     = azurerm_lb.example.id
  name                = var.lb_backend_address_pool
}

resource "azurerm_lb_nat_rule" "example" {
  resource_group_name            = data.azurerm_resource_group.rg.name
  loadbalancer_id                = azurerm_lb.example.id
  name                           = var.lb_nat_rule
  protocol                       = var.lb_nat_rule_protocol
  frontend_port                  = var.lb_nat_rule_frontend_port
  backend_port                   = var.lb_nat_rule_backend_port
  frontend_ip_configuration_name = azurerm_lb.example.frontend_ip_configuration[0].name
}

resource "azurerm_network_interface_backend_address_pool_association" "example" {
  backend_address_pool_id = azurerm_lb_backend_address_pool.example.id
  ip_configuration_name   = var.interface_address_association
  network_interface_id    = azurerm_network_interface.main.id
}

resource "azurerm_network_interface_security_group_association" "example" {
  network_interface_id      = azurerm_network_interface.main.id
  network_security_group_id = azurerm_network_security_group.webserver.id
}
#-----------------------------------------RESOURCE: VIRTUAL MACHINE----------------------------------------#

resource "azurerm_linux_virtual_machine" "example" {
  name                            = var.virtual_machine
  resource_group_name             = data.azurerm_resource_group.rg.name
  location                        = data.azurerm_resource_group.rg.location
  size                            = var.vm_size
  admin_username                  = var.admin_username
  admin_password                  = var.admin_password
  allow_extension_operations      = var.allow_extension_operations
  availability_set_id             = azurerm_availability_set.example.id
  disable_password_authentication = var.disable_password_authentication
  provision_vm_agent              = var.provision_vm_agent
  network_interface_ids = [
    azurerm_network_interface.main.id,
  ]

  os_disk {
    caching                = var.caching
    storage_account_type   = var.os_disk_storage_acct_type
    disk_encryption_set_id = azurerm_disk_encryption_set.example.id
  }

  source_image_reference {
    publisher = var.publisher
    offer     = var.offer
    sku       = var.sku
    version   = var.latest_version
  }

  boot_diagnostics {
    storage_account_uri = azurerm_storage_account.example.primary_blob_endpoint
  }

  identity {
    type = var.identity_type
  }

  tags = var.tags
}
#-----------------------------------------RESOURCE: VM SHUTDOWN SCHEDULE------------------------------------#
resource "azurerm_dev_test_global_vm_shutdown_schedule" "rg" {
  virtual_machine_id = azurerm_linux_virtual_machine.example.id
  location           = data.azurerm_resource_group.rg.location
  enabled            = var.vm_shutdown_schedule_enabled

  daily_recurrence_time = var.daily_recurrence_time
  timezone              = var.timezone


  notification_settings {
    enabled = var.notification_settings_enabled

  }
}

#--------------------------------RESOURCE: LOG ANALYTICS WORKSPACE AND RESOURCES--------------------------------#
resource "azurerm_log_analytics_workspace" "example" {
  name                = var.log_analytics_workspace
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  sku                 = var.log_sku
  retention_in_days   = var.retention_in_days
  tags = var.tags
}

resource "azurerm_log_analytics_linked_storage_account" "example" {
  data_source_type      = var.data_source_type
  resource_group_name   = data.azurerm_resource_group.rg.name
  workspace_resource_id = azurerm_log_analytics_workspace.example.id
  storage_account_ids   = [azurerm_storage_account.example.id]
}

resource "azurerm_log_analytics_storage_insights" "example" {
  name                = var.log_storage_insights_name
  resource_group_name = data.azurerm_resource_group.rg.name
  workspace_id        = azurerm_log_analytics_workspace.example.id

  storage_account_id  = azurerm_storage_account.example.id
  storage_account_key = azurerm_storage_account.example.primary_access_key
}

resource "azurerm_log_analytics_data_export_rule" "example" {
  name                    = var.log_data_export_name
  resource_group_name     = data.azurerm_resource_group.rg.name
  workspace_resource_id   = azurerm_log_analytics_workspace.example.id
  destination_resource_id = azurerm_storage_account.example.id
  table_names             = var.log_data_export_table_names
  enabled                 = var.log_data_export_enabled
}


resource "azurerm_log_analytics_saved_search" "example" {
  name                       = var.log_saved_search
  log_analytics_workspace_id = azurerm_log_analytics_workspace.example.id

  category     = var.log_saved_search_category
  display_name = var.log_saved_search_display_name
  query        = var.log_saved_search_query
}

resource "azurerm_automation_account" "example" {
  name                = var.automation_account
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  sku_name            = var.automation_account_sku_name
}

resource "azurerm_log_analytics_linked_service" "example" {
  resource_group_name = data.azurerm_resource_group.rg.name
  workspace_id        = azurerm_log_analytics_workspace.example.id
  read_access_id      = azurerm_automation_account.example.id
}

resource "azurerm_log_analytics_solution" "example" {
  solution_name         = var.solution_name
  location              = data.azurerm_resource_group.rg.location
  resource_group_name   = data.azurerm_resource_group.rg.name
  workspace_resource_id = azurerm_log_analytics_workspace.example.id
  workspace_name        = azurerm_log_analytics_workspace.example.name

  plan {
    publisher = var.plan_publisher
    product   = var.plan_product
  }
}

#-----------------------------------------RESOURCE: VM EXTENSION------------------------------------------#
#Create a Virtual Machine Extension (a monitoring agent)
#Collects events and performance data from the virtual machine and delivers it to the Log Analytics workspace.
resource "azurerm_virtual_machine_extension" "mmaagent" {
  name                       = var.vm_monitoring_agent_name
  virtual_machine_id         = azurerm_linux_virtual_machine.example.id
  publisher                  = var.monitoring_publisher
  type                       = var.monitoring_type
  type_handler_version       = var.monitoring_type_handler_version
  auto_upgrade_minor_version = var.monitoring_auto_upgrade_minor_version
  settings                   = <<SETTINGS
    {
      "workspaceId": "${azurerm_log_analytics_workspace.example.workspace_id}"
    }
SETTINGS
  protected_settings         = <<PROTECTED_SETTINGS
   {
      "workspaceKey": "${azurerm_log_analytics_workspace.example.primary_shared_key}"
   }
PROTECTED_SETTINGS
}


#-----------------------------------------RESOURCE: VM EXTENSION------------------------------------------#
#Create a VM Extension (a dependency agent for linux)
#Collects discovered data about processes running on the virtual machine and external process dependencies, which are used by the Map feature in VM insights. The Dependency agent relies on the Log Analytics agent to deliver its data to Azure Monitor.
resource "azurerm_virtual_machine_extension" "da" {
  name = var.vm_dependency_agent_name
  depends_on = [
    azurerm_log_analytics_solution.example
  ]
  virtual_machine_id         = azurerm_linux_virtual_machine.example.id
  publisher                  = var.vm_dependency_agent_publisher
  type                       = var.vm_dependency_agent_type
  type_handler_version       = var.vm_dependency_agent_type_handler_version
  auto_upgrade_minor_version = var.vm_dependency_auto_upgrade_minor_version
}

#-----------------------------------------RESOURCE: VM EXTENSION------------------------------------------#
#Create a VM Extension (FOR DIAG SETTINGS)
data "azurerm_storage_account_sas" "token" {
  connection_string = azurerm_storage_account.example.primary_connection_string
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
  virtual_machine_id   = azurerm_linux_virtual_machine.example.id
  publisher            = var.diag_publisher
  type                 = var.diag_type
  type_handler_version = var.diag_type_handler_version

  settings = <<SETTINGS
    {
      "StorageAccount": "${azurerm_storage_account.example.name}",
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
                    "resourceId": "${azurerm_linux_virtual_machine.example.id}"
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
        "storageAccountName": "${azurerm_storage_account.example.name}",
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
#-----------------------------------------RESOURCE: SECURITY CENTER RESOURCES------------------------------#
resource "azurerm_security_center_workspace" "main" {
  scope        = azurerm_linux_virtual_machine.example.id
  workspace_id = azurerm_log_analytics_workspace.example.id
}

resource "azurerm_security_center_subscription_pricing" "main" {
  tier          = var.security_center_subscription_pricing_tier
  resource_type = var.security_resource_type
}

resource "azurerm_security_center_contact" "main" {
  email               = var.security_center_email
  phone               = var.security_center_phone
  alert_notifications = var.security_center_alert_notifications
  alerts_to_admins    = var.security_center_alerts_to_admins
}

resource "azurerm_security_center_setting" "main" {
  setting_name = var.security_center_setting_name
  enabled      = var.enable_security_center_setting
}

resource "azurerm_security_center_auto_provisioning" "main" {
  auto_provision = var.enable_security_center_auto_provisioning
}

#-----------------------------------------RESOURCE: RECOVERY SERVICE VAULT---------------------------------#
resource "azurerm_recovery_services_vault" "vault" {
  name = var.recovery_service_vault_name
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  sku                 = var.recovery_service_vault_sku
  soft_delete_enabled = var.recovery_soft_delete_enabled
}

#-----------------------------------------RESOURCE: VM BACKUP POLICY---------------------------------------#
resource "azurerm_backup_policy_vm" "example" {
  name                = var.backup_policy_vm_name
  resource_group_name = data.azurerm_resource_group.rg.name
  recovery_vault_name = azurerm_recovery_services_vault.vault.name
  
  backup {
    frequency = var.backup_frequency
    time      = var.backup_time
  }

  retention_daily {
    count = var.retention_daily_count
  }

}

resource "azurerm_backup_protected_vm" "vm1" {
  resource_group_name = data.azurerm_resource_group.rg.name
  recovery_vault_name = azurerm_recovery_services_vault.vault.name
  source_vm_id        = azurerm_linux_virtual_machine.example.id
  backup_policy_id    = azurerm_backup_policy_vm.example.id


}

#--------------------------------------------RESOURCES: FOR AZURE DISK ENCRYPTION-------------------------#
data "azurerm_client_config" "current" {}


resource "azurerm_key_vault" "example" {
  name                        = var.keyvault_name
  location                    = data.azurerm_resource_group.rg.location
  resource_group_name         = data.azurerm_resource_group.rg.name
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  sku_name                    = var.keyvault_sku_name
  enabled_for_disk_encryption = var.keyvault_enabled_for_disk_encryption
  #soft_delete_enabled         = true
  purge_protection_enabled = var.purge_protection_enabled
}

resource "azurerm_key_vault_key" "example" {
  name         = var.keyvault_key_name
  key_vault_id = azurerm_key_vault.example.id
  key_type     = var.key_type
  key_size     = var.key_size

  depends_on = [
    azurerm_key_vault_access_policy.example-user
  ]

  key_opts = [
    "decrypt",
    "encrypt",
    "sign",
    "unwrapKey",
    "verify",
    "wrapKey",
  ]
}
resource "azurerm_role_assignment" "disk-encryption-read-keyvault" {
  scope                = azurerm_key_vault.example.id
  role_definition_name = "Reader"
  principal_id         = data.azurerm_client_config.current.object_id
}
resource "azurerm_disk_encryption_set" "example" {
  name                = var.disk_encryption_name
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = data.azurerm_resource_group.rg.location
  key_vault_key_id    = azurerm_key_vault_key.example.id

  identity {
    type = var.disk_encryption_identity_type
  }
}

resource "azurerm_key_vault_access_policy" "example-disk" {
  key_vault_id = azurerm_key_vault.example.id

  tenant_id = azurerm_disk_encryption_set.example.identity.0.tenant_id
  object_id = azurerm_disk_encryption_set.example.identity.0.principal_id

  key_permissions = [
    "Get",
    "WrapKey",
    "UnwrapKey",
    "List",
    "Recover"
  ]
}

resource "azurerm_key_vault_access_policy" "example-user" {
  key_vault_id = azurerm_key_vault.example.id

  tenant_id = data.azurerm_client_config.current.tenant_id
  object_id = data.azurerm_client_config.current.object_id

  key_permissions = [
    "get",
    "create",
    "delete",
    "List",
    "Recover"
  ]
}
#---------------------------------------------------------------------------------------------------------#