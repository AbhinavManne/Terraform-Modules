variable "name" {
    type        = string
    description = "The name of the HPC Cache"
}

variable "resource_group_name" {
    type        = string
    description = "The name of the Resource Group in which to create the HPC Cache."
}

variable "location" {
    type        = string
    description = "Specifies the supported Azure Region where the HPC Cache should be created." 
}

variable "cache_size_in_gb" {
    type        = number
    description = "The size of the HPC Cache, in GB. Possible values are 3072, 6144, 12288, 21623, 24576, 43246, 49152 and 86491."
}

variable "subnet_id" { 
    type        = string
    description = "The ID of the Subnet for the HPC Cache."
}

variable "sku_name" {
    type        = string
    description = "The SKU of HPC Cache to use. Possible values are (ReadWrite) - Standard_2G, Standard_4G Standard_8G or (ReadOnly) - Standard_L4_5G, Standard_L9G, and Standard_L16G."
}

variable "mtu" {
    type        = number
    description = "The IPv4 maximum transmission unit configured for the subnet of the HPC Cache. Possible values range from 576 - 1500."
    default     = 1500
}

variable "default_access_policy_config" {
     type = list(object({
     access_rule_config = list(object({
            scope                   = string
            access                  = string 
            filter                  = string
            suid_enabled            = bool
            submount_access_enabled = bool
            root_squash_enabled     = bool
            anonymous_uid           = string
            anonymous_gid           = string
     }))
     }))
     default = [{
         access_rule_config = [{
            scope                   = "default"
            access                  = "no"
            filter                  = null
            suid_enabled            = false
            submount_access_enabled = false 
            root_squash_enabled     = false
            anonymous_uid           = null
            anonymous_gid           = null
     }]    
     }]
     description = "Default access policy parameteres values"
}

variable "ntp_server" {
    type        = string
    description = "The NTP server IP Address or FQDN for the HPC Cache."
    default     = "time.windows.com"
}

variable "dns_config" {
   type = list(object({
      servers       = list(string)
      search_domain = string
   }))
   default = [{
       servers       = null
       search_domain = null
   }] 
   description = "DNS parameteres values"  
}

variable "directory_active_directory_config" {
   type = list(object({
      dns_primary_ip      = string
      domain_name         = string
      cache_netbios_name  = string
      domain_netbios_name = string
      username            = string
      password            = string
      dns_secondary_ip    = string
   }))
   default = [{
      dns_primary_ip      = null
      domain_name         = null
      cache_netbios_name  = null
      domain_netbios_name = null
      username            = null
      password            = null
      dns_secondary_ip    = null
   }]
   description = "directory active directory parameteres values"
}


  variable "identity_config" {
      type = list(object({
        type                    = string
        identity_ids            = string
      }))
      default = [{
        type                    = null
        identity_ids            = null
      }]  
      description = "identity parameteres values"
  }

  variable "key_vault_key_id" {
        type        = string
        description = "The ID of the Key Vault Key which should be used to encrypt the data in this HPC Cache"
        default     = null
  }

  variable "automatically_rotate_key_to_latest_enabled" {
        type        = string
        description = "Specifies whether the HPC Cache automatically rotates Encryption Key to the latest version."
        default     = null
  }

  variable "tags" {
        type        = map(any)
        description = "A mapping of tags to assign to the HPC Cache."
        default     = null
  }