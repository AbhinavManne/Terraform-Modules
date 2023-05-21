
variable "location" {
  type        = string
  default     = null
  description = "###"
}

variable "nic_private_ip_address_allocation" {
  type        = string
  default     = null
  description = "###"
}

variable "subnet_name" {
  type        = string
  description = "###"
}

variable "vnet_name" {
  type        = string
  description = "###"
}

### Market Place ########

variable "publisher" {
  type        = string
  default     = null
  description = "###"
}

variable "offer" {
  type        = string
  default     = null
  description = "###"
}


variable "plan" {
  type        = string
  default     = null
  description = "###"
}

######VM Details ###########

variable "resource_group_name" {
  type        = string
  description = "RG name in Azure"
}



variable "storage_account_name" {
  type        = string
  description = "Storage account name in Azure"
}

variable "linux_virtual_machine_name" {
  type        = string
  description = "Linux VM name in Azure"
}

variable "linux_vm_size" {
  type        = string
  description = "The SKU which should be used for this Virtual Machine"
}

variable "os_disk_name" {
  type        = string
  description = "OS Disk name in Azure"
}

variable "os_disk_caching" {
  type        = string
  description = "The Type of Caching which should be used for the Internal OS Disk"
}

variable "storage_account_type" {
  type        = string
  description = "The Type of Storage Account which should back this the Internal OS Disk"
}

variable "source_image_publisher" {
  type        = string
  description = "Specifies the publisher of the image used to create the virtual machines"
}

variable "source_image_offer" {
  type        = string
  description = "Specifies the offer of the image used to create the virtual machines"
}

variable "source_image_sku" {
  type        = string
  description = "Specifies the SKU of the image used to create the virtual machines"
}

variable "source_image_version" {
  type        = string
  description = "Specifies the version of the image used to create the virtual machines"
}

variable "computer_name" {
  type        = string
  description = "Specifies the Hostname which should be used for this Virtual Machine"
}

variable "admin_username" {
  type        = string
  description = "Admin username"
}

variable "disable_password_authentication" {
  type        = bool
  description = "Should Password Authentication be disabled on this Virtual Machine"
}

variable "vm_plan_name" {
  type        = string
  description = "####"
}
variable "vm_publisher" {
  type        = string
  description = "####"
}
variable "vm_product" {
  type        = string
  description = "####"
}

################
variable "lb_name" {
  type        = string
  default     = null
  description = "###"
}

variable "lb_sku" {
  type        = string
  default     = null
  description = "###"
}

variable "lb_frontend_ip_name" {
  type        = string
  default     = null
  description = "###"
}

variable "private_ip_address_allocation" {
  type        = string
  default     = null
  description = "###"
}

variable "lb_probe_name" {
  type        = string
  default     = null
  description = "###"
}

variable "lb_probe_port" {
  type        = string
  default     = null
  description = "###"
}

variable "lb_backend_address_pool_name" {
  type        = string
  default     = null
  description = "###"
}

variable "lb_rule" {
  type        = string
  default     = null
  description = "###"
}

variable "lb_rule_protocol" {
  type        = string
  default     = null
  description = "###"
}

variable "lb_frontend_port" {
  type        = string
  default     = null
  description = "###"
}

variable "lb_backend_port" {
  type        = string
  default     = null
  description = "###"
}

variable "lb_subnet_name" {
  type        = string
  description = "###"
}

variable "lb_vnet_name" {
  type        = string
  description = "###"
}