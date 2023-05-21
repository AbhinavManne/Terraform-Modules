variable "resource_group_name" {
  type        = string
  description = "Resource group name"
}

variable "location" {
  type        = string
  description = "The location/region to keep all your resources. To get the list of all locations with table format from azure cli, run 'az account list-locations -o table'"
}

variable "enable_disk_access" {
  type = bool
  description = "Wants to provision disk access resource?"
}

variable "disk_access" {
  type        = string
  description = "Name of disk access resource on Azure Portal"
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
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resource."
}

variable "virtual_machine_id" {
  type        = string
  description = "VM ID"
}

variable "network_access_policy" {
  type        = string
  description = "VM ID"
}

variable "public_network_access_enabled" {
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

}


#---------------------------------------
#  PRIVATE ENDPOINT MODULE
#---------------------------------------

variable "subnet_id" {
  type        = string
  description = "Id of subnet"
}

variable "private_endpoint_name" {
  type        = string
  description = "pvt endpoint name in Azure"
}

variable "private_service_connection_name" {
  type        = string
  description = "service connection name in Azure"
}

variable "subresource_names" {
  type        = list(string)
  description = "sub resources names in Azure"
}

variable "is_manual_connection" {
  type        = string
  description = "Status of manual connection "
}

variable "request_message" {
  type        = string
  description = "request msg"
}

variable "private_dns_zone_group" {
  type = object({
    name                 = string
    private_dns_zone_ids = list(string)
  })
  default = null
}

variable "private_connection_resource_alias" {
  type        = string
  description = "alias name"
}