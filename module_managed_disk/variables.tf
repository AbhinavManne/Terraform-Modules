variable "resource_group_name" {
  type        = string
  description = "Resource group name"
}

variable "location" {
  type        = string
  description = "The location/region to keep all your resources. To get the list of all locations with table format from azure cli, run 'az account list-locations -o table'"
}

variable "disk_access" {
  type        = string
  description = "Name of disk access resource on Azure Portal"
}

variable "enable_disk_access" {
  type        = bool
  description = "Wants to provision disk access resource?"
}

variable "disk_encryption_set_id" {
  type        = string
  description = "ID of Disk Encryption Set"
}

variable "managed_disk" {
  type = map(object({
    storage_account_type             = string
    create_option                    = string
    disk_iops_read_write             = string
    disk_mbps_read_write             = string
    disk_iops_read_only              = string
    disk_mbps_read_only              = string
    disk_size_gb                     = string
    edge_zone                        = string
    hyper_v_generation               = string
    image_reference_id               = string
    gallery_image_reference_id       = string
    logical_sector_size              = string
    os_type                          = string
    source_resource_id               = string
    source_uri                       = string
    storage_account_id               = string
    tier                             = string
    max_shares                       = string
    trusted_launch_enabled           = string
    security_type                    = string
    secure_vm_disk_encryption_set_id = string
    on_demand_bursting_enabled       = bool
    zone                             = string
    encryption_settings = list(object({
      enabled = bool
      disk_encryption_key = object({
        secret_url      = string
        source_vault_id = string
      })
      key_encryption_key = object({
        key_url         = string
        source_vault_id = string
      })
    }))

  }))
  description = "Managed disk block.Optional Arguments: disk_iops_read_write, disk_mbps_read_write, disk_iops_read_only, disk_mbps_read_only, disk_size_gb, edge_zone, encryption_settings block, hyper_v_generation, image_reference_id, gallery_image_reference_id, logical_sector_size, os_type, source_resource_id, source_uri, storage_account_id, tier, max_shares, trusted_launch_enabled, security_type, secure_vm_disk_encryption_set_id, on_demand_bursting_enabled,zone"
}

variable "network_access_policy" {
  type        = string
  description = "Policy for accessing the disk via network. Allowed values are AllowAll, AllowPrivate, and DenyAll."
}

variable "public_network_access_enabled" {
  type        = string
  description = "Wants to enable public network access?"
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resource."
}

variable "virtual_machine_id" {
  type        = string
  description = "VM ID"
}

variable "data_disk_attachment" {
  type = map(object({
    lun                       = number
    caching                   = string
    create_option             = string
    write_accelerator_enabled = string
  }))
  description = "data disk attachment. Optional arguments: create_option, write_accelerator_enabled"
}


