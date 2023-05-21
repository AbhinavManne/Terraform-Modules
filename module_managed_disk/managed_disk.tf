resource "azurerm_disk_access" "daccess" { 
  count               = var.enable_disk_access ? 1 : 0
  name                = var.disk_access
  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = var.tags
}

resource "azurerm_managed_disk" "mdisk" {
  for_each                         = var.managed_disk
  name                             = each.key
  location                         = var.location
  resource_group_name              = var.resource_group_name
  storage_account_type             = lookup(each.value, "storage_account_type")
  create_option                    = lookup(each.value, "create_option")
  disk_encryption_set_id           = var.disk_encryption_set_id != null ? var.disk_encryption_set_id : null//lookup(each.value, "secure_vm_disk_encryption_set_id") == null ? lookup(each.value, "disk_encryption_set_id") : null
  disk_iops_read_write             = lookup(each.value, "disk_iops_read_write", null)
  disk_mbps_read_write             = lookup(each.value, "disk_mbps_read_write", null)
  disk_iops_read_only              = lookup(each.value, "disk_iops_read_only", null)
  disk_mbps_read_only              = lookup(each.value, "disk_mbps_read_only", null)
  disk_size_gb                     = lookup(each.value, "disk_size_gb", null)
  edge_zone                        = lookup(each.value, "edge_zone", null) 
  hyper_v_generation               = lookup(each.value, "create_option") == "Import" || lookup(each.value, "create_option") == "Copy" ? lookup(each.value, "hyper_v_generation") : null
  image_reference_id               = lookup(each.value, "create_option") == "FromImage" ? lookup(each.value, "image_reference_id") : null
  gallery_image_reference_id       = lookup(each.value, "gallery_image_reference_id", null)
  logical_sector_size              = lookup(each.value, "logical_sector_size", null)
  os_type                          = lookup(each.value, "os_type", null)
  source_resource_id               = lookup(each.value, "create_option") == "Copy" || lookup(each.value, "create_option") == "Restore" ? lookup(each.value, "source_resource_id") : null
  source_uri                       = lookup(each.value, "create_option") == "Import" ? lookup(each.value, "source_uri") : null
  storage_account_id               = lookup(each.value, "create_option") == "Import" || lookup(each.value, "storage_account_id") != null ? lookup(each.value, "storage_account_id") : null
  tier                             = lookup(each.value, "storage_account_type") == "Premium_ZRS" || lookup(each.value, "storage_account_type") == "Premium_LRS" ? lookup(each.value, "tier") : null
  max_shares                       = lookup(each.value, "max_shares", null)
  trusted_launch_enabled           = lookup(each.value, "create_option") == "Import" || lookup(each.value, "create_option") == "FromImage" ? lookup(each.value, "trusted_launch_enabled") : null
  security_type                    = lookup(each.value, "trusted_launch_enabled") == false ? lookup(each.value, "security_type") : null
  secure_vm_disk_encryption_set_id = var.disk_encryption_set_id  == null && lookup(each.value, "security_type") == "ConfidentialVM_DiskEncryptedWithCustomerKey" ? lookup(each.value, "secure_vm_disk_encryption_set_id") : null
  on_demand_bursting_enabled       = lookup(each.value, "on_demand_bursting_enabled", null)
  zone                             = lookup(each.value, "zone", null)
  network_access_policy            = var.network_access_policy //lookup(each.value, "network_access_policy")
  disk_access_id                   = var.network_access_policy == "AllowPrivate" ? azurerm_disk_access.daccess.0.id : null //lookup(each.value, "network_access_policy") == "AllowPrivate" ? lookup(each.value, "disk_access_id") : null
  public_network_access_enabled    = var.public_network_access_enabled//lookup(each.value, "public_network_access_enabled")

  dynamic "encryption_settings" { 
    for_each = lookup(each.value, "encryption_settings") != null ? lookup(each.value, "encryption_settings") : []
    content {
      enabled = encryption_settings.value.enabled 
      dynamic "disk_encryption_key" {
        for_each = encryption_settings.value.disk_encryption_key
        content {
          secret_url      = disk_encryption_key.value.secret_url
          source_vault_id = disk_encryption_key.value.source_vault_id
        }
      }
      dynamic "key_encryption_key" {
        for_each = encryption_settings.value.key_encryption_key
        content {
          key_url         = key_encryption_key.value.key_url
          source_vault_id = key_encryption_key.value.source_vault_id
        }
      }
    }
  }
  tags = var.tags
}


locals {
  managed_disk_id = {
    for disk in azurerm_managed_disk.mdisk :
    disk.name => disk.id
  }
}

resource "azurerm_virtual_machine_data_disk_attachment" "dda" {
  for_each                  = var.data_disk_attachment
  managed_disk_id           = lookup(local.managed_disk_id, each.key)
  virtual_machine_id        = var.virtual_machine_id
  lun                       = lookup(each.value, "lun")
  caching                   = lookup(each.value, "caching")
  create_option             = lookup(each.value, "create_option")
  write_accelerator_enabled = lookup(each.value, "write_accelerator_enabled")
}
