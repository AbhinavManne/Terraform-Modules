#---------------------  ---------------------RESOURCE: KEY VAULT SECRET------------------------------------------------#
data "azurerm_key_vault_secret" "password_secret" {
  name         = var.key_vault_secret_name
  key_vault_id = var.key_vault_id
}
#---------------------  ---------------------RESOURCE: WINDOWS VMSS------------------------------------------------#
resource "azurerm_windows_virtual_machine_scale_set" "wvmss" {
  name                = var.windows_vmss
  location            = var.location
  resource_group_name = var.resource_group_name
  admin_username      = data.azurerm_key_vault_secret.password_secret.name
  admin_password      = data.azurerm_key_vault_secret.password_secret.id
  instances           = var.vmss_instances
  sku                 = var.vmss_sku
  network_interface {
    name                          = var.network_interface
    primary                       = var.network_interface_primary
    network_security_group_id     = var.nsg_id
    dns_servers                   = var.dns_server
    enable_accelerated_networking = var.enable_accelerated_networking
    enable_ip_forwarding          = var.enable_ip_forwarding
    ip_configuration {
      name                                         = var.lb_frontend_ip_config
      primary                                      = var.ip_config_primary
      subnet_id                                    = var.subnet_id
      load_balancer_backend_address_pool_ids       = var.load_balancer_backend_address_pool_ids
      application_gateway_backend_address_pool_ids = var.application_gateway_backend_address_pool_ids
      application_security_group_ids               = var.application_security_group_ids
      load_balancer_inbound_nat_rules_ids          = var.load_balancer_inbound_nat_rules_ids
      dynamic "public_ip_address" {
        for_each = var.enable_public_ip_address ? [1] : []
        content {
          name                    = var.public_ip_address_name
          domain_name_label       = var.domain_name_label
          idle_timeout_in_minutes = var.idle_timeout_in_minutes
          public_ip_prefix_id     = var.public_ip_prefix_id
          # dynamic ip_tag {
          #   for_each = false ?[1]:[]
          #   content {
          #     tag = var.ip_tag 
          #     type = var.ip_tag_type
          #   }
          # }
        }
      }
    }
  }
  os_disk {
    caching              = var.os_disk_caching
    storage_account_type = var.os_disk_storage_account_type
    dynamic "diff_disk_settings" {
      for_each = var.diff_disk_settings_option != null && var.os_disk_caching == "ReadOnly" ? [1] : []
      content {
        option    = var.diff_disk_settings_option
        placement = var.diff_disk_settings_placement
      }
    }
    disk_encryption_set_id           = var.secure_vm_disk_encryption_set_id == null ? var.os_disk_encryption_set_id : null
    disk_size_gb                     = var.disk_size_gb
    security_encryption_type         = var.security_encryption_type
    secure_vm_disk_encryption_set_id = var.os_disk_encryption_set_id == null && var.security_encryption_type == "DiskWithVMGuestState" ? var.secure_vm_disk_encryption_set_id : null
    write_accelerator_enabled        = var.os_disk_storage_account_type == "Premium_LRS" && var.os_disk_caching == "None" ? var.write_accelerator_enabled : false
  }

  additional_capabilities {
    ultra_ssd_enabled = var.ultra_ssd_enabled
  }

  dynamic "additional_unattend_content" {
    for_each = var.content_additional_unattend_content != null && var.setting_additional_unattend_content != null ? [1] : []
    content {
      content = var.content_additional_unattend_content
      setting = var.setting_additional_unattend_content
    }
  }

  enable_automatic_updates = var.enable_automatic_updates
  upgrade_mode             = var.vmss_upgrade_mode
  health_probe_id          = var.vmss_upgrade_mode == "Automatic" || var.vmss_upgrade_mode == "Rolling" ? var.health_probe_id : null

  dynamic "automatic_os_upgrade_policy" {
    for_each = var.enable_automatic_os_upgrade_policy && var.enable_automatic_updates == false && var.vmss_upgrade_mode == "Automatic" && var.health_probe_id != null ? [1] : []
    content {
      disable_automatic_rollback  = var.disable_automatic_rollback
      enable_automatic_os_upgrade = var.enable_automatic_os_upgrade
    }
  }
  dynamic "automatic_instance_repair" {
    for_each = var.enable_automatic_instance_repair ? [1] : []
    content {
      enabled      = var.enable_automatic_instance_repair
      grace_period = var.grace_period_for_automatic_instance_repair
    }
  }
  dynamic "boot_diagnostics" {
    for_each = var.storage_account_uri != null ? [1] : []
    content {
      storage_account_uri = var.storage_account_uri
    }
  }

  capacity_reservation_group_id = var.proximity_placement_group_id == null ? var.capacity_reservation_group_id : null
  computer_name_prefix          = var.prefix
  custom_data                   = var.custom_data

  dynamic "data_disk" {
    for_each = var.add_data_disk ? [1] : []
    content {
      caching                = var.data_disk_caching
      create_option          = var.data_disk_create_option
      disk_size_gb           = var.data_disk_disk_size_gb
      lun                    = var.data_disk_lun
      storage_account_type   = var.data_disk_storage_account_type
      disk_encryption_set_id = var.data_disk_encryption_set_id
      #Disk Encryption Sets are in Public Preview in a limited set of regions
      # disk_iops_read_write = var.data_disk_storage_account_type == "UltraSSD"? var.data_disk_iops_read_write:null
      # disk_mbps_read_write = var.data_disk_storage_account_type == "UltraSSD"? var.data_disk_mbps_read_write:null
      write_accelerator_enabled = var.data_disk_storage_account_type == "Premium_LRS" && var.data_disk_create_option == "None" ? var.data_disk_write_accelerator_enabled : null
    }
  }
  do_not_run_extensions_on_overprovisioned_machines = var.do_not_run_extensions_on_overprovisioned_machines
  edge_zone                                         = var.edge_zone

  encryption_at_host_enabled = var.encryption_at_host_enabled && var.security_encryption_type != "DiskWithVMGuestState" ? true : false
  dynamic "extension" {
    for_each = var.ext_value != null ? var.ext_value : {}
    content {
      name                       = lookup(extension.value, "name")
      publisher                  = lookup(extension.value, "publisher")
      type                       = lookup(extension.value, "type")
      type_handler_version       = lookup(extension.value, "type_handler_version")
      auto_upgrade_minor_version = lookup(extension.value, "auto_upgrade_minor_version", null)
      automatic_upgrade_enabled  = lookup(extension.value, "automatic_upgrade_enabled", false)
      force_update_tag           = lookup(extension.value, "force_update_tag", null)
      protected_settings         = lookup(extension.value, "protected_settings", null)
      provision_after_extensions = lookup(extension.value, "provision_after_extensions", null)
      settings                   = lookup(extension.value, "settings", null)
    }
  }
  extensions_time_budget = var.extensions_time_budget
  eviction_policy        = var.priority == "Spot" ? var.eviction_policy : null

  dynamic "identity" {
    for_each = var.managed_identity_type != null ? [1] : []
    content {
      type         = var.managed_identity_type
      identity_ids = var.managed_identity_type == "UserAssigned" || var.managed_identity_type == "SystemAssigned, UserAssigned" ? var.managed_identity_ids : null
    }
  }
  license_type  = var.license_type
  max_bid_price = var.priority == "Spot" ? var.max_bid_price : null
  overprovision = var.overprovision

  # block is needed when you create custom marketplace image vms (like barracuda firewalls, or trendmicro servers, etc). basically anything that is not provided by microsoft (for the most part).
  dynamic "plan" {
    for_each = var.name_of_image != null && var.source_image_id == null && var.using_source_image_reference == false ? [1] : []
    content {
      name      = var.name_of_image
      publisher = var.publisher_of_image
      product   = var.product_of_image
    }
  }

  platform_fault_domain_count  = var.capacity_reservation_group_id == null ? var.platform_fault_domain_count : null
  priority                     = var.priority
  provision_vm_agent           = var.provision_vm_agent
  proximity_placement_group_id = var.proximity_placement_group_id

  dynamic "rolling_upgrade_policy" {
    for_each = (var.vmss_upgrade_mode == "Automatic" || var.vmss_upgrade_mode == "Rolling") && var.enable_rolling_upgrade_policy == true ? [1] : []
    content {
      max_batch_instance_percent              = var.max_batch_instance_percent
      max_unhealthy_instance_percent          = var.max_unhealthy_instance_percent
      max_unhealthy_upgraded_instance_percent = var.max_unhealthy_upgraded_instance_percent
      pause_time_between_batches              = var.pause_time_between_batches
    }
  }
  scale_in_policy = var.scale_in_policy


  dynamic "secret" {
    for_each = var.add_secret != null ? var.add_secret : {}
    content {
      key_vault_id = secret.value["key_vault_id"]
      dynamic "certificate" {
        for_each = secret.value["certificate"]
        content {
          store = certificate.value["store"]
          url   = certificate.value["url"] #Certificate Secret Identifier url
        }
      }
    }
  }

  secure_boot_enabled    = var.security_encryption_type != null ? true : false
  single_placement_group = var.capacity_reservation_group_id != null ? false : true

  source_image_id = var.using_source_image_reference == false && var.name_of_image == null && var.source_image_id != null ? var.source_image_id : null

  dynamic "source_image_reference" {
    for_each = var.source_image_id == null && var.name_of_image == null && var.using_source_image_reference == true ? [1] : []
    content {
      publisher = var.publisher_type
      offer     = var.offer_type
      sku       = var.sku_type
      version   = var.version_type
    }
  }

  dynamic "termination_notification" {
    for_each = var.terminate_notification_enabled ? [1] : []
    content {
      enabled = var.terminate_notification_enabled
      timeout = var.terminate_notification_timeout
    }
  }
  timezone     = var.timezone
  user_data    = var.user_data
  vtpm_enabled = var.security_encryption_type != null ? true : false

  dynamic "winrm_listener" {
    for_each = var.enable_winrm_listener ? [1] : []
    content {
      protocol = var.protocol
      #Must be specified when protocol is set to Https.
      certificate_url = var.protocol == "Https" ? var.certificate_url : null
    }
  }

  zone_balance = var.zone_balance
  zones        = var.zones
  tags         = var.tags
}
